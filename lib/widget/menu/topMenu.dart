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
            top: ScreenUtil().setHeight(24),
            right: ScreenUtil().setWidth(48),
            child: new Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(15),
                  bottom: ScreenUtil().setHeight(15),
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24)),
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(120),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    bottomLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    bottomRight: Radius.circular(ScreenUtil().setHeight(44)),
                  ),
                  color: Colors.white),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new MenuItem(
                    menuName: 'ACCOUNT SETTING',
                    menuIcon: 'images/settings.png',
                    onPress: null,
                  ),
                  new MenuItem(
                    menuName: 'LOG OUT',
                    menuIcon: 'images/logout.png',
                    onPress: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({this.menuName, this.menuIcon, this.onPress});
  final String menuName;
  final String menuIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(32),
      child: FlatButton(
        onPressed: onPress,
        padding: EdgeInsets.all(0),
        child: new Container(
            child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Text(
                menuName,
                textAlign: TextAlign.right,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GothamRnd',
                    fontSize: ScreenUtil().setSp(10),
                    color: Colors.black),
              ),
            ),
            new Container(
              width: ScreenUtil().setWidth(24),
              child: new Image.asset(menuIcon),
            ),
          ],
        )),
      ),
    );
  }
}
