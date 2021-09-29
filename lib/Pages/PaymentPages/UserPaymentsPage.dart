import 'package:awesome_card/awesome_card.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:dagtalahdeliveryapp/Pages/PaymentPages/NewPaymentPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPaymentsPage extends StatefulWidget {
  @override
  _UserPaymentsPageState createState() => _UserPaymentsPageState();
}

class _UserPaymentsPageState extends State<UserPaymentsPage> {
  TextEditingController _nameOnCardController;
  TextEditingController _cardNumberController;
  TextEditingController _expiryDateController;
  TextEditingController _cvvController;
  int currentCardIndex = 0;
  bool turnCade = false;

  @override
  void initState() {
    super.initState();
    _nameOnCardController = TextEditingController(text: FakeData.fakeCreditCardList[0].name);
    _cardNumberController = new MaskedTextController(mask: '0000 0000 0000 0000', text: FakeData.fakeCreditCardList[0].cardNumber);
    _expiryDateController = new MaskedTextController(mask: '00/00', text: FakeData.fakeCreditCardList[0].expiryDate);
    _cvvController = new MaskedTextController(mask: '000', text: FakeData.fakeCreditCardList[0].cvv);
  }

  @override
  void dispose() {
    super.dispose();
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
  }

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
        elevation: 0,
        centerTitle: true,
      ),
      body: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(getWidth(context) * 35 / 380)),
        child: Container(
          width: getWidth(context),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(getWidth(context) * 35 / 380))),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(getWidth(context) * 35 / 380)),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Cards",
                        style: s18w700ProductViewTitle,
                      ),
                      Container(
                        width: getWidth(context) * 30 / 380,
                        decoration: BoxDecoration(
                            color: AppColors.main, shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: getWidth(context) * 15 / 380,
                            ),
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => NewPaymentPage(false),));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: getWidth(context) * 200/380,
                  width: getWidth(context),
                  child: Carousel(
                    images: FakeData.fakeCreditCardList.map((e){
                      return Transform.scale(
                        scale: 0.85,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              turnCade = !turnCade;
                            });
                          },
                          child: CreditCard(
                            cardNumber: e.cardNumber,
                            cardExpiry: e.expiryDate,
                            cardHolderName: e.name,
                            cvv: e.cvv,
                            bankName: e.bankName,
                            cardType: CardType.masterCard, // Optional if you want to override Card Type
                            frontBackground: CardBackgrounds.black,
                            backBackground: CardBackgrounds.black,
                            backTextColor: Colors.white,
                            showShadow: false,
                            showBackSide: turnCade,
                          ),
                        ),
                      );
                    }).toList(),
                    autoplay: false,
                    showIndicator: true,
                    indicatorBgPadding: getWidth(context) * 0/380,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                    dotIncreasedColor: AppColors.main,
                    onImageChange: (value, index) {
                      setState(() {
                        currentCardIndex = index;
                        _nameOnCardController.text = FakeData.fakeCreditCardList[index].name;
                        _cardNumberController.text = FakeData.fakeCreditCardList[index].cardNumber;
                        _expiryDateController.text = FakeData.fakeCreditCardList[index].expiryDate;
                        _cvvController.text = FakeData.fakeCreditCardList[index].cvv;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                  ),
                  child: Text(
                    "Card Details",
                    style: s18w700ProductViewTitle,
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
                              onChanged: (value) {
                                setState(() {
                                  FakeData.fakeCreditCardList[currentCardIndex].name = value;
                                });
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 15)),
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
                                  contentPadding: EdgeInsets.only(left: 15)),
                              onChanged: (value) {
                                setState(() {
                                  FakeData.fakeCreditCardList[currentCardIndex].cardNumber = value;
                                });
                              },
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
                                    onChanged: (value) {
                                      setState(() {
                                        FakeData.fakeCreditCardList[currentCardIndex].expiryDate = value;
                                      });
                                    },
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
                                    onChanged: (value) {
                                      setState(() {
                                        FakeData.fakeCreditCardList[currentCardIndex].cvv = value;
                                      });
                                    },
                                  )),
                            )
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
                    child: Center(child: Text("Save", style: s17w300.copyWith(color: Colors.white),),),
                    color: AppColors.main,
                    height: getWidth(context) * 50/380,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 10/380)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
