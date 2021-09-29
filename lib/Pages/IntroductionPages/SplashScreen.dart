import 'dart:async';
import 'package:dagtalahdeliveryapp/Pages/AuthPages/LoginPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/firegrill.png',
                width: 200.0,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 30/380),
                child: SpinKitPulse(
                  color: AppColors.main,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
