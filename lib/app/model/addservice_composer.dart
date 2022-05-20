import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/model/todo_add_model.dart';
import '../controller/addservice_controller.dart';
import '../pages/home_page.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class AddServiceComposer extends StatefulWidget {
  AddServiceComposer(this.sendService);

  final Function(
      {String categoria,
      String especialidade,
      String tempo,
      String valor,
      String estado,
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
  List<String> items = ['Categoria', 'Mãos e pés', 'Pele', 'Cabelo'];
  String categoria = 'Categoria';

  List<String> items2 = [
    'Especialidade',
    'Manicure e pedicure',
    'Esteticista',
    'Corte masculino',
    'Corte feminino',
    'Corte infantil'
  ];
  String especialidade = 'Especialidade';

  List<String> items3 = [
    'Tempo',
    'até 20 min',
    '20 min a 30 min',
    '30 min a 40 min',
    '40 min a 50 min',
    '50 min a 60 min',
    '1h a 1:30',
  ];

  String tempo = 'Tempo';
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
          Divider(),
          Container(
            child: SizedBox(
              width: 240,
              child: DropdownButton<String>(
                value: categoria,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                items: items
                    .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.lato(
                              fontSize: 24.0, color: Colors.black),
                        )))
                    .toList(),
                onChanged: (item) => setState(() => categoria = item),
              ),
            ),
          ),
          SizedBox(
            width: 240,
            child: Container(
              child: DropdownButton<String>(
                value: especialidade,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                items: items2
                    .map((item2) => DropdownMenuItem(
                        value: item2,
                        child: Text(
                          item2,
                          style: GoogleFonts.lato(
                              fontSize: 24.0, color: Colors.black),
                        )))
                    .toList(),
                onChanged: (item2) => setState(() => especialidade = item2),
              ),
            ),
          ),
          SizedBox(
            width: 240,
            child: Container(
              child: DropdownButton<String>(
                value: tempo,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                items: items3
                    .map((item3) => DropdownMenuItem(
                        value: item3,
                        child: Text(
                          item3,
                          style: GoogleFonts.lato(
                              fontSize: 24.0, color: Colors.black),
                        )))
                    .toList(),
                onChanged: (item3) => setState(() => tempo = item3),
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller.controllerTextvalor,
              decoration: InputDecoration(
                prefixText: 'R\$',
                labelText: "Preço \$",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
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
          Container(
            child: TextFormField(
              controller: _controller.controllerTextEstado,
              decoration: InputDecoration(
                labelText: "Estado (Apenas sigla)",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
              ],
              validator: (String val) {
                if (val == null || val.isEmpty) {
                  return "Por favor informe o ESTADO";
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
                    categoria: _controller.controllerTextcategoria.text =
                        categoria,
                    especialidade: _controller
                        .controllerTextespecialidade.text = especialidade,
                    tempo: _controller.controllerTexttempo.text = tempo,
                    valor: _controller.controllerTextvalor.text,
                    bairro: _controller.controllerTextBairro.text,
                    rua: _controller.controllerTextRua.text,
                    numeroCasa: _controller.controllerTextNumeroCasa.text,
                    estado: _controller.controllerTextEstado.text,
                    cidade: _controller.controllerTextCidade.text,
                    userId: await _getCurrentUser(),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              }),
        ],
      )),
    );
  }
}

/*

class Todo {
  final int id;

  Todo({this.id});
}

Future<Todo> _estados() async {
  var url =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/11|12|13|14|15|16|17|21|22|23|24|25|26|27|28|29|31|32|33|35|41|42|43|50|51|52|53';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo(id: json['id']);
  return todo;
}
 */
/*
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
*/