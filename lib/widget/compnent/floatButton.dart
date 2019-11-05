import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/widget/menu/footMenu.dart';

class FloatButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
            width: ScreenUtil().setSp(45),
            height: ScreenUtil().setSp(45),
            child: new FlatButton(
              splashColor: Color(0xfff2f4f8),
              highlightColor: Color(0xfff2f4f8),
              onPressed: () {
                showDialog<Null>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new FootMenu();
                    });
              },
              padding: EdgeInsets.all(0),
              child: new Container(
                child: new Image.asset('images/logo.png'),
              ),
            ),
          );
  }
}