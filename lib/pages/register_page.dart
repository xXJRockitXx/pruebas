import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? mtoken = " ";
  String tok = " ";
  // Controladores del texto
  final _emailControl = TextEditingController();
  final _passwordControl = TextEditingController();
  final _confirmPasswordControl = TextEditingController();
  final _nameControl = TextEditingController();
  final _apellidoControl = TextEditingController();
  final _edadControl = TextEditingController();

  Future registrarse() async {
    if (passwordConfirmed()) {
      // Autenticando usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailControl.text.trim(),
          password: _passwordControl.text.trim());

      await FirebaseMessaging.instance.getToken().then((token) {
        setState(() {
          mtoken = token;
        });
        //saveToken(token!);
        agregarDatos(
            _nameControl.text.trim(),
            _apellidoControl.text.trim(),
            int.parse(_edadControl.text.trim()),
            _emailControl.text.trim(),
            token!);
      });

      //Agregamos datos del usuario
      /*agregarDatos(_nameControl.text.trim(), _apellidoControl.text.trim(),
          int.parse(_edadControl.text.trim()), _emailControl.text.trim());*/
    }
  }

  Future agregarDatos(
      String nombre, String apellido, int edad, String email, token) async {
    //getToken();
    await FirebaseFirestore.instance.collection("usuarios").add({
      "nombre": nombre,
      "apellido": apellido,
      "edad": edad,
      "email": email,
      "token": token,
    });
  }

  /*getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
      });
      //tok = token!;
      //saveToken(token!);
      //return token!;
    });
  }*/

  /*void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .add({"token": token});
  }*/

  bool passwordConfirmed() {
    if (_passwordControl.text.trim() == _confirmPasswordControl.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailControl.dispose();
    _passwordControl.dispose();
    _nameControl.dispose();
    _apellidoControl.dispose();
    _edadControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //HOla
                Text(
                  "Hola!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),

                Text(
                  "Ingresa tus datos abajo",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                //Nombre
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _nameControl,
                        decoration: InputDecoration(
                            hintText: "Nombre", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Apellido
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _apellidoControl,
                        decoration: InputDecoration(
                            hintText: "Apellidos", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Edad
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _edadControl,
                        decoration: InputDecoration(
                            hintText: "Edad", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailControl,
                        decoration: InputDecoration(
                            hintText: "Correo", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordControl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Contraseña", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Confirmar password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmPasswordControl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirmar Contraseña",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //Register button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: registrarse,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                //Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ya tengo cuenta!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        "  Iniciar sesión",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
