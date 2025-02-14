import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Flutter Demo'),
      ),
      body: ARView(
        // Callback hanya menerima satu parameter: ARSessionManager
        onARViewCreated:(onARViewCreated) => ARSessionManager.new,
      ),
    );
  }

  // Callback sekarang hanya menerima satu parameter
  void onARViewCreated(ARSessionManager sessionManager) {
    arSessionManager = sessionManager;

    // Inisialisasi sesi AR
    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "triangle.png",
      showWorldOrigin: true,
    );

    // Inisialisasi ARObjectManager secara manual
    arObjectManager = ARObjectManager(1);
    arObjectManager.onInitialize();

    // Tambahkan objek kubus di AR
    _addCube();
  }

  void _addCube() async {
    var node = ARNode(
      type: NodeType.webGLB,
      uri: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Box/glTF/Box.gltf",
      scale: Vector3(0.2, 0.2, 0.2),
      position: Vector3(0.0, 0.0, -1.0),
    );
    await arObjectManager.addNode(node);
  }

  @override
  void dispose() {
    // Hanya dispose ARSessionManager
    arSessionManager.dispose();
    super.dispose();
  }
}
