import 'dart:math';
import 'package:dagtalahdeliveryapp/Pages/OrderPages/OrderDetailPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  bool backButtonHave;
  OrderSummaryPage(this.backButtonHave);
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int rand = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text("Order Status", style: s22w700AppBarTitle.copyWith(color: Colors.white),),
        backgroundColor: AppColors.main,
        elevation: 0,
        centerTitle: true,
        leading: widget.backButtonHave ? AppBar().leading : SizedBox(),
      ),
      body: Container(
        width: getWidth(context),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: getWidth(context) *35/380),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(getWidth(context) * 35/380)
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(getWidth(context) * 35 / 380)),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Text(
                  "#000${FakeData.fakeOrderList[rand].orderNumber}",
                  style: s17w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 5 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Text("${FakeData.fakeOrderList[rand].date}", style: s13w300.copyWith(color: Colors.grey),),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10/380,
                  left: getWidth(context) * 10/380,
                  right: getWidth(context) * 10/380,
                ),
                child: Container(
                  width: getWidth(context),
                  padding: EdgeInsets.all(getWidth(context) * 10/380),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getWidth(context) * 10/380),
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(height: getWidth(context) * 50/380,),
                    itemCount: FakeData.fakeOrderList[rand].orderList.length,
                    itemBuilder: (context, index) {
                      return buildOrderSummaryItem(context, FakeData.fakeOrderList[3].orderList[index]);
                    },
                  ),
                ),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 10/380,
                  vertical: getWidth(context) * 30/380,
                ),
                padding: EdgeInsets.all(getWidth(context) * 10/380),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        getWidth(context) * 10 / 380),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal", style: s14w600,),
                        Text("78.00 SR",),
                      ],
                    ),
                    SizedBox(height: getWidth(context) * 5 / 380,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total after promo code", style: s14w600,),
                        Text("78.00 SR",),
                      ],
                    ),
                    SizedBox(height: getWidth(context) * 5 / 380,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Fee", style: s14w600,),
                        Text("15.00 SR",),
                      ],
                    ),
                    SizedBox(height: getWidth(context) * 5 / 380,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Estimated Tax", style: s14w600,),
                        Text("13.95 SR",),
                      ],
                    ),
                    Divider(thickness: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: s17w700,),
                        Text("106.95 SR", style: s17w700.copyWith(color: AppColors.main),),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20/380,
                  bottom: getWidth(context) * 20/380,
                  left: getWidth(context) * 20/380,
                  right: getWidth(context) * 20/380,
                ),
                child: FlatButton(
                  child: Center(
                    child: Text("Confirm Delivery", style: s17w300.copyWith(color: Colors.white),),
                  ),
                  color: AppColors.main,
                  height: getWidth(context) * 50/380,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 15/380)),
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => OrderDetailPage(FakeData.fakeOrderList[Random().nextInt(3)]),));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderSummaryItem(BuildContext context, FakeProduct item) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("${item.amount.toString()}X", style: s16w600,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("${item.title.toString()}", style: s16w600,),
                  ),
                ],
              ),
              Text("${item.price.toString()} SR", style: s14w600.copyWith(color: AppColors.main, fontWeight: FontWeight.w400),),
            ],
          ),
          item.extra != null
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 2,),
              RichText(
                  text: TextSpan(
                      text: "Modifiers: ",
                      style: TextStyle(color: AppColors.main),
                      children: [
                        TextSpan(
                            text: item.extra,
                            style: TextStyle(color: Colors.black))
                      ]))
            ],
          )
              : SizedBox()
        ],
      ),
    );
  }
}
