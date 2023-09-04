// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash_one extends StatefulWidget {
  const Splash_one({super.key});

  @override
  State<Splash_one> createState() => _Splash_oneState();
}

class _Splash_oneState extends State<Splash_one> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, '/splash_2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            "assets/images/splash_screen1.svg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
