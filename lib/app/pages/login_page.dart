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
      backgroundColor: Color.fromARGB(25, 32, 47, 66),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset("images/valluulogobranco.png", height: 100,fit: BoxFit.cover,),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                    child: Text("Vamos começar!", style: TextStyle(fontFamily: "Franklin Gothic Book", color: Colors.white, fontSize: 35),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Mais segurança e transparência em sua compra e venda.", style: TextStyle(fontFamily: "Franklin Gothic Book", color: Colors.white, fontSize: 15),)),
              ),

              SizedBox(height: 25,),
              Padding(padding: const EdgeInsets.only(left: 15.0, right: 15), child: withEmailPassword(),),
              SizedBox(width: 15, height: 15,),
              Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      _push(context, Registrar());
                    },
                    child: Text(
                      "Nao tem registro? Clique aqui",
                      style:
                          TextStyle(fontSize: 25, color: Colors.white),
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
        color: Colors.orangeAccent[100],
        elevation: 5,
        shadowColor: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
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
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: Text("Esqueceu sua senha?", style: TextStyle(color: Colors.black),)),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
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
        return HomePage(
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

              
void _handleFirebaseLoginWithCredentialsException(
    FirebaseAuthException e, StackTrace s) {
  if (e.code == 'user-disabled') {
    //'O usuário informado está desabilitado.'
  } else if (e.code == 'user-not-found') {
    //'O usuário informado não está cadastrado.'
  } else if (e.code == 'invalid-email') {
    //'O domínio do e-mail informado é inválido.'
  } else if (e.code == 'wrong-password') {
    //'A senha informada está incorreta.'
  } else {
    //Outro problema
  }
}
*/