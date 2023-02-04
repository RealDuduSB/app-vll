import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/add_car_composer.dart';

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
      {String marca,
      String modelo,
      String ano,
      String valor,
      String estado,
      String cidade,
      String idCar,
      String rua,
      String numeroCasa,
      String userId}) async {
    Map<String, dynamic> data = {};

    if (marca != null) data['marca'] = marca;
    if (modelo != null) data['modelo'] = modelo;
    if (ano != null) data['ano'] = ano;
    if (valor != null) data['valor'] = valor;
    if (userId != null) data['userId'] = userId;
    if (estado != null) data['estado'] = estado;
    if (cidade != null) data['cidade'] = cidade;
    if (idCar != null) data['idCar'] = idCar;
    if (rua != null) data['rua'] = rua;
    if (numeroCasa != null) data['numeroCasa'] = numeroCasa;
    services.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return AddCarComposer(_sendService);
  }
}
