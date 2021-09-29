import 'package:awesome_card/awesome_card.dart';
import 'package:dagtalahdeliveryapp/Pages/PaymentPages/PaymentCompletedPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class NewPaymentPage extends StatefulWidget {
  bool didComeFromCart;
  NewPaymentPage(this.didComeFromCart);
  @override
  _NewPaymentPageState createState() => _NewPaymentPageState();
}

class _NewPaymentPageState extends State<NewPaymentPage> {
  TextEditingController _nameOnCardController = new TextEditingController();
  var _cardNumberController =
      new MaskedTextController(mask: '0000 0000 0000 0000');
  TextEditingController _expiryDateController =
      new MaskedTextController(mask: '00/00');
  TextEditingController _cvvController = new MaskedTextController(mask: '000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Payment",
          style: s22w700AppBarTitle.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.main,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          width: getWidth(context),
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top +
                  AppBar().preferredSize.height),
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(getWidth(context) * 35 / 380))),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 30 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Text(
                  "My Cards",
                  style: s18w700ProductViewTitle,
                ),
              ),
              Container(
                margin: EdgeInsets.all(getWidth(context) * 20 / 380),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(getWidth(context) * 20 / 380),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 3, offset: Offset(0, 5))
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name on Card",
                            style: s16w600.copyWith(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) * 10 / 380)),
                                child: TextField(
                                  controller: _nameOnCardController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 15)),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card Number",
                            style: s16w600.copyWith(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) * 10 / 380)),
                                child: TextField(
                                  controller: _cardNumberController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 15)),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        bottom: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: s16w600.copyWith(color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                              getWidth(context) * 10 / 380)),
                                      child: TextField(
                                        controller: _expiryDateController,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(left: 15)),
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: getWidth(context) * 10 / 380,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CVV",
                                  style: s16w600.copyWith(color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                              getWidth(context) * 10 / 380)),
                                      child: TextField(
                                        controller: _cvvController,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(left: 15)),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  bottom: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: FlatButton(
                  child: Center(
                    child: Text(
                      "Add Card",
                      style: s17w300.copyWith(color: Colors.white),
                    ),
                  ),
                  color: AppColors.main,
                  height: getWidth(context) * 50 / 380,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          getWidth(context) * 10 / 380)),
                  onPressed: () {
                    if(!widget.didComeFromCart){
                      FakeData.fakeCreditCardList.add(FakeCard(FakeData.fakeCreditCardList.length+1, _nameOnCardController.text, CardType.masterCard, "test", _cardNumberController.text, _expiryDateController.text, _cvvController.text));
                      Navigator.pop(context);
                    }
                    if(widget.didComeFromCart){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => PaymentCompletedPage(),));
                    }
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
