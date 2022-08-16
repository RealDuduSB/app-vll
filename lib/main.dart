import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sbs_app/app/widgets/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
