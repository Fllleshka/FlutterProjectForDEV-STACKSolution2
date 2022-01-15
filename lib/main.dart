import 'package:flutter/material.dart';
import 'package:devstack_second_solution/pages/loginIn.dart';
import 'package:devstack_second_solution/pages/goodAuth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/successlogin': (context) => SuccessfulLogin(),
      },
    );
  }
}