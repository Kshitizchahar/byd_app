// ignore_for_file: file_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Custom_Button({super.key,required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.height / 3,
              MediaQuery.of(context).size.height * 0.06),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Color(0xffEC1D23)),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
