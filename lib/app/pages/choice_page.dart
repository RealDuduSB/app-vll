import 'package:flutter/material.dart';
class ChoiceScreen extends StatefulWidget {
  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001B43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Compra e venda na valluu!",
                  style: TextStyle(
                      fontFamily: "Franklin Gothic Book",
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                    "Mais segurança e transparência em suas transações.",
                    style: TextStyle(
                        fontFamily: "Franklin Gothic Book",
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Container(
                  width: 250,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xFF008500),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFF00960C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Abrir conta como \n vendedor",
                            style: TextStyle(
                                fontFamily: "Franklin Gothic Book",
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text("Abra sua conta como usuário (comprar ou vender).",
                  style: TextStyle(
                      fontFamily: "Franklin Gothic Book",
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Container(
                  width: 250,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xFF16508F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFF16508F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          "Abrir sua conta como vistoriador",
                          style: TextStyle(
                              fontFamily: "Franklin Gothic Book",
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text("* Necessita de CNPJ e certificados",
                  style: TextStyle(
                      fontFamily: "Franklin Gothic Book",
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/homebuy');
                },
                child: Container(
                  width: 250,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xFF008500),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFF00960C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          "Entrar como \n convidado",
                          style: TextStyle(
                              fontFamily: "Franklin Gothic Book",
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image.asset(
                "images/valluulogobranco.png",
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
