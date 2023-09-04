// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:byd_app/widgets/homeWidget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List img = [
    1,
    2,
    3,
    2,
  ];
  List type = ["Lunch", "Dinner", "Party", "Near me"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    Row(
                      children: [
                        Image.asset("assets/images/img.png"),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.notifications),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.redAccent[700],
                    ),
                    Text(
                      "Ahmedabad, Gujarat",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/food.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Dine in",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/food4.png",
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Take away",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  "Hii! Seamlessly Reserve Tables",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: img.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                              radius: 35,
                              child: Image.asset(
                                "assets/images/food${img[index]}.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              type[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Highly Recommended    ---->",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red, width: 0.5),
                      ),
                      height: 35,
                      width: 60,
                      child: Center(child: Text("View all")),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    homeWidget(),
                    homeWidget(),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Popular Collection    ---->",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red, width: 0.5),
                      ),
                      height: 35,
                      width: 60,
                      child: Center(child: Text("View all")),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    homeWidget(),
                    homeWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
