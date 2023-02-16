import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/pages/choice_page.dart';
import 'package:flutter/services.dart';

class CarFindPage extends StatelessWidget {
  final String docSnapshot;

  const CarFindPage({this.docSnapshot});

  @override
  Widget build(BuildContext context) {
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
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Image.asset(
              "images/valluulogobranco.png",
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('services')
                .where(FieldPath.documentId, isEqualTo: docSnapshot)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  List<DocumentSnapshot> docs = snapshot.data.docs.toList();
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color(0xFF008500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Color(0xFF008500),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: Image.asset("images/car_null.png",
                            //       height: double.maxFinite),
                            // ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Detalhes",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Marca: " + docs[index].get('marca'),
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Modelo: " +
                                                docs[index].get('marca'),
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(children: [
                                      Text("Ano: " + docs[index].get('ano'),
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {},
        label: Text(
          "Pedir mais informações ao proprietário",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
