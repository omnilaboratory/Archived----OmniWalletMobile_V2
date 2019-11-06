import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FootMenu extends Dialog {
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
                splashColor: Color(0x00ffffff),
                highlightColor: Color(0x00ffffff),
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
            bottom: 40,
            right: 40,
            child: new Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(15),
                  bottom: ScreenUtil().setHeight(15),
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24)),
              width: ScreenUtil().setWidth(158),
              height: ScreenUtil().setHeight(235),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    bottomLeft: Radius.circular(ScreenUtil().setHeight(44)),
                    topRight: Radius.circular(ScreenUtil().setHeight(44)),
                  ),
                  color: Colors.white),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new MenuItem(
                    menuName: 'MY WALLET',
                    menuIcon: 'images/wallet.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/walletAndAddress');
                    },
                  ),
                  new MenuItem(
                    menuName: 'MY TOKEN',
                    menuIcon: 'images/wallet.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/tokenHome');
                    },
                  ),
                  new MenuItem(
                    menuName: 'EXCHANGE',
                    menuIcon: 'images/exchange.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/exchange');
                    },
                  ),
                  new MenuItem(
                    menuName: 'EXPLORER',
                    menuIcon: 'images/explorer.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/explorer');
                    },
                  ),
                  new MenuItem(
                    menuName: 'FAQ',
                    menuIcon: 'images/faq.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/faq');
                    },
                  ),
                  new MenuItem(
                    menuName: 'ABOUT',
                    menuIcon: 'images/about.png',
                    onPress: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: new Container(
              width: 50,
              child: Image.asset('images/logo.png'),
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
        splashColor: Color(0x00ffffff),
        highlightColor: Color(0x00ffffff),
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
                    // fontFamily: 'GothamRnd',
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
