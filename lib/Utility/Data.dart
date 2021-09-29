import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePageMenuItem{
  int id;
  String title;
  Widget icon;
  ProfilePageMenuItem(this.id, this.title, this.icon);
}

class SocialMediaItem{
  int id;
  String title;
  IconData icondata;
  SocialMediaItem(this.id, this.title, this.icondata);
}

class SupportItem{
  int id;
  String title;
  IconData iconData;
  SupportItem(this.id, this.title, this.iconData);
}

ProfilePageMenuItem m1 = ProfilePageMenuItem(0, "My Orders", FaIcon(FontAwesomeIcons.shoppingBag, color: AppColors.main,));
ProfilePageMenuItem m2 = ProfilePageMenuItem(1, "Addresses", FaIcon(FontAwesomeIcons.mapMarkerAlt, color: AppColors.main,));
ProfilePageMenuItem m3 = ProfilePageMenuItem(2, "Payment", FaIcon(FontAwesomeIcons.dollarSign, color: AppColors.main,));
ProfilePageMenuItem m4 = ProfilePageMenuItem(3, "Rewards", FaIcon(FontAwesomeIcons.medal, color: AppColors.main,));
ProfilePageMenuItem m5 = ProfilePageMenuItem(4, "Notifications", FaIcon(FontAwesomeIcons.solidBell, color: AppColors.main,));
ProfilePageMenuItem m6 = ProfilePageMenuItem(5, "Support", FaIcon(FontAwesomeIcons.solidComments, color: AppColors.main,));

SocialMediaItem facebook = SocialMediaItem(0, "Facebook", FontAwesomeIcons.facebook);
SocialMediaItem instagram = SocialMediaItem(1, "Instagram", FontAwesomeIcons.instagram);
SocialMediaItem twitter = SocialMediaItem(2, "Twitter", FontAwesomeIcons.twitter);
SocialMediaItem whatsapp = SocialMediaItem(3, "Whatspp", FontAwesomeIcons.whatsapp);

SupportItem callUs = SupportItem(0, "Call us", FontAwesomeIcons.headset);
SupportItem emailUs = SupportItem(1, "Email us", FontAwesomeIcons.envelopeOpenText);
SupportItem chat = SupportItem(2, "Chat", FontAwesomeIcons.comments);

List<String> dropValues = <String>["Pick Up", "Delivery",];
List<ProfilePageMenuItem> profilePageMenuList = <ProfilePageMenuItem>[m1, m2, m3, m4, m5, m6,];
List<SocialMediaItem> socialMediaItemList = <SocialMediaItem>[facebook, instagram, twitter, whatsapp];
List<SupportItem> supportItemList = <SupportItem>[callUs, emailUs, chat];