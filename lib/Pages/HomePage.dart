import 'package:dagtalahdeliveryapp/Pages/ProductDetailPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Data.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:dagtalahdeliveryapp/Widgets/customCarousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int lastSelectedPromotion = -1;
  int selectedDropDownValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text("Explore", style: s22w700AppBarTitle),
        centerTitle: true,
        backgroundColor: AppColors.main,
        elevation: 0,
        leading: SizedBox(),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(context) * 35 / 380)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: getWidth(context),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(context) * 35 / 380)),),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 15 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    border: getTextFieldBorder(context),
                    enabledBorder: getTextFieldBorder(context),
                    focusedBorder: getTextFieldBorderFocused(context),
                    focusColor: Colors.red,
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400],),
                    hintText: 'Find Dishes',
                    hintStyle: TextStyle(color: Colors.grey, fontFamily: "WorkSansLight"),),),),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Container(
                  width: getWidth(context),
                  height: getWidth(context) * 30 / 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(getWidth(context) * 15 / 380)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: selectedDropDownValue == 0
                                      ? Image.asset(
                                          "assets/icons/deliveryman.png",
                                          height: getWidth(context) * 20 / 380,
                                          width: getWidth(context) * 20 / 380,
                                          fit: BoxFit.fitHeight,
                                        )
                                      : Center(
                                          child: FaIcon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: AppColors.main,
                                          size: getWidth(context) * 20 / 380,
                                        ))),
                              Container(
                                width: getWidth(context) * 20 / 380,
                                margin: EdgeInsets.only(left: 5),
                                child: PopupMenuButton<String>(
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    color: AppColors.main,
                                    size: getWidth(context) * 15 / 380,
                                  ),
                                  padding: EdgeInsets.zero,
                                  onSelected: (value) {
                                    if (value == dropValues[0]) {
                                      setState(() {
                                        selectedDropDownValue = 0;
                                      });
                                    }
                                    if (value == dropValues[1]) {
                                      setState(() {
                                        selectedDropDownValue = 1;
                                      });
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return dropValues.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: getWidth(context) * 20 / 380,
                        color: AppColors.backgroundColor,),
                      Expanded(
                        flex: 12,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Home", style: s16w600,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Street, City, Building No", style: s13w300.copyWith(color: Colors.grey),),),],),
                              InkWell(
                                  onTap: () {},
                                  child: FaIcon(FontAwesomeIcons.chevronRight, color: AppColors.main,))],),),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 20 / 380,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      child: Text('Best Sellers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),),
                    Container(
                        width: getWidth(context),
                        height: getWidth(context) * 188 / 380,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380)),
                        child: Center(
                          child: Carousel(
                          autoplay: true,
                          animationDuration: Duration(seconds: 1),
                          showIndicator: true,
                          indicatorBgPadding: getWidth(context) * 10 / 380,
                          dotBgColor: Colors.black.withOpacity(0.3),
                          dotColor: Colors.white,
                          dotIncreasedColor: AppColors.orangeLight,
                          dotSpacing: 15,
                          boxFit: BoxFit.fitWidth,
                          radius: Radius.circular(getWidth(context) * 10 / 380),
                          noRadiusForIndicator: false,
                          borderRadius: true,
                          images: FakeData.fakeProductList.map((e) => buildCarouselItem(context, e)).toList(),
                        )
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,),
                      child: Text('Promotions', style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800)),),
                    Container(
                      height: getWidth(context) * 220 / 380,
                      margin: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                      width: getWidth(context),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(
                          top: getWidth(context) * 5 / 380,
                          bottom: getWidth(context) * 5 / 380,
                          left: getWidth(context) * 20 / 380),
                        itemCount: FakeData.fakeProductList.length,
                        itemBuilder: (context, index) {return buildPromotionItem(context, index, FakeData.fakeProductList[index]);},),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPromotionItem(BuildContext context, int index, FakeProduct item) {
    return InkWell(
      onTap: () {
        setState(() {
          lastSelectedPromotion = index;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: getWidth(context) * 200 / 380,
          width: getWidth(context) * 180 / 380,
          margin: EdgeInsets.only(right: getWidth(context) * 20 / 380),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getWidth(context) * 5 / 380),
              boxShadow: [
                lastSelectedPromotion == index
                    ? BoxShadow(color: Colors.grey, blurRadius: 5)
                    : BoxShadow(color: Colors.transparent, blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: getWidth(context) * 30 / 380,
                decoration: BoxDecoration(
                  color: item.discountType == 0
                    ? AppColors.main
                    : AppColors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getWidth(context) * 5 / 380),
                    topRight: Radius.circular(getWidth(context) * 5 / 380))),
                child: Center(
                  child: Text("${item.discountDesc}", style: TextStyle(color: Colors.white),),),),
              Expanded(
                child: Image.network(
                  item.imgUrl,
                fit: BoxFit.cover,
                width: getWidth(context),)),
              Container(
                height: getWidth(context) * 60 / 380,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: getWidth(context) * 15 / 380,
                  left: getWidth(context) * 10 / 380,),
                decoration: BoxDecoration(
                  color: lastSelectedPromotion == index
                    ? Colors.white
                    : AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getWidth(context) * 5 / 380),
                    bottomRight: Radius.circular(getWidth(context) * 5 / 380))),
                child: Text("${item.title}",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),),
              ),
            ],
          )),
    );
  }

  buildCarouselItem(BuildContext context, FakeProduct e) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetailPage(e),));
      },
      child: Container(
          width: getWidth(context),
          height: getWidth(context) * 188 / 380,
          margin: EdgeInsets.only(
            left: getWidth(context) * 20 / 380,
            right: getWidth(context) * 20 / 380,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380),
                child: Image.network(
                  e.imgUrl,
                  fit: BoxFit.cover,
                )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    right: 5
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                    ),
                    child: Text("${e.price.toString()} SR", style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 5
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(getWidth(context) * 5/380)),
                    child: Text("${e.title} SR", style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
