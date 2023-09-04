// ignore_for_file: camel_case_types, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';


import 'package:byd_app/widgets/curve.dart';
import 'package:byd_app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class Otp_Screen extends StatefulWidget {
  const Otp_Screen({super.key});

  @override
  State<Otp_Screen> createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
  Timer? time;
  bool enabled = false;
  int sec = 60;

  startTimerFun() {
    time = Timer.periodic(const Duration(seconds: 1), (second) {
      setState(() {
        if (sec == 0) {
          enabled = true;
          sec = 0;
        } else {
          sec -= 1;
        }
      });
    });
  }

  @override
  dispose() {
    super.dispose();
    if (time == 0) {
      time!.cancel();
    }
  }

  int num = 0;

  @override
  void initState() {
    startTimerFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.deepOrangeAccent[200],
                      height: MediaQuery.of(context).size.height / 1.35,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Image.asset(
                      "assets/images/login_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height / 1.4,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.height * 0.02,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.04),
                                  child: Text(
                                    "Hello, Welcome",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.waving_hand_rounded,
                                    color: Colors.yellow,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Otp Verification",
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Verifivcation Code",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            textAlign: TextAlign.center,
                            "We have sent the code verification to your register mobile number +91 XXXXXX2890",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: OTPTextField(
                            otpFieldStyle: OtpFieldStyle(
                                focusBorderColor: Colors.white,
                                backgroundColor: Colors.white),
                            keyboardType: TextInputType.number,
                            length: 4,
                            width: MediaQuery.of(context).size.width / 1.5,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 45,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 10,
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Didn't receive any code? ",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Align(
                          child: enabled == true
                              ? TextButton(
                                  onPressed: () {
                                    startTimerFun();
                                    setState(() {
                                      sec = 60;
                                      enabled = false;
                                    });
                                  },
                                  // onPressed:onClick,
                                  child: const Text(
                                    "Resend",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )
                              : Text(
                                  "Resend Code in $sec",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                        Center(
                          child: Custom_Button(
                            text: "Confirm",
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/homescreen');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: SvgPicture.asset("assets/images/login.svg"),
            )
          ],
        ),
      ),
    );
  }
}
