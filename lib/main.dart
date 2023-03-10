import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sbs_app/app/widgets/app_widget.dart';

Future<void> main() async {
  final apiKey = await rootBundle.loadString('assets/api_key.txt');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
