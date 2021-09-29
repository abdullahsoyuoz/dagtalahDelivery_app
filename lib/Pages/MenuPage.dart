import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:dagtalahdeliveryapp/Pages/ProductDetailPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ScrollController _listViewController = new ScrollController();
  ScrollController _productListViewController = new ScrollController();
  int selectedCategoriesListItem = 0;
  int viewStyle = 0;
  ScrollController _nestedScrollView = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Menu", style: s22w700AppBarTitle.copyWith(color: Colors.white),),
        centerTitle: true,
        backgroundColor: AppColors.main,
        automaticallyImplyLeading: false,
          actions: [
            IconButton(icon: FaIcon(FontAwesomeIcons.stop, color: Colors.white.withOpacity(0.2)), onPressed: () {setState(() {viewStyle = 0;});},),
            IconButton(icon: FaIcon(FontAwesomeIcons.thList, color: Colors.white.withOpacity(0.2)), onPressed: () {setState(() {viewStyle = 1;});},),
            IconButton(icon: FaIcon(FontAwesomeIcons.thLarge, color: Colors.white.withOpacity(0.2)), onPressed: () {setState(() {viewStyle = 2;});},),
          ],
        bottom: PreferredSize(
          preferredSize: viewStyle == 0 ? Size.fromHeight(getWidth(context) * 38/380) : Size.fromHeight(getWidth(context) * 0/380),
          child: viewStyle == 0 ? Container(
            color: Colors.white,
            width: getWidth(context),
            height: getWidth(context) * 38 / 380,
            padding: EdgeInsets.symmetric(vertical: getWidth(context) * 3/380),
            alignment: Alignment.center,
            child: ListView.builder(
              controller: _listViewController,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: getWidth(context) * 20 / 380),
              itemCount: FakeData.fakeCategories.length,
              itemBuilder: (context, index) {
                return buildCategoriesListItem(context, FakeData.fakeCategories[index]);
              },
            ),
          ) : SizedBox(),
        ),
      ),
      body: CustomScrollView(
        controller: _nestedScrollView,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: getWidth(context) * 205 / 380,
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: getWidth(context) * 188 / 380,
                margin: EdgeInsets.all(getWidth(context) * 15/380),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getWidth(context) * 5/380),
                  child: Carousel(
                    autoplay: true,
                    animationDuration: Duration(seconds: 1),
                    showIndicator: true,
                    indicatorBgPadding: getWidth(context) * 10 / 380,
                    boxFit: BoxFit.fitWidth,
                    dotBgColor: Colors.black.withOpacity(0.3),
                    dotColor: Colors.white,
                    dotIncreasedColor: AppColors.orangeLight,
                    dotSpacing: 15,
                    noRadiusForIndicator: false,
                    borderRadius: true,
                    images: FakeData.fakeProductList.map((e) => buildCarouselItem(context, e)).toList(),
                  ),
                ),
              ),
            ),
          ),

          // SliverToBoxAdapter(
          //   child: viewStyle == 0 ? Container(
          //     color: Colors.white,
          //     width: getWidth(context),
          //     height: getWidth(context) * 35 / 380,
          //     margin: EdgeInsets.only(bottom: getWidth(context) * 10/380),
          //     child: ListView.builder(
          //       controller: _listViewController,
          //       scrollDirection: Axis.horizontal,
          //       physics: ClampingScrollPhysics(),
          //       padding: EdgeInsets.only(left: getWidth(context) * 20 / 380),
          //       itemCount: FakeData.fakeCategories.length,
          //       itemBuilder: (context, index) {
          //         return buildCategoriesListItem(context, FakeData.fakeCategories[index]);
          //       },
          //     ),
          //   ) : SizedBox(),
          // ),
          viewStyle != 0 ? SliverToBoxAdapter(child: SizedBox(height: getWidth(context) * 20/380,),) : SliverToBoxAdapter(child: SizedBox(),),
          viewStyle != 2 ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index){
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 10 / 380),
                  child: viewStyle == 0 ? buildProductListItem(context, FakeData.fakeProductList[index]) : buildCategoriesListItemSimple(context, FakeData.fakeCategories[index]));
              },
              childCount: FakeData.fakeProductList.length,
            ),
          ) : SliverToBoxAdapter(child: SizedBox(),),
          viewStyle == 2 ? SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Container(
                    margin: EdgeInsets.only(
                      top: getWidth(context) * 10/380,
                      left: getWidth(context) * 10/380,
                      right: getWidth(context) * 10/380,
                    ),
                    child: buildCategoriesListItemGrid(context, FakeData.fakeCategories[index]));
                },
              childCount: FakeData.fakeCategories.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            )
          ) : SliverToBoxAdapter(child: SizedBox(),),
          SliverToBoxAdapter(child: SizedBox(height: 30),),
        ],
        //------ eski düzen

        // body: Container(
        //   color: Colors.white,
        //   child: Column(
        //     // shrinkWrap: true,
        //     // crossAxisAlignment: CrossAxisAlignment.start,
        //     // mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        // viewStyle == 0 ? Container(
        //   width: getWidth(context),
        //   height: getWidth(context) * 35 / 380,
        //   child: ListView.builder(
        //     controller: _listViewController,
        //     scrollDirection: Axis.horizontal,
        //     physics: ClampingScrollPhysics(),
        //     padding: EdgeInsets.only(left: getWidth(context) * 20 / 380),
        //     itemCount: FakeData.fakeCategories.length,
        //     itemBuilder: (context, index) {
        //       return buildCategoriesListItem(context, FakeData.fakeCategories[index]);
        //     },
        //   ),
        // ) : SizedBox(),
        //
        //       viewStyle != 2 ? Expanded(
        //         child: ListView.builder(
        //           shrinkWrap: true,
        //           controller: _productListViewController,
        //           physics: NeverScrollableScrollPhysics(),
        //           padding: EdgeInsets.only(
        //             top: getWidth(context) * 20/380,
        //           ),
        //           scrollDirection: Axis.vertical,
        //           itemCount: FakeData.fakeProductList.length,
        //           itemBuilder: (context, index) {
        //             if(viewStyle == 0){return buildProductListItem(context, FakeData.fakeProductList[index]);}
        //             if(viewStyle == 1){return buildCategoriesListItemSimple(context, FakeData.fakeCategories[index]);}
        //             return SizedBox();
        //           },
        //         ),
        //       ) : SizedBox(),
        //       viewStyle == 2 ? Padding(
        //         padding: EdgeInsets.only(
        //           left: getWidth(context) * 18 / 380,
        //           right: getWidth(context) * 18 / 380,
        //         ),
        //         child: Container(
        //           child: GridView.builder(
        //             shrinkWrap: true,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2,
        //                 crossAxisSpacing: getWidth(context) * 20 / 380),
        //             itemCount: FakeData.fakeCategories.length,
        //             physics: NeverScrollableScrollPhysics(),
        //
        //             padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
        //             itemBuilder: (context, index) {
        //               return buildCategoriesListItemGrid(
        //                   context, FakeData.fakeCategories[index]);
        //             },
        //           ),
        //         ),
        //       ) : SizedBox()
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget buildCategoriesListItem(BuildContext context, FakeCategories item) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategoriesListItem = item.id;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: getWidth(context) * 35 / 380,
        margin: EdgeInsets.only(right: getWidth(context) * 20 / 380),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: selectedCategoriesListItem == item.id
                        ? AppColors.main
                        : Colors.transparent,
                    width: 3))),
        child: Center(
          child: Text(
            "${FakeData.fakeCategories[item.id].title}",
            style: s16w600.copyWith(
                color: selectedCategoriesListItem == item.id
                    ? Colors.black
                    : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget buildProductListItem(BuildContext context, FakeProduct item) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetailPage(item),));
      },
      child: Container(
        height: getWidth(context) * 125 / 380,
        width: getWidth(context),
        margin: EdgeInsets.only(
            left: getWidth(context) * 2 / 380,
            right: getWidth(context) * 2 / 380,
            bottom: getWidth(context) * 20 / 380),
        padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 10 / 380),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(0, 1),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(0, 1),
                blurRadius: 5,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(getWidth(context) * 25 / 380),
              child: Image.network(
                item.imgUrl,
                height: getWidth(context) * 100 / 380,
                width: getWidth(context) * 100 / 380,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(context) * 20 / 380),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: s17w700.copyWith(color: AppColors.dark, fontSize: 14),),
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 5/380),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: getWidth(context) * 5 / 380),
                          child: Chip(
                            backgroundColor: AppColors.main,
                            label: Text(
                              item.calorie.floor().toString(),
                              style: s13w300.copyWith(color: Colors.white),
                            ),
                            avatar: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  "kcal",
                                  style: TextStyle(
                                      color: AppColors.main,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Chip(
                          backgroundColor: AppColors.main,
                          label: Text(
                            "${item.price.toString()} SR",
                            style: s13w300.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesListItemSimple(BuildContext context, FakeCategories item) {
    return Container(
      height: getWidth(context) * 50 / 380,
      width: getWidth(context),
      margin: EdgeInsets.only(
          left: getWidth(context) * 2 / 380,
          right: getWidth(context) * 2 / 380,
          bottom: getWidth(context) * 20 / 380),
      padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 10 / 380),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${item.title}",
            style: s16w600.copyWith(color: AppColors.dark),
          ),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey,
                size: getWidth(context) * 15 / 380,
              ),
              onPressed: null)
        ],
      ),
    );
  }

  Widget buildCategoriesListItemGrid(BuildContext context, FakeCategories item) {
    return Container(
        height: getWidth(context) * 155 / 380,
        width: getWidth(context) * 155 / 380,
        margin: EdgeInsets.only(
            left: getWidth(context) * 2 / 380,
            right: getWidth(context) * 2 / 380,
            bottom: getWidth(context) * 20 / 380),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(0, 1),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(0, 1),
                blurRadius: 5,
              ),
            ]),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item.imgUrl,
                height: getWidth(context) * 155 / 380,
                width: getWidth(context) * 155 / 380,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: getWidth(context) * 30 / 380,
                width: getWidth(context),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Center(
                    child: Text("${item.title}",
                      style: s17w700.copyWith(color: Colors.white),
                )),
              ),
            )
          ],
        ));
  }

  buildCarouselItem(BuildContext context, FakeProduct e) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetailPage(e),));
      },
      child: Container(
          width: getWidth(context),
          height: getWidth(context) * 188 / 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                e.imgUrl,
                fit: BoxFit.cover,
              ),
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
                        borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                    ),
                    child: Text("${e.title} SR", style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

