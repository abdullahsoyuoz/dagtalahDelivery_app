import 'package:dagtalahdeliveryapp/Pages/PaymentPages/UserPaymentsPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PersonalPages/NotificationPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PersonalPages/ProfileEditPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PersonalPages/SupportPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PersonalPages/UserAddressesPage.dart';
import 'package:dagtalahdeliveryapp/Pages/PersonalPages/RewardsPage.dart';
import 'package:dagtalahdeliveryapp/Pages/OrderPages/UserOrdersPage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Data.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController _socialMediaListController = new ScrollController();
  ScrollController _profilePageMenuListController = new ScrollController();
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(context) * 35 / 380)),
          child: Container(
            width: getWidth(context),
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: getWidth(context) * 150 / 380),
            padding: EdgeInsets.only(
              top: getWidth(context) * 0 / 380,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(context) * 35 / 380))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(context) * 35 / 380)),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: IconButton(
                      icon: Container(
                        height: getWidth(context) * 50/380,
                        width: getWidth(context),
                        child: FaIcon(
                          isListView ? FontAwesomeIcons.thList : FontAwesomeIcons.th,
                          color: AppColors.main,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isListView = !isListView;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 0 / 380),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Hi Sara,\nWelcome Back",
                          textAlign: TextAlign.center,
                          style: s20w800.copyWith(color: AppColors.dark),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 10/380),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileEditPage()));
                        },
                        child: Container(
                          height: getWidth(context) * 25/380,
                          width: getWidth(context) * 50/380,
                          decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(getWidth(context) * 15/380)
                          ),
                          child: Center(
                            child: Text("Edit", style: s13w300.copyWith(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isListView
                      ? Container(
                          width: getWidth(context),
                          margin: EdgeInsets.only(top: getWidth(context) * 20/380),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            controller: _profilePageMenuListController,
                            shrinkWrap: true,
                            itemCount: profilePageMenuList.length,
                            itemBuilder: (context, index) {
                              return buildGridViewItem(context, profilePageMenuList[index]);
                            },
                          ),
                  )
                      : Container(
                          width: getWidth(context),
                          height: (getWidth(context) * 50/380) * profilePageMenuList.length,
                          margin: EdgeInsets.only(top: getWidth(context) * 20/380),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            controller: _profilePageMenuListController,
                            shrinkWrap: true,
                            itemCount: profilePageMenuList.length,
                            itemBuilder: (context, index) {
                              return buildListViewItem(context, profilePageMenuList[index]);
                            },
                          ),
                        ),
                  Container(
                    height: getWidth(context) * 50/380,
                    width: getWidth(context),
                    margin: EdgeInsets.only(bottom: 30),
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: ListView.builder(
                        controller: _socialMediaListController,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: socialMediaItemList.length,
                        itemBuilder: (context, index) {
                          return buildSocialMediaIcons(context, socialMediaItemList[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getWidth(context) * 90 / 380),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: getWidth(context) * 120 / 380,
              width: getWidth(context) * 120 / 380,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 10)
                  ]),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.network(fakeProfileImage,
                      fit: BoxFit.fitWidth,
                      height: getWidth(context) * 150 / 380,
                      width: getWidth(context) * 150 / 380,
                    )),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildListViewItem(BuildContext context, ProfilePageMenuItem item) {
    return InkWell(
      onTap: () {
        if(item.id == 0)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserOrdersPage(),));
        if(item.id == 1)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserAddressesPage(),));
        if(item.id == 2)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserPaymentsPage(),));
        if(item.id == 3)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserRewardsPage(),));
        if(item.id == 4)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => NotificationsPage(),));
        if(item.id == 5)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => SupportPage(),));
      },
      child: Container(
        height: getWidth(context) * 50/380,
        width: getWidth(context),
        padding: EdgeInsets.only(left: getWidth(context) * 20/380),
        color: item.id % 2 == 0 ? Colors.white : AppColors.backgroundColor,
        child: Row(
          children: [
            Container(
              height: getWidth(context) * 50/380,
              width: getWidth(context) * 50/380,
              child: Center(child: item.icon)),
            Text(item.title, style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),),
          ],
        ),
      ),
    );
  }

  Widget buildGridViewItem(BuildContext context, ProfilePageMenuItem item) {
    return InkWell(
      onTap: () {
        if(item.id == 0)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserOrdersPage(),));
        if(item.id == 1)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserAddressesPage(),));
        if(item.id == 2)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserPaymentsPage(),));
        if(item.id == 3)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => UserRewardsPage(),));
        if(item.id == 4)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => NotificationsPage(),));
        if(item.id == 5)
          Navigator.push(context, CupertinoPageRoute(builder: (context) => SupportPage(),));
      },
      child: Container(
        height: getWidth(context) * 145/380,
        width: getWidth(context) * 145/380,
        margin: EdgeInsets.only(bottom: getWidth(context) * 5/380),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                item.icon,
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 10/380),
                  child: Text(item.title, style: TextStyle(
                    fontSize: 15
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSocialMediaIcons(BuildContext context, SocialMediaItem item) {
    return InkWell(
      onTap: () {
        if(item.id == 0){ /* Navigate Facebook */}
        if(item.id == 1){ /* Navigate Instagram */}
        if(item.id == 2){ /* Navigate Twitter */}
        if(item.id == 3){ /* Navigate Whatsapp */}
      },
      child: Container(
        width: getWidth(context) * 30/380,
        margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 15/380,),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(child: FaIcon(item.icondata, color: AppColors.dark, size: getWidth(context) * 20/380),),
      ),
    );
  }
}
