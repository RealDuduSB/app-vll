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
          Container(
            width: double.maxFinite,
            height: 150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.image_not_supported_sharp,
                size: 45,
              ),
            ),
          ),
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
