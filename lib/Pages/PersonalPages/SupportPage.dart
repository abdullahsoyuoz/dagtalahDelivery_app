import 'package:another_flushbar/flushbar.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Data.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  ScrollController _singleChildController = new ScrollController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _messsageController = new TextEditingController();
  TextEditingController _otherReasonController = new TextEditingController();
  int selectedDropDownValue;
  int currentScreen = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(
          "Support",
          style: s22w700AppBarTitle,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        centerTitle: true,
        leading: Center(
          child: IconButton(
            icon: FaIcon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              setState(() {
                if(currentScreen != -1){
                  currentScreen = -1;
                }
                else{
                  Navigator.pop(context);
                }
              });
            },
          ),
        ),
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
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              currentScreen == -1
                  ? buildDefaultScreen(context)
                  : currentScreen == 0
                  ? buildCallUsScreen(context)
                  : currentScreen == 1
                  ? buildEmailUsScreen(context)
                  : currentScreen == 2
                  ? buildChatScreen(context)
                  : SizedBox()
            ],
          ),
        )
      ),
    );
  }

  Widget buildSupportItem(BuildContext context, SupportItem item) {
    return InkWell(
      onTap: () {
        setState(() {
          if(item.id == 0){
            currentScreen = 0;
          }
        });
        setState(() {
          if(item.id == 1){
            currentScreen = 1;
          }
        });
        setState(() {
          if(item.id == 2){
            currentScreen = 2;
          }
        });
      },
      child: Container(
        height: getWidth(context) * 100 / 380,
        width: getWidth(context) * 100 / 380,
        margin: EdgeInsets.only(
          right: getWidth(context) * 20 / 380,
          top: getWidth(context) * 5 / 380,
          bottom: getWidth(context) * 5 / 380,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getWidth(context) * 15 / 380),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 1))
            ]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                item.iconData,
                size: getWidth(context) * 40 / 380,
                color: AppColors.main,
              ),
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 10 / 380),
                child: Text(
                  item.title,
                  style: s16w600.copyWith(color: AppColors.darkBlue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildDefaultScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getWidth(context) * 5/380,
        bottom: getWidth(context) * 25/380,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 10 / 380,
            ),
            child: Column(
              children: [
                Container(
                  height: getWidth(context) * 120 / 380,
                  width: getWidth(context),
                  margin: EdgeInsets.symmetric(
                      vertical: getWidth(context) * 10 / 380),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding:
                    EdgeInsets.only(left: getWidth(context) * 20 / 380),
                    itemCount: supportItemList.length,
                    itemBuilder: (context, index) {
                      return buildSupportItem(
                          context, supportItemList[index]);
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            width: getWidth(context),
            margin: EdgeInsets.only(top: getWidth(context) * 10 / 380),
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(context) * 20 / 380),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(getWidth(context) * 35 / 380),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0, -1),
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(top: getWidth(context) * 20 / 380),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Quick Contact",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: getWidth(context) * 30 / 380),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Name",
                            style: s16boldTopLeftTitle.copyWith(
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style:
                                  s16w600.copyWith(color: Colors.red))
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 10 / 380)),
                            child: TextField(
                              controller: _nameController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(left: 15)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: getWidth(context) * 10 / 380),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Email",
                            style: s16boldTopLeftTitle.copyWith(
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style:
                                  s16w600.copyWith(color: Colors.red))
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 10 / 380)),
                            child: TextField(
                              controller: _emailController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(left: 15)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 10/380),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Support Reason",
                            style: s16boldTopLeftTitle.copyWith(
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style:
                                  s16w600.copyWith(color: Colors.red))
                            ]),
                      ),
                      Container(
                        width: getWidth(context),
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                                getWidth(context) * 10 / 380)),
                        child: DropdownButton(
                          value: selectedDropDownValue,
                          icon: FaIcon(FontAwesomeIcons.chevronDown, color: AppColors.main,),
                          underline: SizedBox(),
                          dropdownColor: AppColors.backgroundColor,
                          isExpanded: true,
                          hint: Text("Select support reason..", style: s13w300.copyWith(color: Colors.grey),),
                          items: [
                            DropdownMenuItem(child: Text("Order Delay"), value: 0,),
                            DropdownMenuItem(child: Text("Issue with Order"), value: 1,),
                            DropdownMenuItem(child: Text("Payment / Refund Issue"), value: 2,),
                            DropdownMenuItem(child: Text("Others"), value: 3,),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDropDownValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                selectedDropDownValue == 3
                    ? Padding(
                  padding:
                  EdgeInsets.only(top: getWidth(context) * 10 / 380),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Other Reason",
                            style: s16boldTopLeftTitle.copyWith(
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style:
                                  s16w600.copyWith(color: Colors.red))
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 10 / 380)),
                            child: TextField(
                              controller: _otherReasonController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(left: 15)),
                            )),
                      )
                    ],
                  ),
                ) : SizedBox(),
                Padding(
                  padding:
                  EdgeInsets.only(top: getWidth(context) * 10 / 380),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Message",
                            style: s16boldTopLeftTitle.copyWith(
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style:
                                  s16w600.copyWith(color: Colors.red))
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 10 / 380)),
                            child: TextField(
                              controller: _messsageController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(left: 15)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 15/380,
                    bottom: getWidth(context) * 15/380,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async{
                        await Flushbar(
                          messageText: Text("Form has been sent", style: TextStyle(color: AppColors.main),),
                          flushbarStyle: FlushbarStyle.GROUNDED,
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 1),
                          animationDuration: Duration(milliseconds: 250),
                          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                      },
                      child: Container(
                        height: getWidth(context) * 35/380,
                        width: getWidth(context) * 80/380,
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(getWidth(context) * 15/380)
                        ),
                        child: Center(
                          child: Text("Send", style: s13w300.copyWith(color: Colors.white, fontSize: 15),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildCallUsScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 20/380),
            child: Image.asset("assets/images/contactBackground.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 30/380),
            child: Text("Customer Call Center", style: s22w700AppBarTitle.copyWith(color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 20/380,
              left: getWidth(context) * 20/380,
              right: getWidth(context) * 20/380,
            ),
            child: Text(loremIpsum, style: s13w300.copyWith(color: Colors.grey),),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 30/380),
            child: Text("+966 123456 7891", style: s16w600.copyWith(color: AppColors.main, fontWeight: FontWeight.w800),),
          )
        ],
      ),
    );
  }

  buildEmailUsScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 20/380),
            child: Image.asset("assets/images/contactBackground.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 30/380),
            child: Text("Contact Center", style: s22w700AppBarTitle.copyWith(color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 20/380,
              left: getWidth(context) * 20/380,
              right: getWidth(context) * 20/380,
            ),
            child: Text(loremIpsum, style: s13w300.copyWith(color: Colors.grey),),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 30/380),
            child: Text("Example@example.com", style: s16w600.copyWith(color: AppColors.main, fontWeight: FontWeight.w800),),
          )
        ],
      ),
    );
  }

  buildChatScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 20/380),
            child: Image.asset("assets/images/contactBackground.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 30/380),
            child: Text("Live Chat", style: s22w700AppBarTitle.copyWith(color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 20/380,
              left: getWidth(context) * 20/380,
              right: getWidth(context) * 20/380,
            ),
            child: Text(loremIpsum, style: s13w300.copyWith(color: Colors.grey),),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 15/380),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {

                },
                child: Container(
                  height: getWidth(context) * 30/380,
                  width: getWidth(context) * 100/380,
                  decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(getWidth(context) * 15/380)
                  ),
                  child: Center(
                    child: Text("Start Now", style: s13w300.copyWith(color: Colors.white, fontSize: 15),),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
