import 'package:dagtalahdeliveryapp/Utility/Util.dart';
import 'package:flutter/material.dart';

TextStyle s13w300 =                 TextStyle(fontSize: 13, fontWeight: FontWeight.w300);
TextStyle s12w600 =                 TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
TextStyle s14w600 =                 TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
TextStyle s16w600 =                 TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle s16boldTopLeftTitle =     TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle s17w300 =                 TextStyle(fontSize: 17, fontWeight: FontWeight.w300);
TextStyle s17w700 =                 TextStyle(fontSize: 17, fontWeight: FontWeight.w700);
TextStyle s18w700ProductViewTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
TextStyle s20w800 =                 TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
TextStyle s22w700AppBarTitle =      TextStyle(fontSize: 22, fontWeight: FontWeight.w700);

InputBorder getTextFieldBorder(BuildContext context){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(getWidth(context) * 15/380)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ));
}

InputBorder getTextFieldBorderFocused(BuildContext context){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(getWidth(context) * 15/380)),
      borderSide: BorderSide(
        color: Colors.black26,
      ));
}