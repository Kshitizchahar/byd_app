import 'package:flutter/material.dart';

import 'screens/Home_Screens/home_screen.dart';
import 'screens/Login_Screens/login_screen.dart';
import 'screens/Login_Screens/otp_screen.dart';
import 'screens/Login_Screens/registration_screen.dart';
import 'screens/Splash_Screens/splash1.dart';
import 'screens/Splash_Screens/splash2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        routes: {
        '/splash_1': (context) => const Splash_one(),
        '/splash_2': (context) => const Splash_two(),
        '/login': (context) => const Login_Screens(),
        '/otp': (context) => const Otp_Screen(),
        '/registration': (context) => const Registration_Screen(),
        '/homescreen': (context) => const Home_Screen(),
      },
      home: Splash_one(),
    );
  }
}
