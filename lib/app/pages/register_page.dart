import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/register_controller.dart';
import 'package:get/get.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final _controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001B43),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  "images/valluulogobranco.png",
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Form(
                  key: _controller.formKey,
                  child: Card(
                    color: Colors.green,
                    elevation: 5,
                    shadowColor: Colors.lightGreenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 10),
                              child: Text(
                                "Registrar",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _controller.displayName,
                            decoration: InputDecoration(
                              labelText: "Nome *",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 5.0),
                              ),
                            ),
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Por favor digite o nome";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _controller.emailController,
                            decoration: InputDecoration(
                              labelText: "email *",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 5.0),
                              ),
                            ),
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Por favor digite email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _controller.senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Senha *",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 5.0),
                              ),
                            ),
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Por favor digite a senha";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Repetir senha *",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 5.0),
                              ),
                            ),
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Por favor repita a senha";
                              }
                              return null;
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFF001B43),
                                shadowColor: Colors.blue,
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () {
                                if (_controller.formKey.currentState
                                    .validate()) {
                                  _registerAcount();
                                }
                              },
                              child: Text(
                                "REGISTRAR",
                                style: GoogleFonts.lato(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerAcount() async {
    try {
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
        Get.offAll(() => HomePage(user: user1));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Erro ao efetuar o registro"),
      ));

      print(e);
    }
  }
}

class erroCadastro implements Exception {}
