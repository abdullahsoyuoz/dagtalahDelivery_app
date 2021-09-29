import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: s22w700AppBarTitle,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        centerTitle: true,
      ),
      body: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(getWidth(context) * 35 / 380)),
        child: Container(
          width: getWidth(context),
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 30 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          FakeData.fakeNotifyList.clear();
                        });
                      },
                      child: Text("Clear All", style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w600),)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                  ),
                  itemCount: FakeData.fakeNotifyList.length,
                  itemBuilder: (context, index) {
                    return buildNotifyItem(context, FakeData.fakeNotifyList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotifyItem(BuildContext context, FakeNotify item) {
    return Container(
      height: getWidth(context) * 60 / 380,
      margin: EdgeInsets.only(bottom: getWidth(context) * 30 / 380),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: getWidth(context) * 40 / 380,
                  height: getWidth(context) * 40 / 380,
                  margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 20/380),
                  decoration: BoxDecoration(
                    color: item.type == 0 ? Colors.redAccent : item.type == 1 ? Colors.greenAccent : Colors.blueAccent,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: FaIcon(
                      item.iconData,
                      color: Colors.white,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  item.description != null
                      ? Text(
                    item.title,
                    style: s13w300.copyWith(color: Colors.grey),
                  )
                      : SizedBox(),
                ],
              ),
            ],
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.chevronRight, color: AppColors.dark,),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}
