import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController displayName = TextEditingController();
  TextEditingController cpfUser = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void signinWithEmailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: senhaController.text);
      Get.off(HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Erro", "Usuário não encontrado",
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Erro", "Senha incorreta",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }
}
