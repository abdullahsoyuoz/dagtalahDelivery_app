import 'package:dagtalahdeliveryapp/Pages/PageViewBuilderProvider.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String phoneNumber;
  String phoneIsoCode;
  DateTime currentBackPressTime;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: getWidth(context) * 30/380,
          right: getWidth(context) * 30/380,
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                'assets/firegrill.png',
                width: getWidth(context) * 0.7,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                child: Column(
                  children: [
                    Text(
                      'Account',
                      style: GoogleFonts.muli(
                          fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Text('Complete your information', style: s13w300.copyWith(color: Colors.grey),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                      top: getWidth(context) * 50 / 380,
                      bottom: getWidth(context) * 20 / 380
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 1.5,
                        spreadRadius: 1.5,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  child: InternationalPhoneInput(
                    onPhoneNumberChange: onPhoneNumberChange,
                    initialPhoneNumber: phoneNumber,
                    initialSelection: phoneIsoCode,
                    enabledCountries: ['+966'],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Phone Number',
                      hintStyle: s13w300.copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: getWidth(context) * 20 / 380),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 1.5,
                        spreadRadius: 1.5,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Username Name',
                      hintStyle: s13w300.copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: getWidth(context) * 20 / 380),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 1.5,
                        spreadRadius: 1.5,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Email Address',
                      hintStyle: s13w300.copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 30/380,
                  bottom: getWidth(context) * 10/380,
                ),
                child: FlatButton(
                  child: Text('Save', style: s17w300.copyWith(color: Colors.white),),
                  height: getWidth(context) * 50/380,
                  minWidth: getWidth(context),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  color: AppColors.main,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageViewBuilderProvider() //OTPScreen()
                        ), (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
