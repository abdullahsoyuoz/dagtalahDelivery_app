import 'dart:async';
import 'package:dagtalahdeliveryapp/Pages/AuthPages/RegisterPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PageViewBuilderProvider.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _pincode1Controller;
  TextEditingController _pincode2Controller;
  TextEditingController _pincode3Controller;
  TextEditingController _pincode4Controller;
  FocusNode secondFocusNode;
  FocusNode thirdFocusNode;
  FocusNode fourthFocusNode;

  @override
  void initState() {
    super.initState();
    _pincode1Controller = new TextEditingController();
    _pincode2Controller = new TextEditingController();
    _pincode3Controller = new TextEditingController();
    _pincode4Controller = new TextEditingController();
    secondFocusNode = new FocusNode();
    thirdFocusNode = new FocusNode();
    fourthFocusNode = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _pincode1Controller.dispose();
    _pincode2Controller.dispose();
    _pincode3Controller.dispose();
    _pincode4Controller.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
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
              Padding(
                padding: EdgeInsets.only(
                  // top: getWidth(context) * 100/380,
                ),
                child: Image.asset(
                  'assets/firegrill.png',
                  width: getWidth(context) * 0.7,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 20/380),
                child: Column(
                  children: [
                    Text('Phone Verification', style: GoogleFonts.muli(fontSize: 30, fontWeight: FontWeight.w900)),
                    Text('Please enter the verification code\nsent to your phone.',
                      textAlign: TextAlign.center,
                      style: s13w300.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              buildPinCode(context),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 15/380),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Didn\'t receive OTP Code!', style: s13w300.copyWith(color: Colors.grey),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 60/380,
                  bottom: getWidth(context) * 10/380,
                ),
                child: FlatButton(
                  color: AppColors.main,
                  height: getWidth(context) * 50/380,
                  minWidth: getWidth(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Verify", style: s17w300.copyWith(color: Colors.white),),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage() //Home()
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildPinCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(context) * 40/380),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 1 Start
          Container(
            width: getWidth(context) * 50/380,
            height: getWidth(context) * 50/380,
            margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 10/415),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0,3),
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Center(
              child: TextField(
                controller: _pincode1Controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (v) {
                  FocusScope.of(context)
                      .requestFocus(secondFocusNode);
                },
              ),
            ),
          ),
          Container(
            width: getWidth(context) * 50/380,
            height: getWidth(context) * 50/380,
            margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 10/415),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0,3),
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: TextField(
              enabled: true,
              focusNode: secondFocusNode,
              controller: _pincode2Controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (v) {
                FocusScope.of(context)
                    .requestFocus(thirdFocusNode);
              },
            ),
          ),
          Container(
            width: getWidth(context) * 50/380,
            height: getWidth(context) * 50/380,
            margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 10/415),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0,3),
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: TextField(
              focusNode: thirdFocusNode,
              controller: _pincode3Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (v) {
                FocusScope.of(context)
                    .requestFocus(fourthFocusNode);
              },
            ),
          ),
          Container(
            width: getWidth(context) * 50/380,
            height: getWidth(context) * 50/380,
            margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 10/415),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0,3),
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: TextField(
              focusNode: fourthFocusNode,
              controller: _pincode4Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (v) {
                // loadingDialog();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageViewBuilderProvider()),
                );
              },
            ),
          ),
          // 4 End
        ],
      ),
    );
  }

  loadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 150.0,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpinKitPulse(
                  color: AppColors.main,
                  size: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getWidth(context) * 20/380
                  ),
                  child: Text('Please Wait..'),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
