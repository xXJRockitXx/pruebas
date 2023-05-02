import 'package:flutter/material.dart';

class Module_2 extends StatefulWidget {
  const Module_2({Key? key}) : super(key: key);

  @override
  State<Module_2> createState() => _Module_2State();
}

class _Module_2State extends State<Module_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Bienvenido al módulo 2",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
