import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/pages/chat_page.dart';
import 'package:sbs_app/app/pages/myservices_page.dart';
import 'package:sbs_app/app/pages/user_page.dart';
import 'add_car_page.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

CollectionReference services =
    FirebaseFirestore.instance.collection('services');

class _HomePageState extends State<HomePage> {
  final pageViewController = PageController();

  Future getServices() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("services").get();
    return qn.docs;
  }

  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  var search = 'cabe';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        backgroundColor: Colors.lightGreenAccent,
        child: ListView(
          children: <Widget>[
            ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.settings, color: Colors.black, size: 15,),
              title: Column(
                children: [
                  Text(
                    "Nome: ${widget.user.displayName}",
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    "Nome: ${widget.user.email}",
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserPage(user: widget.user)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.checklist_rounded, color: Colors.black),
              title: Text(
                "Minhas Vistorias",
                style: GoogleFonts.lato(fontSize: 27, color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.black),
              title: Text(
                "Inserir anúncio",
                style: GoogleFonts.lato(fontSize: 27, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/addService');
              },
            ),
            ListTile(
              leading: Icon(Icons.campaign, color: Colors.black),
              title: Text("Meus anúncios",
                  style: GoogleFonts.lato(fontSize: 27, color: Colors.black)),
              onTap: () {
                Navigator.of(context).pushNamed('/meusServicos');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.black),
              title: Text("Favoritos",
                  style: GoogleFonts.lato(fontSize: 27, color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_active_rounded, color: Colors.black),
              title: Text("Notificações",
                  style: GoogleFonts.lato(fontSize: 27, color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.black),
              title: Text("Sair",
                  style: GoogleFonts.lato(fontSize: 27, color: Colors.black)),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money_rounded, color: Colors.black),
              title: Text("Pagamentos",
                  style: GoogleFonts.lato(fontSize: 27, color: Colors.black)),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/chatlist');
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/chatlist');
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/chatlist');
                  },
                  icon: Icon(Icons.notifications)),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(

      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,

          child: Container(
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.checklist_rounded),
              Text("Vistoriar", style: TextStyle(fontSize: 10),),
            ],),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddServicePage()),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

/*Expanded(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('services').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) return CircularProgressIndicator();

                List<DocumentSnapshot> docs = snapshot.data.docs.toList();

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      docs[index].get('categoria'),
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(docs[index].get('especialidade'),
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  Text(docs[index].get('tempo') + "min",
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.black,
                                      )),
                                ]),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money,
                                      size: 14,
                                      color: Colors.black,
                                    ),
                                    Text(
                                        "R\$" +
                                            docs[index].get('valor') +
                                            ",00",
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      docs[index].get('bairro'),
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ));
                  },
                );
              },
            )),*/
