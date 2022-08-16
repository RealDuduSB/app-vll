import 'package:flutter/material.dart';
import 'package:sbs_app/app/pages/addservice_page.dart';
import 'package:sbs_app/app/pages/chat_page.dart';
import 'package:sbs_app/app/pages/home_page.dart';
import 'package:sbs_app/app/pages/login_page.dart';
import 'package:sbs_app/app/pages/myservices_page.dart';

import '../pages/chatlist.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
        '/addService': (context) => AddServicePage(),
        '/meusServicos': (context) => MeusServicos(),
        '/chat': (context) => ChatField(),
        '/chatlist': (context) => ChatList(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
