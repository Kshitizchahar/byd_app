// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeWidget extends StatelessWidget {
  const homeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink[100], borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width / 2.6,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          Image.asset("assets/images/res1.png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amritssorri",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      height: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Center(
                            child: Text(
                          "4.2 ⭐",
                          style: GoogleFonts.poppins(fontSize: 10),
                        )),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Satellite, Near Char Chowk, West Ahmedabad",
                  style: GoogleFonts.poppins(fontSize: 10),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
