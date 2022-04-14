import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Beautee",
            style: GoogleFonts.lato(fontSize: 30, color: Colors.white),
          ),
        ),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              withEmailPassword(),
              Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      _push(context, Registrar());
                    },
                    child: Text(
                      "Nao tem registro? Clique aqui",
                      style:
                          GoogleFonts.lato(fontSize: 25, color: Colors.black),
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
        elevation: 5,
        shadowColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller.emailController,
                decoration: InputDecoration(
                  labelText: "e-mail",
                  border: OutlineInputBorder(
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
              TextFormField(
                obscureText: true,
                controller: _controller.senhaController,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Por favor informe a senha!";
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                // ignore: missing_required_param
                child: OutlinedButton(
                  child: Text(
                    "ENTRAR",
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () async {
                    if (_controller.formKey.currentState.validate()) {
                      _signinWithEmailPassword();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signinWithEmailPassword() async {
    try {
      final User user = (await _controller.auth.signInWithEmailAndPassword(
              email: _controller.emailController.text,
              password: _controller.senhaController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MainPage(
          user: user,
        );
      }));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Erro ao efetuar o login"),
      ));
      print(e);
    }
  }
}

void _push(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}

/*

              Container(
                child: Text(
                  "Ou entao faça login com:",
                  style: GoogleFonts.lato(fontSize: 25, color: Colors.black),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  // make rounded corner of border
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(AntDesign.facebook_square),
                      color: Colors.white,
                      iconSize: 50,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(AntDesign.google),
                      color: Colors.white,
                      iconSize: 50,
                      onPressed: () {
                        
                      },
                    )
                  ],
                ),
              ),
*/