import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/controller/addservice_controller.dart';
import 'package:sbs_app/pages/home_page.dart';

// ignore: must_be_immutable
class AddServiceComposer extends StatefulWidget {
  AddServiceComposer(this.sendService);

  final Function(
      {String categoria,
      String especialidade,
      String tempo,
      String valor,
      String cidade,
      String bairro,
      String rua,
      String numeroCasa,
      String userId}) sendService;

  @override
  _AddServiceComposerState createState() => _AddServiceComposerState();
}

class _AddServiceComposerState extends State<AddServiceComposer> {
  final _controller = AddServiceController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  _getCurrentUser() async {
    // ignore: await_only_futures
    final User user = await _auth.currentUser;
    final uid = user.uid;

    return uid;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Adicionar serviço",
          style: GoogleFonts.lato(fontSize: 30, color: Colors.white),
        ),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: widgetFormAdicionarServico(),
      ),
    );
  }

  widgetFormAdicionarServico() {
    return Form(
      key: _controller.formKey,
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFormField(
              controller: _controller.controllerTextcategoria,
              decoration: InputDecoration(
                labelText: "Categoria. Ex: Mãos/Pés, Cabelo...",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(25),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe sua Categoria";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              controller: _controller.controllerTextespecialidade,
              decoration: InputDecoration(
                labelText: "Especialidade. Ex: Manucure e pedicur ...",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(25),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe sua especialidade";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              maxLength: 20,
              controller: _controller.controllerTextCidade,
              decoration: InputDecoration(
                labelText: "Cidade",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe a cidade";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              maxLength: 20,
              controller: _controller.controllerTextBairro,
              decoration: InputDecoration(
                labelText: "Bairro",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe o bairro";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              maxLength: 30,
              controller: _controller.controllerTextRua,
              decoration: InputDecoration(
                labelText: "Rua",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe a rua";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              maxLength: 5,
              controller: _controller.controllerTextNumeroCasa,
              decoration: InputDecoration(
                labelText: "Numero",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe o numero";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              maxLength: 3,
              controller: _controller.controllerTexttempo,
              decoration: InputDecoration(
                labelText: "Tempo em minutos(Ex: 30, 40, 60...)",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe o tempo";
                }
                return null;
              },
            ),
          ),
          Divider(),
          Container(
            child: TextFormField(
              controller: _controller.controllerTextvalor,
              decoration: InputDecoration(
                labelText: "Preço \$",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(25),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe o preço";
                }
                return null;
              },
            ),
          ),
          Divider(),
          OutlinedButton(
              child: Text(
                "Publicar",
                style: GoogleFonts.lato(fontSize: 25, color: Colors.black),
              ),
              onPressed: () async {
                if (_controller.formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Serviço publicado com sucesso")));
                  widget.sendService(
                    categoria: _controller.controllerTextcategoria.text,
                    especialidade: _controller.controllerTextespecialidade.text,
                    tempo: _controller.controllerTexttempo.text,
                    valor: _controller.controllerTextvalor.text,
                    bairro: _controller.controllerTextBairro.text,
                    rua: _controller.controllerTextRua.text,
                    numeroCasa: _controller.controllerTextNumeroCasa.text,
                    cidade: _controller.controllerTextCidade.text,
                    userId: await _getCurrentUser(),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }
              }),
        ],
      )),
    );
  }
}
