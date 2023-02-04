import 'package:flutter/material.dart';
import 'package:sbs_app/app/pages/add_car_page.dart';
import 'package:sbs_app/app/pages/car_details_page.dart';
import 'package:sbs_app/app/pages/chat_page.dart';
import 'package:sbs_app/app/pages/home_page.dart';
import 'package:sbs_app/app/pages/login_page.dart';
import 'package:sbs_app/app/pages/myservices_page.dart';
import 'package:sbs_app/app/pages/user_page.dart';

import '../pages/chatlist.dart';
import '../pages/choice_page.dart';
import '../pages/home_buy_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black,
          selectionHandleColor: Colors.black,
        ),
      ),
      initialRoute: '/homebuy',
      routes: {
        '/choices': (context) => ChoiceScreen(),
        '/homebuy': (context) => HomeBuyPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
        '/addService': (context) => AddServicePage(),
        '/meusServicos': (context) => MeusServicos(),
        '/chat': (context) => ChatField(),
        '/chatlist': (context) => ChatList(),
        '/userpage': (context) => UserPage(),
        '/cardetail': (context) => CarDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
