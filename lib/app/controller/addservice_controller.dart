import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddServiceController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerTextcategoria = TextEditingController();
  final TextEditingController controllerTextespecialidade =
      TextEditingController();
  final TextEditingController controllerTexttempo = TextEditingController();
  final TextEditingController controllerTextvalor = TextEditingController();
  final TextEditingController controllerTextUserId = TextEditingController();
  final TextEditingController controllerTextEstado = TextEditingController();
  final TextEditingController controllerTextCidade = TextEditingController();
  final TextEditingController controllerTextBairro = TextEditingController();
  final TextEditingController controllerTextRua = TextEditingController();
  final TextEditingController controllerTextNumeroCasa =
      TextEditingController();
}
