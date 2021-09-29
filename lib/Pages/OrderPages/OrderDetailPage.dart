import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';

class OrderDetailPage extends StatefulWidget {
  FakeOrder order;
  OrderDetailPage(this.order);
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  ScrollController _singleChildController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Order Detail",
          style: s22w700AppBarTitle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.main,
      ),
      body: Container(
        width: getWidth(context),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: getWidth(context) *35/380),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(getWidth(context) * 35 / 380))),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(getWidth(context) * 35 / 380)),
          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#000${widget.order.orderNumber}",
                      style: s17w700,
                    ),
                    widget.order.orderStatus == OrderStatus.ONTHEWAY
                        ? Text("ON THE WAY",
                            style: s17w700.copyWith(
                              color: AppColors.main,
                            ))
                        : widget.order.orderStatus == OrderStatus.DELIVERED
                            ? Text(
                                "DELIVERED",
                                style: s17w700.copyWith(color: Colors.green),
                              )
                            : widget.order.orderStatus == OrderStatus.PROCESSING
                                ? Text(
                                    "PROCESSING",
                                    style: s17w700.copyWith(
                                        color: AppColors.orange),
                                  )
                                : SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 5 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Text(
                  "${widget.order.date}", style: s13w300.copyWith(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                ),
                child: Container(
                    height: getWidth(context) * 50 / 380,
                    width: getWidth(context),
                    alignment: Alignment.center,
                    child: buildTimeline(context, widget.order.orderStatus)),
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 10/380),
                child: Container(
                  width: getWidth(context),
                  margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 10/380),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getWidth(context) * 10/380),
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: getWidth(context) * 10/380),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.order.orderList.length,
                    itemBuilder: (context, index) {
                      return buildOrderItems(context, widget.order.orderList[index]);
                    },
                  ),
                ),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.only(
                  left: getWidth(context) * 10/380,
                  right: getWidth(context) * 10/380,
                  top: getWidth(context) * 30/380,
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
                    child: Text(widget.order.orderStatus == OrderStatus.PROCESSING ?
                    "Confirm Delivery" : "Repeat Order",
                      style: s17w300.copyWith(color: Colors.white),),
                  ),
                  color: AppColors.main,
                  height: getWidth(context) * 50/380,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 15/380)),
                  onPressed: () {

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildTimeline(BuildContext context, OrderStatus status) {
    return Timeline(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      children: [
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
              width: getWidth(context) * 0.2,
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.topCenter,
              child: Text(
                "Order placed",
                style: s12w600.copyWith(color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey),
              )),
          node: TimelineNode(
            indicator: DotIndicator(
              color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              size: getWidth(context) * 25 / 380,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: getWidth(context) * 15 / 380,
              )),
            ),
            endConnector: SolidLineConnector(
              color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              thickness: 5,
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
              width: getWidth(context) * 0.25,
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.topCenter,
              child: Text(
                "Processing",
                style: s12w600.copyWith(color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey),
              )),
          node: TimelineNode(
            indicator: DotIndicator(
              color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              size: getWidth(context) * 25 / 380,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.spinner,
                color: Colors.white,
                size: getWidth(context) * 15 / 380,
              )),
            ),
            startConnector: SolidLineConnector(
              color: status == OrderStatus.PROCESSING ? AppColors.orange : status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              thickness: 5,
            ),
            endConnector: SolidLineConnector(
              color: status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              thickness: 5,
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
              width: getWidth(context) * 0.25,
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.topCenter,
              child: Text(
                "On the way",
                style: s12w600.copyWith(color: status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey),
              )),
          node: TimelineNode(
            indicator: DotIndicator(
              color: status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              size: getWidth(context) * 25 / 380,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.mapMarkerAlt,
                color: Colors.white,
                size: getWidth(context) * 15 / 380,
              )),
            ),
            startConnector: SolidLineConnector(
              color: status == OrderStatus.DELIVERED ? Colors.green : status == OrderStatus.ONTHEWAY  ? AppColors.main : Colors.grey,
              thickness: 5,
            ),
            endConnector: SolidLineConnector(
              color: status == OrderStatus.DELIVERED ? Colors.green : Colors.grey,
              thickness: 5,
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
              alignment: Alignment.topCenter,
              width: getWidth(context) * 0.2,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Delivered",
                style: s12w600.copyWith(color: status == OrderStatus.DELIVERED ? Colors.green : Colors.grey),
              )),
          node: TimelineNode(
            indicator: DotIndicator(
              color: status == OrderStatus.DELIVERED ? Colors.green : Colors.grey,
              size: getWidth(context) * 25 / 380,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.white,
                size: getWidth(context) * 15 / 380,
              )),
            ),
            startConnector: SolidLineConnector(
              color: status == OrderStatus.DELIVERED ? Colors.green : Colors.grey,
              thickness: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOrderItems(BuildContext context, FakeProduct item) {
    return Container(
      height: getWidth(context) * 90/380,
      width: getWidth(context),
      margin: EdgeInsets.only(
        bottom: getWidth(context) * 10/380,
        left: getWidth(context) * 10/380,
        right: getWidth(context) * 10/380,
      ),
      padding: EdgeInsets.only(
        bottom: getWidth(context) * 10/380,
        top: getWidth(context) * 10/380,
        left: getWidth(context) * 10/380,
        right: getWidth(context) * 10/380,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidth(context) * 10/380),
          border: Border.all(color: Colors.grey.shade300)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(getWidth(context) * 25/380),
                child: Image.network(item.imgUrl,
                  width: getWidth(context) * 70/380,
                  height: getWidth(context) * 70/380,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${item.title}", style: s16w600.copyWith(color: AppColors.darkBlue),),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(text: TextSpan(text: "Add: ", style: s14w600.copyWith(color: AppColors.darkBlue), children: [TextSpan(text: "Cheese", style: s14w600.copyWith(color: AppColors.darkBlue, fontWeight: FontWeight.w300))]),),
                          RichText(text: TextSpan(text: "No: ", style: s14w600.copyWith(color: AppColors.darkBlue), children: [TextSpan(text: "Onion, Tomato", style: s14w600.copyWith(color: AppColors.darkBlue, fontWeight: FontWeight.w300))]),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Text("${item.price} SR", style: s16w600.copyWith(color: AppColors.main),)
        ],
      ),
    );
  }
}
