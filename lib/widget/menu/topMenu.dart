import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenu extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0,
            left: 0,
            child: new Container(
              child: new FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Container(
                  height: ScreenUtil().setHeight(812),
                  width: ScreenUtil().setWidth(376),
                ),
              ),
            ),
          ),
          new Positioned(
            top: ScreenUtil().setHeight(35),
            right: ScreenUtil().setWidth(24),
            child: new Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30),
                  bottom: ScreenUtil().setHeight(30),
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24)),
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(124),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    bottomLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    bottomRight: Radius.circular(ScreenUtil().setHeight(44)),
                  ),
                  color: Colors.white),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'ACCOUNT SETTING',
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: ScreenUtil().setSp(10),
                              color: Colors.black,
                              height: 1.7),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(24),
                        child: new Image.asset('images/settings.png'),
                      ),
                    ],
                  )),
                  new Container(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'LOG OUT',
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: ScreenUtil().setSp(10),
                              color: Colors.black,
                              height: 1.7),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(24),
                        child: new Image.asset('images/logout.png'),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
