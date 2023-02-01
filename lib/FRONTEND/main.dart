import 'package:flutter/material.dart';
import 'package:food/FRONTEND/LOGIN.dart';
import 'package:food/FRONTEND/MENU.dart';
import 'package:food/FRONTEND/ORDERS.dart';
import 'package:food/FRONTEND/SUMMARY.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // key: Navigation.appNavigation,
      initialRoute: "/",
      routes: {
        '/' : (context) => const Login(),
        '/menu': (context) => const Menu(),
        '/home': (context) => const Orders(),
      },
    );
  }

}
