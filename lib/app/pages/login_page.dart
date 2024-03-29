import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _controller = LoginController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF001B43),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  "images/valluulogobranco.png",
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Vamos começar!",
                      style: TextStyle(
                          fontFamily: "Franklin Gothic Book",
                          color: Colors.white,
                          fontSize: 35),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mais segurança e transparência em sua compra e venda.",
                      style: TextStyle(
                          fontFamily: "Franklin Gothic Book",
                          color: Colors.white,
                          fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: withEmailPassword(),
              ),
              SizedBox(
                width: 15,
                height: 15,
              ),
              Container(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: () {
                      _push(context, Registrar());
                    },
                    child: Text(
                      "Nao tem registro? Clique aqui",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF001B43),
                      ),
                    ),
                  )),
              Divider(),
            ],
          ),
        ));
  }

  Widget withEmailPassword() {
    return Form(
      key: _controller.formKey,
      child: Card(
        color: Colors.green,
        elevation: 5,
        shadowColor: Colors.lightGreenAccent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _controller.emailController,
                  decoration: InputDecoration(
                    labelText: "e-mail",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red, width: 5.0),
                    ),
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Por favor informe o e-mail!";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                controller: _controller.senhaController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
                //                 decoration: InputDecoration(
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //         width: 3, color: Colors.greenAccent), //<-- SEE HERE
                //   ),
                // ),
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Por favor informe a senha!";
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(color: Colors.black),
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFF001B43),
                        shadowColor: Colors.blue,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      child: Text(
                        "ENTRAR",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_controller.formKey.currentState.validate()) {
                          _controller.signinWithEmailPassword();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _push(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}
