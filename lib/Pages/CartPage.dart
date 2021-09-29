import 'package:dagtalahdeliveryapp/Pages/PaymentPages/NewPaymentPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PaymentPages/PaymentCompletedPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'PageViewBuilderProvider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ScrollController _singleChildScrollController = new ScrollController();
  int _dropDownValue;
  FocusNode _promoNode;

  @override
  void initState() {
    super.initState();
    _promoNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _promoNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        elevation: 0,
        title: Text(
          "Cart",
          style: s22w700AppBarTitle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Container(
        width: getWidth(context),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: AppColors.backgroundColor),
        child: FakeData.fakeCartList.isEmpty
            ? Center(
              child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: Container(
                          width: getWidth(context),
                          child: Image.asset("assets/images/cartEmpty.png")),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: getWidth(context) * 70 / 380),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "No Items in the Cart",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.dark),
                            ))),
                    Padding(
                        padding:
                            EdgeInsets.only(top: getWidth(context) * 20 / 380),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your cart is empty. Add some\nitems to see it here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade600),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getWidth(context) * 40 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: FlatButton(
                        child: Center(
                          child: Text(
                            "Add To Cart",
                            style: s17w300.copyWith(color: Colors.white),
                          ),
                        ),
                        color: AppColors.main,
                        height: getWidth(context) * 50 / 380,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                getWidth(context) * 10 / 380)),
                        onPressed: () {
                          setState(() {
                            // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => PageViewBuilderProvider(viewIndex: 1,),), (route) => false);
                          });
                        },
                      ),
                    )
                  ],
                ),
            )
            : ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) * 40 / 380,
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(left: getWidth(context) * 10 / 380),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ]),
                    child: Text(
                      "Deliver to: Al Olaya, Riyadh 11321",
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 10 / 380,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: FakeData.fakeCartList.length,
                      itemBuilder: (context, index) =>
                          CartItem(FakeData.fakeCartList[index]),
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    padding: EdgeInsets.symmetric(
                        vertical: getWidth(context) * 10 / 380),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: getWidth(context) * 10/380,
                            right: getWidth(context) * 80/380,
                          ),
                          child: TextField(
                            focusNode: _promoNode,
                            style: s13w300.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(getWidth(context) * 10/380)
                              ),
                              hintText: "Enter Promo Code",
                              hintStyle: s13w300.copyWith(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              isDense: true
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: getWidth(context) * 80 / 380,
                            height: getWidth(context) * 40/380,
                            margin: EdgeInsets.only(
                                right: getWidth(context) * 10 / 380),
                            child: FlatButton(
                              color: AppColors.main,
                              height: getWidth(context) * 50 / 380,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getWidth(context) * 10 / 380)),
                              child: Center(
                                child: Text(
                                  "Add",
                                  style:
                                      s17w300.copyWith(color: Colors.white),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    margin: EdgeInsets.only(
                      top: getWidth(context) * 10 / 380,
                      bottom: getWidth(context) * 20 / 380,
                      left: getWidth(context) * 10 / 380,
                      right: getWidth(context) * 10 / 380,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context) * 15 / 380,
                      vertical: getWidth(context) * 20 / 380,
                    ),
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
                        Divider(
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: s17w700,
                            ),
                            Text(
                              "106.95 SR",
                              style: s17w700.copyWith(color: AppColors.main),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    margin: EdgeInsets.only(
                      top: getWidth(context) * 10 / 380,
                      bottom: getWidth(context) * 20 / 380,
                      left: getWidth(context) * 10 / 380,
                      right: getWidth(context) * 10 / 380,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context) * 15 / 380,
                      vertical: getWidth(context) * 20 / 380,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            getWidth(context) * 10 / 380),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment",
                          style: s16w600,
                        ),
                        DropdownButton(
                          value: _dropDownValue,
                          isExpanded: true,
                          hint: Text("Please Select Payment Method", style: s13w300.copyWith(color: Colors.grey),),
                          icon: FaIcon(
                            FontAwesomeIcons.chevronDown,
                            color: AppColors.main,
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: getWidth(context) * 25 / 380,
                                          child: FaIcon(
                                              FontAwesomeIcons.creditCard)),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Mada",
                                          style: s13w300.copyWith(
                                              color: Colors.grey.shade900),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "XXXX XXXX XXXX 1234",
                                    style: s13w300.copyWith(
                                        color: Colors.grey.shade900),
                                  )
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getWidth(context) * 25 / 380,
                                        child:
                                            FaIcon(FontAwesomeIcons.applePay),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Apple Pay",
                                          style: s13w300.copyWith(
                                              color: Colors.grey.shade900),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getWidth(context) * 25 / 380,
                                        child:
                                        FaIcon(FontAwesomeIcons.moneyBillWave),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Cash on delivery",
                                          style: s13w300.copyWith(
                                              color: Colors.grey.shade900),
                                        ),
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text(
                                "Add new card",
                                style: s13w300.copyWith(
                                    color: Colors.grey.shade900),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if(value == 3){
                              // TODO: add new card screen
                              // Navigator.push(context, CupertinoPageRoute(builder: (context) => ,))
                            }
                            setState(() {
                              _dropDownValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20/380,
                      bottom: getWidth(context) * 40/380,
                      left: getWidth(context) * 10/380,
                      right: getWidth(context) * 10/380,
                    ),
                    child: FlatButton(
                      child: Center(
                        child: Text("Checkout", style: s17w300.copyWith(color: Colors.white),),
                      ),
                      color: AppColors.main,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context)* 10/380)),
                      height: getWidth(context) * 50/380,
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => NewPaymentPage(true),));
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  FakeProduct product;
  CartItem(this.product);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      margin: EdgeInsets.only(
        bottom: getWidth(context) * 10 / 380,
        left: getWidth(context) * 10 / 380,
        right: getWidth(context) * 10 / 380,
      ),
      padding: EdgeInsets.all(getWidth(context) * 10 / 380),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(getWidth(context) * 15 / 380)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(getWidth(context) * 20 / 380),
                    child: Image.network(
                      widget.product.imgUrl,
                      width: getWidth(context) * 60 / 380,
                      height: getWidth(context) * 60 / 380,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getWidth(context) * 10 / 380),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: s16w600.copyWith(color: AppColors.dark),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text("${widget.product.price.toString()} SR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.main)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: FaIcon(
                      amount == 1
                          ? FontAwesomeIcons.trash
                          : FontAwesomeIcons.minus,
                      color: AppColors.main,
                      size: getWidth(context) * 15/380,
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        if (amount > 1) {
                          amount--;
                        }
                      });
                      if (amount == 1) {
                        setState(() {
                          FakeData.fakeCartList.remove(widget.product);
                        });
                      }
                    },
                  ),
                  Container(
                      width: getWidth(context) * 20 / 380,
                      child: Center(
                          child: Text(
                        amount.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ))),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                      color: AppColors.main,
                      size: getWidth(context) * 15/380,
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      if (amount < 99) {
                        setState(() {
                          amount++;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          widget.product.extra == null
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    RichText(
                        text: TextSpan(
                            text: "Modifiers: ",
                            style: TextStyle(color: AppColors.main),
                            children: [
                          TextSpan(
                              text: widget.product.extra,
                              style: TextStyle(color: Colors.black))
                        ]))
                  ],
                )
        ],
      ),
    );
  }
}
