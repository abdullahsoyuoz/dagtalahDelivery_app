import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserRewardsPage extends StatefulWidget {
  @override
  _UserRewardsPageState createState() => _UserRewardsPageState();
}

class _UserRewardsPageState extends State<UserRewardsPage> {
  ScrollController _singleChildController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Rewards",
          style: s22w700AppBarTitle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.main,
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
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: getWidth(context) * 150 / 380,
                    width: getWidth(context) * 150 / 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 5))
                        ]),
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.network(
                            fakeProfileImage,
                            fit: BoxFit.fitWidth,
                            height: getWidth(context) * 150 / 380,
                            width: getWidth(context) * 150 / 380,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 15 / 380),
                child: Chip(
                  label: Text(
                    "Total Points 300",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  backgroundColor: AppColors.main,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(getWidth(context) * 35 / 380)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                  ),
                  itemCount: FakeData.fakeRewardList.length,
                  itemBuilder: (context, index) {
                    return buildRewardItem(
                        context, FakeData.fakeRewardList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRewardItem(BuildContext context, FakeReward item) {
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
                  width: getWidth(context) * 60 / 380,
                  height: getWidth(context) * 40 / 380,
                  child: Center(
                    child: FaIcon(
                      item.iconData,
                      color: AppColors.main,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  item.description != null
                      ? Text(
                          item.description,
                          style: s13w300.copyWith(color: Colors.grey),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: AppColors.dark,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
