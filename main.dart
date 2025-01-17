import 'package:crud/screens/ProductCreateScreen.dart';
import 'package:crud/screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:crud/screens/ProductUpdateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD App',
      home: ProductGridViewScreen(),
    );
  }
}

