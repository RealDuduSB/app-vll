import 'package:flutter/material.dart';
import 'package:sbs_app/app/pages/add_car_page.dart';
import 'package:sbs_app/app/pages/car_details_page.dart';
import 'package:sbs_app/app/pages/chat_page.dart';
import 'package:sbs_app/app/pages/home_page.dart';
import 'package:sbs_app/app/pages/login_page.dart';
import 'package:sbs_app/app/pages/myservices_page.dart';
import 'package:sbs_app/app/pages/user_page.dart';
import 'package:get/get.dart';

import '../pages/chatlist.dart';
import '../pages/choice_page.dart';
import '../pages/home_buy_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black,
          selectionHandleColor: Colors.black,
        ),
      ),
      initialRoute: '/homebuy',
      getPages: [
        GetPage(name: '/choices', page: () => ChoiceScreen()),
        GetPage(name: '/homebuy', page: () => HomeBuyPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/addService', page: () => AddServicePage()),
        GetPage(name: '/meusServicos', page: () => MeusServicos()),
        GetPage(name: '/chat', page: () => ChatField()),
        GetPage(name: '/chatlist', page: () => ChatList()),
        GetPage(name: '/userpage', page: () => UserPage()),
        GetPage(name: '/cardetail', page: () => CarDetailsPage()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
