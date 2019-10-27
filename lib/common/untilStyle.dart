import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilStyle {
  static var mfaTitleStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.5),
    fontWeight: FontWeight.bold,
    fontSize: 10
  );
  static var mfaContentStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 10,
    height: 1.6
  );
  static var tokenDetailTitleStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.5),
    fontWeight: FontWeight.bold,
    fontSize: 10
  );
  static var tokenDetailContentStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 10
  );
  static var tokenInputStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 10
  );
  static var selectOptionStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 12
  );
  static var timeTagFont= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 8,
    letterSpacing: -0.24
  );
  static var timeTagFontActive= new TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontWeight: FontWeight.bold,
    fontSize: 8,
    letterSpacing: -0.24
  );
  static var tokenInputTagStyle= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 8
  );

  static var lengthFont= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.5),
    fontWeight: FontWeight.bold,
    fontSize: 10
  );

  static var lengthErrorFont= new TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 10
  );

  static var tokenMenuFont= new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  UtilStyle._();
  static var tokenTitleFont = new TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.35),
    fontWeight: FontWeight.bold,
    fontSize: 12
  );
  static var tableContentFont = new TextStyle(
      //
      fontSize: 10,
      fontWeight: FontWeight.bold);
  static var tableContentFontB = new TextStyle(
      //
      fontSize: 10,
      color: Color.fromRGBO(74, 119, 183, 1),
      fontWeight: FontWeight.bold,
      letterSpacing: -0.3);
  static var tableHeadFont = new TextStyle(
      //
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 0.5));
  static var addressButtonFont = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      letterSpacing: -0.24);
  static var sellDate = new TextStyle(
      //
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 1),
      fontWeight: FontWeight.bold);
  static var sellTime = new TextStyle(
    fontWeight: FontWeight.bold,
    //
    fontSize: 10,
    color: Color.fromRGBO(0, 0, 0, 0.74),
  );
  static var sellStatus = new TextStyle(
      //
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var tabSelectedFont = new TextStyle(
      //
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var tabUnselectedFont = new TextStyle(
      //
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(17, 27, 41, 0.5));
  static var formSubmitFont = new TextStyle(
      fontWeight: FontWeight.bold,
      //
      fontSize: 13,
      color: Color.fromRGBO(0, 0, 0, 1),
      letterSpacing: 2);
  static var formTitleFont = new TextStyle(
      fontWeight: FontWeight.bold,
      //
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 0.95));
  static var formSubtitleFont = new TextStyle(
    fontWeight: FontWeight.bold,
    //
    fontSize: 10,
    color: Color.fromRGBO(0, 0, 0, 0.5),
  );
  static var formSelectFont = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 1));
  static var formKeyFont = new TextStyle(
      fontWeight: FontWeight.bold,
      //
      fontSize: 10,
      color: Color.fromRGBO(255, 255, 255, 0.85));
  static var formInputFont = new TextStyle(
      fontWeight: FontWeight.bold,
      //
      fontSize: 40,
      color: Color.fromRGBO(255, 255, 255, 1));
  static var formCacularFont = new TextStyle(
      // fontWeight: FontWeight.bold,
      //
      fontSize: 20,
      color: Color.fromRGBO(255, 255, 255, 0.5),
      letterSpacing: ScreenUtil().setHeight(-0.61));
  static var formCacularFontB = new TextStyle(
      // fontWeight: FontWeight.bold,
      //
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
      fontSize: ScreenUtil().setSp(12),
      color: Color.fromRGBO(17, 27, 41, 0.75),
      height: 1.7);
  static var aboutTitle = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: ScreenUtil().setSp(12),
      color: Color.fromRGBO(17, 27, 41, 1),
      letterSpacing: 3.5);
  static var aboutContent = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(0, 0, 0, 0.75),
      height: 1.6);
  static var aboutContentLink = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromRGBO(74, 119, 183, 0.75),
      height: 1.6);
}
