import 'package:dagtalahdeliveryapp/Pages/PersonalPages/UserNewAddressPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAddressesPage extends StatefulWidget {
  @override
  _UserAddressesPageState createState() => _UserAddressesPageState();
}

class _UserAddressesPageState extends State<UserAddressesPage> {
  ScrollController _singleChildController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Addresses",
          style: s22w700AppBarTitle,
        ),
        centerTitle: true,
        elevation: 0,
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
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(getWidth(context) * 35 / 380)),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 40 / 380,
                    left: getWidth(context) * 20 / 380,
                  ),
                  child: Container(
                      height: getWidth(context) * 30 / 380,
                      child: Text(
                        "Saved Locations",
                        style: s16boldTopLeftTitle,
                      )),
                ),
                Container(
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + AppBar().preferredSize.height + getWidth(context) * 200/380),
                    margin: EdgeInsets.only(bottom: getWidth(context) * 20/380),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380,
                        right: getWidth(context) * 20 / 380,
                      ),
                      itemCount: FakeData.fakeAddressList.length,
                      itemBuilder: (context, index) {
                        return buildAddressItem(
                            context, FakeData.fakeAddressList[index]);
                      },
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                      bottom: getWidth(context) * 50 / 380),
                  child: FlatButton(
                    color: AppColors.main,
                    child: Center(
                      child: Text(
                        "Add New Address",
                        style: s17w300.copyWith(color: Colors.white),
                      ),
                    ),
                    height: getWidth(context) * 50 / 380,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) * 10 / 380)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UserNewAddressPage(),
                          ));
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

  Widget buildAddressItem(BuildContext context, FakeAddress item) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: getWidth(context) * 60 / 380,
            width: getWidth(context) * 60 / 380,
            child: Center(
              child: FaIcon(
                item.iconData,
                color: AppColors.main,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                item.address,
                style: s13w300.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
