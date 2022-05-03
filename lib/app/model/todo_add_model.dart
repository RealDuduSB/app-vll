import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Todo {
  final int id;

  Todo({this.id});
}

Future<Todo> _estados() async {
  var url =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/11|12|13|14|15|16|17|21|22|23|24|25|26|27|28|29|31|32|33|35|41|42|43|50|51|52|53';
  var response = await http.get(Uri.parse(url));
  var json = (response.body);
  var todo = Todo();
  return todo;
}

/*Future<Todo> _cidades() async {
  var url =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/11|12|13|14|15|16|17|21|22|23|24|25|26|27|28|29|31|32|33|35|41|42|43|50|51|52|53';
  var response = await http.get(Uri.parse(url));
  var json = (response.body);
  var todo = Todo();
  return todo;
}*/
