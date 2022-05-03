// ignore: avoid_web_libraries_in_flutter
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/register_controller.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final _controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _controller.formKey,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Beautee | REGISTRO",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  TextFormField(
                    controller: _controller.displayName,
                    decoration: const InputDecoration(
                      labelText: "Nome completo *",
                    ),
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Por favor digite o nome";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _controller.emailController,
                    decoration: const InputDecoration(
                      labelText: "e-mail *",
                    ),
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Por favor digite email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _controller.senhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Senha *",
                    ),
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Por favor digite a senha";
                      }
                      return null;
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: OutlinedButton(
                      onPressed: () {
                        if (_controller.formKey.currentState.validate()) {
                          _registerAcount();
                        }
                      },
                      child: Text(
                        "REGISTRAR",
                        style:
                            GoogleFonts.lato(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerAcount() async {
    final User user = (await _controller.auth.createUserWithEmailAndPassword(
            email: _controller.emailController.text,
            password: _controller.senhaController.text))
        .user;

    if (user != null) {
      if (user.emailVerified) {
        await user.sendEmailVerification();
      }
      // ignore: deprecated_member_use
      await user.updateProfile(displayName: _controller.displayName.text);

      final user1 = _controller.auth.currentUser;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomePage(
          user: user1,
        );
      }));
    }
  }
}
