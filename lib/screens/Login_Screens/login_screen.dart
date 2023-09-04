// ignore_for_file: unnecessary_new, prefer_const_constructors, camel_case_types


import 'package:byd_app/widgets/curve.dart';
import 'package:byd_app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Screens extends StatefulWidget {
  const Login_Screens({super.key});

  @override
  State<Login_Screens> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screens> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
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
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: WaveClipper(),
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
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.01),
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
                            "Log In!",
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "User Name",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TextFormField(
                                controller: _nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter user name';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "Mobile Number",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter phone number';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: Center(
                                child: Custom_Button(
                                    text: "Login",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushNamed(context, '/otp');
                                      }
                                    })),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registration');
                                  },
                                  child: Text(
                                    "Registration",
                                    style: GoogleFonts.poppins(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                        fontSize: 16,
                                        color: Colors.white),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
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
      ),
    );
  }
}
