import 'package:flutter/material.dart';

void main() => runApp(CodeChefVitBhopalApp());

class CodeChefVitBhopalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Image.asset(
            "/whiteLogo.png",
            scale: 3,
          ),
        ),
        body: Container(
          child: Center(
            child: Text("Hello world"),
          ),
        ),
      ),
    );
  }
}
