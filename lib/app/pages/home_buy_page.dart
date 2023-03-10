import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/pages/car_details_page.dart';
import 'package:sbs_app/app/pages/car_find_page.dart';
import 'package:sbs_app/app/pages/choice_page.dart';
import 'package:flutter/services.dart';
import 'package:sbs_app/app/pages/home_buy_page_2.dart';

class HomeBuyPage extends StatefulWidget {
  final bool isActive;
  final Icon activeIcon;
  final Icon inactiveIicon;

  final void Function() onTap;
  const HomeBuyPage({
    Key key,
    this.isActive,
    this.activeIcon,
    this.inactiveIicon,
    this.onTap,
  }) : super(key: key);

  @override
  _HomeBuyPageState createState() => _HomeBuyPageState();
}

CollectionReference services =
    FirebaseFirestore.instance.collection('services');

class _HomeBuyPageState extends State<HomeBuyPage> {
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
    myFocusNode.dispose();
    myFocusNode1.dispose();
    myFocusNode2.dispose();
    myFocusNode3.dispose();
    myFocusNode4.dispose();
    myFocusNode5.dispose();

    super.dispose();
  }

  Future getServices() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("services").get();
    return qn.docs;
  }

  Widget build(BuildContext context) {
    bool isActive = false;
    bool switchValue = true;
    return Scaffold(
      backgroundColor: Color(0xFF001B43),
      drawer: Drawer(
        backgroundColor: Colors.lightGreenAccent,
        child: ListView(
          children: <Widget>[
            ListTile(
              tileColor: Colors.green,
              leading: Icon(
                Icons.settings,
                color: Colors.black,
                size: 15,
              ),
              title: Column(
                children: [
                  Text(
                    "Nome: ",
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    "Email: ",
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(Icons.add_to_home_screen_outlined, color: Colors.black),
              title: Text(
                "Entrar",
                style: GoogleFonts.lato(fontSize: 27, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoiceScreen()),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {
                
              }, icon: Icon(Icons.map_outlined)),
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Busca por placa',
                      style:
                          GoogleFonts.lato(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeBuyPage2()),
                        );
                      },
                      child: Text(
                        'Mudar para mercosul',
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset(
                    'images/placaantiga.png',
                  ).image,
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (text) {
                            if (text.length == 1) {
                              myFocusNode.requestFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textCapitalization: TextCapitalization.characters,
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                        child: TextFormField(
                          focusNode: myFocusNode,
                          autofocus: true,
                          onChanged: (text) {
                            if (text.length == 1) {
                              myFocusNode1.requestFocus();
                            }
                          },
                          textCapitalization: TextCapitalization.characters,
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                        child: TextFormField(
                          focusNode: myFocusNode1,
                          autofocus: true,
                          onChanged: (text) {
                            if (text.length == 1) {
                              myFocusNode2.requestFocus();
                            }
                          },
                          textCapitalization: TextCapitalization.characters,
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
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
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 165,
                padding: const EdgeInsets.only(top: 5, bottom: 10, right: 10),
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shadowColor: Colors.lightGreenAccent,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text(
                        "BUSCAR",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarFindPage()),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: services.snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) return CircularProgressIndicator();

                List<DocumentSnapshot> docs = snapshot.data.docs.toList();

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: InkWell(
                          onTap: () async {
                            print(docs[index].id.toString());
                            String docId = docs[index].id.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CarDetailsPage(
                                        docSnapshot: docId,
                                      )),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Image.asset("images/car_null.png",
                                      height: double.maxFinite),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                docs[index].get('marca') +
                                                    " - " +
                                                    docs[index].get('modelo'),
                                                style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(children: [
                                            Text(
                                                "Ano: " +
                                                    docs[index].get('ano'),
                                                style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                          ]),
                                          Row(
                                            children: [
                                              Text(
                                                  "R\$ " +
                                                      docs[index].get('valor') +
                                                      ",00",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;

  const RowFormatters({
    Key key,
    this.label,
    this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF008500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            label: Text(label),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            formatter,
          ],
        ),
      ),
    );
  }
}
