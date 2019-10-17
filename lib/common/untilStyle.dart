import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilStyle{
  UtilStyle._();
  static var tableContentFont = new TextStyle(
    fontFamily: 'Helvetica',
    fontSize: ScreenUtil().setSp(10),
    fontWeight: FontWeight.bold
  );
  static var tableHeadFont = new TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(10),
    color: Color.fromRGBO(0, 0, 0, 0.5)
  );
  static var addressButtonFont = new TextStyle(
    fontFamily: 'Helvetica',
    fontSize: ScreenUtil().setSp(10),
    color: Color.fromRGBO(0, 0, 0, 0.5),
    letterSpacing: ScreenUtil().setSp(-0.24)
  );
  static var sellDate = new TextStyle(
    fontFamily: 'Helvetica',
    fontSize: ScreenUtil().setSp(10),
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.bold
  );
  static var sellTime = new TextStyle(
    fontFamily: 'Helvetica',
    fontSize: ScreenUtil().setSp(8),
    color: Color.fromRGBO(0, 0, 0, 0.74),
  );
  static var sellStatus = new TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(11),
    color: Color.fromRGBO(0, 0, 0, 1)
  );
}