import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Module_1 extends StatefulWidget {
  const Module_1({Key? key}) : super(key: key);

  @override
  State<Module_1> createState() => _Module_1State();
}

class _Module_1State extends State<Module_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            "Bienvenido al módulo 1",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/video_screen");
                },
                child: const Text("Video")),
          ],
        )));
  }
}
