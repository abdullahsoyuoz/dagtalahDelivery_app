import 'package:another_flushbar/flushbar.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailPage extends StatefulWidget {
  FakeProduct product;
  ProductDetailPage(this.product);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ScrollController _singleChildScrollController = new ScrollController();
  bool isOpenModifiers = false;
  bool isOpenExtras = false;
  bool isOpenSalsa = false;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: getWidth(context),
              height: getWidth(context) * 300 / 380,
              child: Stack(
                children: [
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) * 300 / 380,
                    child: Image.network(
                      widget.product.imgUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppBar().preferredSize.height,
                          left: MediaQuery.of(context).padding.top * 0.5),
                      child: Container(
                        width: getWidth(context) * 30 / 380,
                        height: getWidth(context) * 30 / 380,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            icon: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: AppColors.main,
                              size: getWidth(context) * 15 / 380,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppBar().preferredSize.height,
                          right: MediaQuery.of(context).padding.top * 0.5),
                      child: Container(
                        width: getWidth(context) * 30 / 380,
                        height: getWidth(context) * 30 / 380,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            icon: FaIcon(
                              FontAwesomeIcons.shareAlt,
                              color: AppColors.main,
                              size: getWidth(context) * 15 / 380,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Chip(
                              backgroundColor: Colors.white,
                              avatar: CircleAvatar(
                                child: Text(
                                  "kcal",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 9),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              label: Text(
                                  widget.product.calorie.floor().toString())),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Chip(
                              backgroundColor: Colors.white,
                              avatar: FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: AppColors.orange,
                              ),
                              label: Text(
                                  widget.product.calorie.floor().toString())),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              child: Column(
                children: [
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) * 75 / 380,
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 20 / 380),
                    decoration:
                        BoxDecoration(color: AppColors.backgroundColorDark),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: s18w700ProductViewTitle.copyWith(
                              color: AppColors.main),
                        ),
                        Text(
                          "${widget.product.price.toString()} SR",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.main),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) * 100 / 380,
                    padding: EdgeInsets.only(
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: getWidth(context) * 10 / 380,
                          ),
                          child: Text(
                            "${widget.product.description}",
                            style:
                                s13w300.copyWith(fontWeight: FontWeight.w400),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getWidth(context) * 10 / 380,
                          ),
                          child: RichText(
                            text: TextSpan(
                                text: "Contains: ",
                                style: TextStyle(
                                  color: AppColors.dark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Beans, Milk, Eggs",
                                    style: s13w300.copyWith(
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOpenModifiers = !isOpenModifiers;
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: getWidth(context) * 50 / 380,
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 20 / 380),
                      color: AppColors.backgroundColorDark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Modifiers",
                              style: s18w700ProductViewTitle.copyWith(
                                  color: AppColors.main, fontSize: 16)),
                          FaIcon(
                            isOpenModifiers
                                ? FontAwesomeIcons.chevronDown
                                : FontAwesomeIcons.chevronRight,
                            color: AppColors.main,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isOpenModifiers
                      ? Column(
                          children: [
                            ExtrasItem("No sliced mushrooms"),
                            ExtrasItem("No green onions"),
                            ExtrasItem("No green cheese"),
                          ],
                        )
                      : SizedBox(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOpenExtras = !isOpenExtras;
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: getWidth(context) * 50 / 380,
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 20 / 380),
                      color: AppColors.backgroundColorDark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Extras",
                              style: s18w700ProductViewTitle.copyWith(
                                  color: AppColors.main, fontSize: 16)),
                          FaIcon(
                            isOpenExtras
                                ? FontAwesomeIcons.chevronDown
                                : FontAwesomeIcons.chevronRight,
                            color: AppColors.main,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isOpenExtras
                      ? Column(
                          children: [
                            ExtrasItem(
                              "Grilled Chicken",
                              price: "10.43",
                            ),
                            ExtrasItem(
                              "Cheese",
                              price: "3.43",
                            ),
                          ],
                        )
                      : SizedBox(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOpenSalsa = !isOpenSalsa;
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: getWidth(context) * 50 / 380,
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 20 / 380),
                      color: AppColors.backgroundColorDark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Salsa",
                              style: s18w700ProductViewTitle.copyWith(
                                  color: AppColors.main, fontSize: 16)),
                          FaIcon(
                            isOpenSalsa
                                ? FontAwesomeIcons.chevronDown
                                : FontAwesomeIcons.chevronRight,
                            color: AppColors.main,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isOpenSalsa
                      ? Column(
                          children: [
                            ExtrasItem(
                              "Traditional Salsa",
                              price: "0.00",
                            ),
                            ExtrasItem(
                              "Chili Con Came",
                              price: "8.70",
                            ),
                          ],
                        )
                      : SizedBox(),
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
                            flex: 1,
                            child: Container(
                              height: getWidth(context) * 50 / 380,
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(context) * 10 / 380),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColorDark,
                                  borderRadius: BorderRadius.circular(
                                      getWidth(context) * 15 / 380)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.minus, color: AppColors.main, size: getWidth(context) * 15/380),
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      if(amount > 1){
                                        setState(() {
                                          amount--;
                                        });
                                      }
                                    },
                                  ),
                                  Container(
                                      width: getWidth(context) * 20/380,
                                      child: Center(child: Text(amount.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),))),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.plus, color: AppColors.main, size: getWidth(context) * 15/380,),
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      if(amount < 99){
                                        setState(() {
                                          amount++;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: getWidth(context) * 20 / 380,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: getWidth(context) * 50 / 380,
                              decoration: BoxDecoration(
                                  color: AppColors.main,
                                  borderRadius: BorderRadius.circular(
                                      getWidth(context) * 15 / 380)),
                              child: FlatButton(
                                  onPressed: () async{
                                    FakeData.fakeCartList.add(
                                      FakeProduct(
                                        widget.product.id,
                                        widget.product.title,
                                        widget.product.price,
                                        widget.product.imgUrl,
                                        widget.product.discountDesc,
                                        widget.product.discountType,
                                        widget.product.calorie,
                                        widget.product.description,
                                        amount,
                                        widget.product.extra
                                      )
                                    );
                                    await Flushbar(
                                      messageText: Text("Item added to cart", style: TextStyle(color: AppColors.main),),
                                      flushbarStyle: FlushbarStyle.GROUNDED,
                                      backgroundColor: Colors.white,
                                      duration: Duration(seconds: 1),
                                      animationDuration: Duration(milliseconds: 250),
                                      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                                      flushbarPosition: FlushbarPosition.TOP,
                                    ).show(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          getWidth(context) * 15 / 380)),
                                  child: Center(
                                    child: Text(
                                      "Add To Cart",
                                      style:
                                          s17w300.copyWith(color: Colors.white),
                                    ),
                                  )),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtrasItem extends StatefulWidget {
  String title;
  String price;
  ExtrasItem(this.title, {this.price});
  @override
  _ExtrasItemState createState() => _ExtrasItemState();
}

class _ExtrasItemState extends State<ExtrasItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getWidth(context) * 10 / 380,
        bottom: getWidth(context) * 10 / 380,
        left: getWidth(context) * 20 / 380,
        right: getWidth(context) * 30 / 380,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: getWidth(context) * 20 / 380,
                  height: getWidth(context) * 20 / 380,
                  decoration: BoxDecoration(
                      color: isSelected ? AppColors.main : Colors.white,
                      border: Border.all(color: AppColors.main, width: 1),
                      borderRadius:
                          BorderRadius.circular(getWidth(context) * 5 / 380)),
                  child: isSelected
                      ? Center(
                          child: FaIcon(FontAwesomeIcons.check,
                              color: Colors.white,
                              size: getWidth(context) * 15 / 380))
                      : SizedBox(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                child: Text(widget.title),
              ),
            ],
          ),
          widget.price != null
              ? Text(
                  "+ ${widget.price} SR",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
