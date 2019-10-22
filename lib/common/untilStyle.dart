import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilStyle {
  UtilStyle._();
  static var tableContentFont = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontSize: 10,
      fontWeight: FontWeight.bold);
  static var tableContentFontB = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontSize: 10,
      color: Color.fromRGBO(74, 119, 183, 1),
      fontWeight: FontWeight.bold,
      letterSpacing: -0.3);
  static var tableHeadFont = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 0.5));
  static var addressButtonFont = new TextStyle(
    fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      letterSpacing: -0.24);
  static var sellDate = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 1),
      fontWeight: FontWeight.bold);
  static var sellTime = new TextStyle(
    fontWeight: FontWeight.bold,
    // fontFamily: 'GothamRnd',
    fontSize: 10,
    color: Color.fromRGBO(0, 0, 0, 0.74),
  );
  static var sellStatus = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var tabSelectedFont = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var tabUnselectedFont = new TextStyle(
      // fontFamily: 'GothamRnd',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(17, 27, 41, 0.5));
  static var formSubmitFont = new TextStyle(
      fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 13,
      color: Color.fromRGBO(0, 0, 0, 1),
      letterSpacing: 2);
  static var formTitleFont = new TextStyle(
      fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 0.95));
  static var formSubtitleFont = new TextStyle(
      fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 0.5),);
  static var formSelectFont = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var formKeyFont = new TextStyle(
      fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 10,
      color: Color.fromRGBO(255, 255, 255, 0.85));
  static var formInputFont = new TextStyle(
      fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 40,
      color: Color.fromRGBO(255, 255, 255, 1));
  static var formCacularFont = new TextStyle(
      // fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 20,
      color: Color.fromRGBO(255, 255, 255, 0.5),
      letterSpacing: ScreenUtil().setHeight(-0.61));
  static var formCacularFontB = new TextStyle(
      // fontWeight: FontWeight.bold,
      // fontFamily: 'GothamRnd',
      fontSize: 20,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      letterSpacing: ScreenUtil().setHeight(-0.61));
  static var tagTitleFont = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(74, 119, 183, 0.75),
      letterSpacing: 3.5);
  static var tagTitleFontActive = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(74, 119, 183, 1),
      letterSpacing: 3.5);
  static var faqContentFontActive = new TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'GothamRnd',
      fontSize: ScreenUtil().setSp(12),
      color: Color.fromRGBO(17, 27, 41, 0.75),
      height: 1.7);
}
