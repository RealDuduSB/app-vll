import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sbs_app/model/addservice_composer.dart';

class AddServicePage extends StatefulWidget {
  final User user;

  const AddServicePage({Key key, this.user}) : super(key: key);
  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  CollectionReference services =
      FirebaseFirestore.instance.collection('services');
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _sendService(
      {String categoria,
      String especialidade,
      String tempo,
      String valor,
      String cidade,
      String bairro,
      String rua,
      String numeroCasa,
      String userId}) async {
    Map<String, dynamic> data = {};

    if (categoria != null) data['categoria'] = categoria;
    if (especialidade != null) data['especialidade'] = especialidade;
    if (tempo != null) data['tempo'] = tempo;
    if (valor != null) data['valor'] = valor;
    if (userId != null) data['userId'] = userId;
    if (cidade != null) data['cidade'] = cidade;
    if (bairro != null) data['bairro'] = bairro;
    if (rua != null) data['rua'] = rua;
    if (numeroCasa != null) data['numeroCasa'] = numeroCasa;
    services.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return AddServiceComposer(_sendService);
  }
}
