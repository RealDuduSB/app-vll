import 'package:flutter/material.dart';

class FiltroPage extends StatefulWidget {
  @override
  _FiltroPageState createState() => _FiltroPageState();
}

String valueChoice;

class Estado {
  int id;
  String name;

  Estado(this.id, this.name);

  static List<Estado> getEstadoList() {
    return <Estado>[
      Estado(1, "Acre - AC"),
      Estado(2, "Alagoas - AL"),
      Estado(3, "Amapá - AP"),
      Estado(
        4,
        "Amazonas - AM",
      ),
      Estado(
        5,
        "Bahia - BA",
      ),
      Estado(
        6,
        "Ceará - CA",
      ),
      Estado(
        7,
        "Distrito Federal - DF",
      ),
      Estado(
        8,
        "Espírito Santo - ES",
      ),
      Estado(
        9,
        "Goiás - GO",
      ),
      Estado(
        10,
        "Maranhão - MA",
      ),
      Estado(
        11,
        "Mato Grosso - MT",
      ),
      Estado(
        12,
        "Mato Grosso do Sul - MS",
      ),
      Estado(
        13,
        "Minas Gerais - MG",
      ),
      Estado(
        14,
        "Pará - PA",
      ),
      Estado(
        15,
        "Paraíba - PB",
      ),
      Estado(
        16,
        "Paraná - PR",
      ),
      Estado(
        17,
        "Perambuco - PE",
      ),
      Estado(
        18,
        "Piauí - PI",
      ),
      Estado(
        19,
        "Rio de Janeiro - RJ",
      ),
      Estado(
        20,
        "Rio Grande do Norte - RN",
      ),
      Estado(
        21,
        "Rio Grande do Sul - RG",
      ),
      Estado(
        22,
        "Rondônia - RO",
      ),
      Estado(
        23,
        "Roraima - RR",
      ),
      Estado(
        24,
        "Santa Catarina - SC",
      ),
      Estado(
        25,
        "São Paulo - SP",
      ),
      Estado(
        26,
        "Sergipe - SE",
      ),
      Estado(27, "Tocantins - TO"),
    ];
  }
}

class _FiltroPageState extends State<FiltroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: [
                  Text("Estado: "),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
