import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Series',
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.blue,
      ),
    );
  }
}
