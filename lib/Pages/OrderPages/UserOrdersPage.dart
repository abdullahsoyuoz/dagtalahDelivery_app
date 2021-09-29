import 'package:dagtalahdeliveryapp/Pages/OrderPages/OrderDetailPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserOrdersPage extends StatefulWidget {
  @override
  _UserOrdersPageState createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage> {
  ScrollController _singleChildController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: s22w700AppBarTitle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.main,
      ),
      body: Container(
        width: getWidth(context),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(getWidth(context) * 35 / 380))),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(getWidth(context) * 35 / 380)),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              top: getWidth(context) * 30/380,
              bottom: getWidth(context) * 30/380,
            ),
            itemCount: FakeData.fakeOrderList.length,
            itemBuilder: (context, index) => buildOrderItem(
                context, FakeData.fakeOrderList[index]),
          ),
        ),
      ),
    );
  }

  buildOrderItem(BuildContext context, FakeOrder item) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => OrderDetailPage(item),));
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: getWidth(context) * 30 / 380,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(context) * 20 / 380,
                right: getWidth(context) * 20 / 380,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("#000${item.orderNumber.toString()}", style: s17w700),
                  Text("${item.date}", style: s13w300.copyWith(color: Colors.grey)),
                ],),),
            Container(
              width: getWidth(context),
              padding: EdgeInsets.all(getWidth(context) * 10/380),
              margin: EdgeInsets.only(
                top: 8,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item.orderList.length} ITEMS", style: s16w600.copyWith(color: Colors.grey.shade400),),
                      Text("${item.price} SR", style: s16w600.copyWith(color: AppColors.main),),],),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: item.orderList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: getWidth(context) * 7 / 380),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(getWidth(context) * 25 / 380),
                                child: Image.network(
                                  item.orderList[index].imgUrl,
                                  width: getWidth(context) * 70 / 380,
                                  height: getWidth(context) * 70 / 380,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.orderList[index].title, style: s16w600.copyWith(color: AppColors.dark),),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getWidth(context) * 5 / 380),
                                    child: RichText(
                                        text: TextSpan(
                                            text: "No: ",
                                            style: s16w600.copyWith(color: AppColors.dark,),
                                            children: [
                                              TextSpan(
                                                  text: "Sliced mushrooms",
                                                  style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black))
                                            ])),
                                  ),
                                ],),),],),);},),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            item.orderStatus == OrderStatus.PROCESSING
                              ? FaIcon(FontAwesomeIcons.spinner, color: AppColors.orange, size: getWidth(context) * 15/380,)
                              : item.orderStatus == OrderStatus.ONTHEWAY
                                ? FaIcon(FontAwesomeIcons.mapMarkerAlt, color: AppColors.main, size: getWidth(context) * 15/380,)
                                : item.orderStatus == OrderStatus.DELIVERED
                                  ? FaIcon(FontAwesomeIcons.checkCircle, color: Colors.green, size: getWidth(context) * 15/380,)
                                  : SizedBox(),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              child: item.orderStatus == OrderStatus.ONTHEWAY
                                  ? Text("On The Way", style: TextStyle(color: AppColors.main, fontSize: 15),)
                                  : item.orderStatus == OrderStatus.DELIVERED
                                    ? Text("Delivered", style: TextStyle(color: Colors.green, fontSize: 15),)
                                    : item.orderStatus == OrderStatus.PROCESSING
                                      ? Text("Processing", style: TextStyle(color: AppColors.orange, fontSize: 15),)
                                      : SizedBox(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.redoAlt, color: AppColors.main, size: getWidth(context) * 15/380,),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text("Repeat Order", style: TextStyle(color: AppColors.main, fontSize: 15),)
                            )
                          ],
                        )
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
}
