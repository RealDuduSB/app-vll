import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/pages/choice_page.dart';
import 'package:flutter/services.dart';

class CarDetailsPage extends StatelessWidget {
  final String docSnapshot;

  const CarDetailsPage({this.docSnapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001B43),
      // title: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('services')
      //       .where(FieldPath.documentId, isEqualTo: docSnapshot)
      //       .snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.data == null) return CircularProgressIndicator();
      //     return ListView.builder(
      //       itemCount: snapshot.data.docs.length,
      //       itemBuilder: (context, index) {
      //         List<DocumentSnapshot> docs = snapshot.data.docs.toList();
      //         return Text(
      //           docs[index].get('marca'),
      //           style: GoogleFonts.lato(
      //             fontSize: 10,
      //             color: Colors.black,
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_left,
                  size: 32,
                  color: Colors.green,
                ),
              ),
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
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.green,
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
                                                docs[index].get('modelo'),
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
        color: Colors.green,
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
