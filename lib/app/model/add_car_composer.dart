import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/add_car_controller.dart';
import '../pages/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddCarComposer extends StatefulWidget {
  AddCarComposer(this.sendService);

  final Function(
      {String marca,
      String modelo,
      String ano,
      String valor,
      String estado,
      String cidade,
      String idCar,
      String rua,
      String numeroCasa,
      String userId}) sendService;

  @override
  _AddCarComposerState createState() => _AddCarComposerState();
}

class _AddCarComposerState extends State<AddCarComposer> {
  final _controller = AddServiceController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  FocusNode myFocusNode;
  FocusNode myFocusNode1;
  FocusNode myFocusNode2;
  FocusNode myFocusNode3;
  FocusNode myFocusNode4;
  FocusNode myFocusNode5;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myFocusNode1 = FocusNode();
    myFocusNode2 = FocusNode();
    myFocusNode3 = FocusNode();
    myFocusNode4 = FocusNode();
    myFocusNode5 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    myFocusNode1.dispose();
    myFocusNode2.dispose();
    myFocusNode3.dispose();
    myFocusNode4.dispose();
    myFocusNode5.dispose();

    super.dispose();
  }

  List<String> items = [
    'Marca',
    'Adamo',
    'Agrale',
    'Alfa Romeo',
    "Americar",
    "Aston Martin",
    "Audi",
    "Beach",
    "Bentley",
    "Bianco",
    "BMW",
    "BRM",
    "Bugre",
    "Bugway",
    "BYD",
    "Cadillac",
    "Caoa Chery",
    "CBT",
    "Chamonix",
    "Cheda",
    "Chevrolet",
    "Chrysler",
    "Citroen",
    "Dodge",
    "Ferrari",
    "FIAT",
    "Ford",
    "GMC",
    "Gurgel",
    "Honda",
    "Hummer",
    "Hyundai",
    "Infiniti",
    "Iveco",
    "JAC",
    "Jaguar",
    "Jeep",
    "Kia",
    "Volkswagen",
  ];
  String marca = 'Marca';

  List<String> items2 = [
    'Modelo',
    "A1",
    "A2",
    "A3",
    "A4",
    "Astra",
    "Accord",
    "Actyon",
    "Actyon Sports",
    "Agile",
    "Aircross",
    "Alaskan",
    "Altima",
    "Amarok",
    "AMG GT",
    "Argo",
    "ASX",
    "Azera",
    "BA Falcon",
    "Baja",
    "Bakkie",
    "Bantam",
    "Barchetta",
    "Barracuda",
    "B-Class",
    "Be-1",
    "Beat",
    "Bébé",
    "Beetle",
    "Bel Air",
    "Belmont",
    "Belta",
  ];
  String modelo = 'Modelo';

  List<String> items3 = [
    'Ano',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
  ];

  String ano = 'Ano';
  List<String> items4 = [
    'Estado',
    "Acre",
    "Alagoas",
    "Amapá",
    "Amazonas",
    "Bahia",
    "Ceará",
    "Espírito Santo",
    "Goiás",
    "Maranhão",
    "Mato Grosso",
    "Mato Grosso do Sul",
    "Minas Gerais",
    "Pará",
    "Paraíba",
    "Paraná",
    "Pernambuco",
    "Piauí",
    "Rio de Janeiro",
    "Rio Grande do Norte",
    "Rio Grande do Sul",
    "Rondônia",
    "Roraima",
    "Santa Catarina",
    "São Paulo",
    "Sergipe",
    "Tocantins",
    "Distrito Federal"
  ];

  String estado = 'Estado';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _getCurrentUser() async {
    // ignore: await_only_futures
    final User user = await _auth.currentUser;
    final uid = user.uid;

    return uid;
  }

  idGenerator() async {
    final idCarTime = DateTime.now();
    return idCarTime.microsecondsSinceEpoch.toString();
  }

  final NumberFormat numFormat = NumberFormat("#,##0.00", "pt_BR");
  final NumberFormat numSanitizedFormat = NumberFormat("pt_BR");
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001B43),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Inserir anúncio",
          style: TextStyle(
              fontFamily: "Franklin Gothic Book",
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "Voltar",
                  style: TextStyle(
                      fontFamily: "Franklin Gothic Book",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              )),
        ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Color(0xFF001B43),
            width: double.maxFinite,
            height: 250,
            child: InkWell(
              onTap: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Nenhum arquivo selecionado")));
                  return null;
                }
                final path = results.files.single.path;
                final fileName = results.files.single.name;
                print(fileName);
                print(path);
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 20),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  dashPattern: [1, 5],
                  color: Colors.white,
                  strokeWidth: 2,
                  child: Card(
                    color: Colors.indigo[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance_rounded,
                            size: 70, color: Colors.green),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  "Incluir Fotos",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "0 de 8 fotos",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: Colors.green,
              elevation: 5,
              shadowColor: Colors.lightGreenAccent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      "Placa",
                      style: GoogleFonts.lato(fontSize: 26),
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0, bottom: 0, left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode.requestFocus();
                                  }
                                },
                                // controller:  textEditingController.toString().toUpperCase(),
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                textCapitalization:
                                    TextCapitalization.characters,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                minLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode,
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode1.requestFocus();
                                  }
                                },
                                textCapitalization:
                                    TextCapitalization.characters,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode1,
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode2.requestFocus();
                                  }
                                },
                                textCapitalization:
                                    TextCapitalization.characters,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode2,
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode3.requestFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            //mudança mercosul para antiga
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode3,
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode4.requestFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode4,
                                autofocus: true,
                                onChanged: (text) {
                                  if (text.length == 1) {
                                    myFocusNode5.requestFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                              child: TextFormField(
                                focusNode: myFocusNode5,
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                // controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.lato(
                                  color: Color(0xFF2B343A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
            child: Center(
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 10.0,
                      style: BorderStyle.solid,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: DropdownButton<String>(
                    value: marca,
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
                    onChanged: (item) => setState(() => marca = item),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
            child: Center(
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 10.0,
                      style: BorderStyle.solid,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: DropdownButton<String>(
                    value: modelo,
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
                    onChanged: (item2) => setState(() => modelo = item2),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
            child: Center(
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 10.0,
                      style: BorderStyle.solid,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: DropdownButton<String>(
                    value: ano,
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
                    onChanged: (item3) => setState(() => ano = item3),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
            child: Center(
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 10.0,
                      style: BorderStyle.solid,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: DropdownButton<String>(
                    value: estado,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    items: items4
                        .map((item4) => DropdownMenuItem(
                            value: item4,
                            child: Text(
                              item4,
                              style: GoogleFonts.lato(
                                  fontSize: 24.0, color: Colors.black),
                            )))
                        .toList(),
                    onChanged: (item4) => setState(() => estado = item4),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: _controller.controllerTextvalor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.white, backgroundColor: Color(0xFF001B43)),
                  prefixText: 'R\$ ',
                  labelText: "Preço R\$",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onFieldSubmitted: (price) {
                  final formattedPrice = numFormat.format(double.parse(price));
                  debugPrint('Formatted $formattedPrice');
                  _controller.controllerTextvalor.value = TextEditingValue(
                    text: formattedPrice,
                    selection:
                        TextSelection.collapsed(offset: formattedPrice.length),
                  );
                },
                validator: (String val) {
                  if (val == null || val.isEmpty) {
                    return "Por favor informe o preço";
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, right: 15, left: 15),
            child: Center(
              child: Container(
                width: 250,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.check_circle,
                            size: 45, color: Color(0xFF001B43)),
                        Text(
                          "Concluir (cadastrar veículo)",
                          style: GoogleFonts.lato(
                              color: Color(0xFF001B43),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (_controller.formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Anúncio publicado com sucesso")));
                        widget.sendService(
                          marca: _controller.controllerTextcategoria.text =
                              marca,
                          modelo: _controller.controllerTextespecialidade.text =
                              modelo,
                          ano: _controller.controllerTexttempo.text = ano,
                          valor: _controller.controllerTextvalor.text,
                          idCar: _controller.controllerTextIdCar.text =
                              await idGenerator(),
                          // rua: _controller.controllerTextRua.text,
                          // numeroCasa: _controller.controllerTextNumeroCasa.text,
                          // estado: _controller.controllerTextEstado.text =
                          //     estado,
                          // cidade: _controller.controllerTextCidade.text,
                          userId: await _getCurrentUser(),
                        );
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
