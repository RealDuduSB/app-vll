import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController displayName = TextEditingController();
  TextEditingController cpfUser = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  
}