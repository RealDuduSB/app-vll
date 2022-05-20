import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddServiceController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerTextSearch = TextEditingController();
}
