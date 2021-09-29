import 'package:dagtalahdeliveryapp/Pages/OrderPages/OrderSummaryPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCompletedPage extends StatefulWidget {
  @override
  _PaymentCompletedPageState createState() => _PaymentCompletedPageState();
}

class _PaymentCompletedPageState extends State<PaymentCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(context) * 20 / 380,
                right: getWidth(context) * 20 / 380,
              ),
              child: Container(
                  width: getWidth(context),
                  child: Image.asset("assets/images/cartCompleted.png")),
            ),
            Text("Congratulations", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.main),),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text("You Successfully Placed Your Order", style: s17w300.copyWith(color: Colors.grey),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text("Order Number: #000123345", style: s17w700.copyWith(color: Colors.black),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(context) * 20/380,
                vertical: getWidth(context) * 30/380,
              ),
              child: FlatButton(
                child: Center(child: Text("Order Status", style: s17w300.copyWith(color: Colors.white),),),
                height: getWidth(context) * 50/380,
                color: AppColors.main,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 15/380)),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => OrderSummaryPage(false),));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
