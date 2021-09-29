import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserNewAddressPage extends StatefulWidget {
  @override
  _UserNewAddressPageState createState() => _UserNewAddressPageState();
}

class _UserNewAddressPageState extends State<UserNewAddressPage> {
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _addressDescController = new TextEditingController();
  TextEditingController _addressTitleController = new TextEditingController();
  int selectedRadioValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: getWidth(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/map.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(getWidth(context) * 20 / 380))),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 20 / 380),
                    child: Text(
                      "Delivery Location",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              getWidth(context) * 10 / 380)),
                      child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Street, City, ZIP code"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 10 / 380,
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              getWidth(context) * 10 / 380)),
                      child: TextField(
                        controller: _addressDescController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Landmark"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buildRadioButton(context, 0),
                            Text("Home", style: TextStyle(color: Colors.white, fontSize: 16),)],),
                        Row(
                          children: [
                            buildRadioButton(context, 1),
                            Text("Office", style: TextStyle(color: Colors.white, fontSize: 16),)],),
                        Row(
                          children: [
                            buildRadioButton(context, 2),
                            Text("Other", style:
                            TextStyle(color: Colors.white, fontSize: 16),)],),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                      bottom: getWidth(context) * 20 / 380,
                      left: getWidth(context) * 20 / 380,
                      right: getWidth(context) * 20 / 380,
                    ),
                    child: Container(
                      child: FlatButton(
                        color: selectedRadioValue != -1 ? AppColors.main : AppColors.main.withOpacity(0.5),
                        height: getWidth(context) * 50/380,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 15/380)),
                        child: Center(
                          child: Text(
                            "Save Address",
                            style: s17w300.copyWith(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          if(selectedRadioValue != -1){
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //  BackButton
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: AppBar().preferredSize.height,
                left: getWidth(context) * 10/380,
              ),
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.chevronLeft),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          //  onMap Icons
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            right: getWidth(context) * 20 / 380,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: getWidth(context) * 50 / 380,
                    width: getWidth(context) * 50 / 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(getWidth(context) * 15 / 380),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.slidersH,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 10 / 380),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: getWidth(context) * 50 / 380,
                      width: getWidth(context) * 50 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              getWidth(context) * 15 / 380),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.crosshairs,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildRadioButton(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        if(index == 2){
          selectedRadioValue = index;
          _showAdresDialog();
        }
        setState(() {
          selectedRadioValue = index;
        });
      },
      child: AnimatedContainer(
        curve: Curves.slowMiddle,
        duration: Duration(milliseconds: 1000),
        width: getWidth(context) * 20 / 380,
        height: getWidth(context) * 20 / 380,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: selectedRadioValue == index
            ? Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  width: getWidth(context) * 10 / 380,
                  height: getWidth(context) * 10 / 380,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              )
            : SizedBox(),
      ),
    );
  }

  void _showAdresDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 20/380)),
              child: Container(
                width: MediaQuery.of(context).size.width * 350/380,
                padding: EdgeInsets.symmetric(vertical: getWidth(context) * 15/380),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getWidth(context) * 25/380)
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getWidth(context) * 20/380,
                        ),
                        child: Text("New Address", style: TextStyle(color: AppColors.main,fontSize: 16, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getWidth(context) * 20/380,
                            left: getWidth(context) * 20/380,
                          ),
                          child: Text("Would you like to save this location?", style: TextStyle(color: AppColors.main,fontSize: 12, fontWeight: FontWeight.w600),),
                        )
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getWidth(context) * 20/380,
                            left: getWidth(context) * 20/380,
                            right: getWidth(context) * 20/380,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(getWidth(context) * 10/380)
                            ),
                            child: TextField(
                              controller: _addressTitleController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: "Ex. School",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),
                        )
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getWidth(context) * 15/380,
                            left: getWidth(context) * 20/380,
                            right: getWidth(context) * 20/380,
                          ),
                          child: Container(
                            width: getWidth(context) * 120/380,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(getWidth(context) * 10/380)
                            ),
                            child: FlatButton(
                              color: AppColors.main,
                              child: Center(
                                child: Text("Save", style: s17w300.copyWith(color: Colors.white),),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context))),
                              height: getWidth(context) * 40/380,
                              minWidth: getWidth(context) * 50/380,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
