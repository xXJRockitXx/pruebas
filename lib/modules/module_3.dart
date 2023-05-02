import 'package:flutter/material.dart';

class Module_3 extends StatefulWidget {
  const Module_3({Key? key}) : super(key: key);

  @override
  State<Module_3> createState() => _Module_3State();
}

class _Module_3State extends State<Module_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Bienvenido al módulo 3",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
