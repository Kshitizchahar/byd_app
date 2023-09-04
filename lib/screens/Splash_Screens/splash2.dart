// ignore_for_file: camel_case_types, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_two extends StatefulWidget {
  const Splash_two({super.key});

  @override
  State<Splash_two> createState() => _Splash_twoState();
}

class _Splash_twoState extends State<Splash_two> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xfffecd2), Color(0xfffcb69f)],
                begin: FractionalOffset(0.5, 0.0),
                end: FractionalOffset(0.0, 0.5))),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Book your Dine",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset("assets/images/splash_screen2.svg"),
                Text(
                  "Book Eat Repeat",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                      ' "Your Hassle-Free Restaurant Reservation App!" ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ),
                Text("Next",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
