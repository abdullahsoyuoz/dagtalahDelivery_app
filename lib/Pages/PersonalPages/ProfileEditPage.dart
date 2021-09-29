import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Utility/FakeData.dart';
import 'package:dagtalahdeliveryapp/Utility/Styles.dart';
import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _nameController =
      new TextEditingController(text: "Sara");
  TextEditingController _surnameController =
      new TextEditingController(text: "Mohammad");
  TextEditingController _passwordController =
      new TextEditingController(text: "123yakup321");
  TextEditingController _emailController =
      new TextEditingController(text: "sara@example.com");
  TextEditingController _phonenumberController =
      new TextEditingController(text: "+966 5123456789");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Profile",
          style: s22w700AppBarTitle,
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
            children: [
              Padding(
                padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: getWidth(context) * 100 / 380,
                    width: getWidth(context) * 100 / 380,
                    child: Stack(
                      children: [
                        Container(
                          height: getWidth(context) * 100 / 380,
                          width: getWidth(context) * 100 / 380,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: AppColors.main, width: 2)),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  fakeProfileImage,
                                  fit: BoxFit.fitWidth,
                                  height: getWidth(context) * 100 / 380,
                                  width: getWidth(context) * 100 / 380,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 25,
                              height: 25,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.main, shape: BoxShape.circle),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.pencilAlt,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 40 / 380,
                  left: getWidth(context) * 20 / 380,
                  right: getWidth(context) * 20 / 380,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: s16boldTopLeftTitle,
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
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: s16boldTopLeftTitle,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                            getWidth(context) * 10 / 380)),
                                    child: TextField(
                                      controller: _surnameController,
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
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: s16boldTopLeftTitle,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) * 10 / 380)),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 15)),
                                )),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Change Password?",
                          style: s17w300.copyWith(color: AppColors.main),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: s16boldTopLeftTitle,
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
                                      contentPadding: EdgeInsets.only(left: 15)),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone",
                            style: s16boldTopLeftTitle,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) * 10 / 380)),
                                child: TextField(
                                  controller: _phonenumberController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 15)),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 32.0,
                        bottom: 32
                      ),
                      child: FlatButton(
                        color: AppColors.main,
                        height: getWidth(context) * 50/380,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getWidth(context) * 10 / 380)),
                        child: Center(
                          child: Text("Update", style: s17w300.copyWith(color: Colors.white),)
                        ),
                        onPressed: () {}),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
