// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_init_to_null, unused_field, use_build_context_synchronously

import 'dart:io';


import 'package:byd_app/widgets/crop_screen.dart';
import 'package:byd_app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Registration_Screen extends StatefulWidget {
  const Registration_Screen({super.key});

  @override
  State<Registration_Screen> createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  bool ischecked = true;
  int selectedValue = 1;

  final TextEditingController _dateController = TextEditingController();
  late DateTime selectedDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );

    if (datePicker != null) {
      setState(() {
        selectedDate = datePicker;
        _dateController.text = selectedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  File? _images = null;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _images = img;
        Navigator.of(context).pop();
      });
    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SelectPhotoOptionsScreen(
              onTap: _pickImage,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
// Initial selected country
    PhoneNumber phoneNumber = PhoneNumber(isoCode: 'IN');
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.redAccent.shade700,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text("Registration"),
          titleTextStyle: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.redAccent.shade700, Colors.black],
                        begin: FractionalOffset(0.1, 0.0),
                        end: FractionalOffset(0.1, 0.1))),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.height * 0.06),
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.height * 0.06),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showSelectPhotoOptions(context);
                              },
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.05,
                                backgroundColor: Colors.grey[400],
                                child: SvgPicture.asset(
                                  "assets/images/uploadingimg.svg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Upload Image",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text(
                              "Full Name",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter user name';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: Text(
                                  "Mobile Number",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, left: 5),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: InternationalPhoneNumberInput(
                                        onInputChanged: (PhoneNumber number) {},
                                        onInputValidated: (bool value) {},
                                        selectorConfig: SelectorConfig(
                                          selectorType: PhoneInputSelectorType
                                              .BOTTOM_SHEET,
                                        ),
                                        autoValidateMode:
                                            AutovalidateMode.disabled,
                                        selectorTextStyle:
                                            TextStyle(color: Colors.black),
                                        initialValue: phoneNumber,
                                        textFieldController:
                                            TextEditingController(),
                                        formatInput: true,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                signed: true, decimal: true),
                                        inputDecoration: InputDecoration(
                                            labelText: 'Phone Number',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: Text(
                                        "D.O.B",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: TextField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        hintText: "DD/MM/YYYY",
                                        hintStyle: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        prefixIcon: IconButton(
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () => _selectDate(context),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Select Food Preference",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Row(
                                  children: [
                                    SvgPicture.asset("assets/images/veg.svg"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Non Veg Only",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/nonveg.svg"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Non Veg Only",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Radio(
                                  value: 2,
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                ),
                              ),
                              Center(
                                  child: Custom_Button(
                                      text: "Confirm",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.pushReplacementNamed(
                                              context, '/homescreen');
                                        }
                                      }))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
