import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbs_app/app/pages/car_details_page.dart';
import 'package:sbs_app/app/pages/choice_page.dart';
import 'package:flutter/services.dart';

class HomeBuyPage extends StatefulWidget {
  const HomeBuyPage({Key key}) : super(key: key);

  @override
  _HomeBuyPageState createState() => _HomeBuyPageState();
}

CollectionReference services =
    FirebaseFirestore.instance.collection('services');

class _HomeBuyPageState extends State<HomeBuyPage> {

  Future getServices() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("services").get();
    return qn.docs;
  }
  var textEditingController = TextEditingController(text: "");

  // String algumaString = textEditingController.toString().toUpperCase();
  var search = 'cabe';

  Widget build(BuildContext context) {
    bool switchValue;
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
        backgroundColor: Colors.deepOrange,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite)),
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
                      style: GoogleFonts.lato(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Mercosul',
                      style: GoogleFonts.lato(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Switch(
                    value: switchValue ??= true,
                    onChanged: (newValue) async {
                      setState(() => switchValue = newValue);
                    },
                    activeColor: Color(0xFF099A00),
                  ),
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 37, 3, 0),
                        child: TextFormField(
                          // controller:  textEditingController.toString().toUpperCase(),
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset(
                    'images/mercosul.jpeg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
                          // controller:  textEditingController.toString().toUpperCase(),
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: TextFormField(
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
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
                          // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          // return PlacingBids();
                          // }
                          child: Container(
                            width: 180,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Color(0xFF008500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF008500),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset("images/car_null.png",
                                      height: double.maxFinite),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                "Marca: " +
                                                    docs[index].get('marca'),
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

// OutlinedButton(
// style: OutlinedButton.styleFrom(
// backgroundColor: Colors.white),
// onPressed: () {},
// child: Row(
// children: [
// Image.asset(
// "images/carnull.png",
// width: 50,
// height: 50,
// ),
// Column(
// children: [
// Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Text(
// docs[index].get('categoria'),
// style: GoogleFonts.lato(
// fontSize: 14,
// color: Colors.black,
// ),
// ),
// ],
// ),
// Row(
// children: [
// Text(docs[index].get('especialidade'),
// style: GoogleFonts.lato(
// fontSize: 14,
// color: Colors.black,
// )),
// ],
// ),
// ],
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// Row(children: [
// Icon(
// Icons.timer_outlined,
// size: 14,
// color: Colors.black,
// ),
// Text(docs[index].get('tempo') + "min",
// style: GoogleFonts.lato(
// fontSize: 14,
// color: Colors.black,
// )),
// ]),
// Row(
// children: [
// Icon(
// Icons.attach_money,
// size: 14,
// color: Colors.black,
// ),
// Text(
// "R\$" +
// docs[index].get('valor') +
// ",00",
// style: GoogleFonts.lato(
// fontSize: 14,
// color: Colors.black,
// )),
// ],
// ),
// ],
// ),
// ],
// ),
// ],
// )),
