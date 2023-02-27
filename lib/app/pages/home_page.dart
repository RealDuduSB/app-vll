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
              leading:
                  Icon(Icons.notifications_active_rounded, color: Colors.black),
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
        backgroundColor: Colors.green,
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
        color: Color(0xFF001B43),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.green,
                    width: 150,
                    height: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddServicePage()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF001B43),
                            size: 30,
                          ),
                          Text(
                            "Publicar",
                            style: GoogleFonts.lato(
                                color: Color(0xFF001B43), fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    width: 150,
                    height: 150,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Color(0xFF001B43),
                                size: 30,
                              ),
                              Icon(
                                Icons.checklist,
                                color: Color(0xFF001B43),
                                size: 30,
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "SOLICITAR",
                              style: GoogleFonts.lato(
                                  color: Color(0xFF001B43), fontSize: 20),
                            ),
                          ),
                          Center(
                            child: Text(
                              "VISTORIA",
                              style: GoogleFonts.lato(
                                  color: Color(0xFF001B43), fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
