import 'package:dagtalahdeliveryapp/Pages/AuthPages/OTPPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PageViewBuilderProvider.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: WillPopScope(
        child: Padding(
          padding: EdgeInsets.only(
            left: getWidth(context) * 30 / 380,
            right: getWidth(context) * 30 / 380,
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
                      Text('Welcome back!',
                          style: GoogleFonts.muli(
                              fontSize: 30, fontWeight: FontWeight.w900)),
                      Text('Please login to your account',
                        style: s13w300.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(top: getWidth(context) * 90 / 380),
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
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 50 / 380,
                    bottom: getWidth(context) * 10 / 380,
                  ),
                  child: FlatButton(
                    color: AppColors.main,
                    child: Text(
                      "Login",
                      style: s17w300.copyWith(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: getWidth(context) * 50 / 380,
                    minWidth: getWidth(context),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPPage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: getWidth(context) * 50 / 380),
                  child: Column(
                    children: [
                      TextButton(
                        child: Text(
                          "Skip",
                          style: TextStyle(color: AppColors.main),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => PageViewBuilderProvider(),), (route) => false);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
