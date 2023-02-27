import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeusServicos extends StatefulWidget {
  final User user;
  const MeusServicos({Key key, this.user}) : super(key: key);

  @override
  _MeusServicosState createState() => _MeusServicosState();
}

class _MeusServicosState extends State<MeusServicos> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  _getCurrentUser() {
    // ignore: await_only_futures
    final User user = _auth.currentUser;
    final uid = user.uid;
    return uid;
  }

  final pageViewController = PageController();

  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Meus anúncios",
          style: GoogleFonts.lato(fontSize: 30, color: Colors.white),
        ),
      ),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('services')
                .where('userId', isEqualTo: _getCurrentUser())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  List<DocumentSnapshot> docs = snapshot.data.docs.toList();

                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                          child: Column(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        docs[index].get('marca'),
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(docs[index].get('modelo'),
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
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
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    Text("Ano " + docs[index].get('ano'),
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: Colors.black,
                                        )),
                                  ]),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      Text(
                                          "R\$" +
                                              docs[index].get('valor') +
                                              ",00",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )));
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
