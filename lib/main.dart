
import 'package:flutter/material.dart';
import 'package:project_ar/views/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AR Flutter Demo',
      
      home: HomePage(),
    );
  }
}