import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/widget/menu/loginTopMenu.dart';
import 'package:omni/widget/menu/topMenu.dart';

class MyBaseBar extends PreferredSize {
  final Widget child;
  MyBaseBar({this.child});
@override
  final Size preferredSize = Size.fromHeight(ScreenUtil().setHeight(50));
  @override
  Widget build(BuildContext context) {
    Widget current = child;
    if (child == null) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    return current;
  }
}

class LoginAppBar extends StatelessWidget{
  final bool isHome;
  LoginAppBar({this.isHome});
  @override
  Widget build(BuildContext context) {
    return new AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: isHome?Color.fromRGBO(70, 116, 182, 0.10):Color.fromRGBO(242, 244, 248, 1),
            title: isHome?new Container():new Container(
              height: 40,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.15),
                          offset: Offset(3, 8),
                          blurRadius: 8
                        )
                      ]
                    ),
                    child: new Image.asset('images/logo.png'),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 26,
                    child: new Image.asset('images/omni.png'),
                  )
                ],
              )
            ),
            actions: <Widget>[
              new Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                height: ScreenUtil().setHeight(32),
                width: ScreenUtil().setWidth(32),
                decoration:
                    new BoxDecoration(borderRadius: BorderRadius.circular(46)),
                child: new FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context, //BuildContext对象
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new LoginTopMenu();
                        });
                  },
                  child: new Container(
                    height: 26,
                    width: 26,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(46)),
                    // child: new Image.network(),
                    child: Image.asset('images/menu.png'),
                  ),
                ),
              )
            ],
          );
  }
}
class AfterLoginAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new AppBar(
            backgroundColor: Color.fromRGBO(70, 116, 182, 0.068),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: new Container(
              height: 40,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.12),
                          offset: Offset(4, 4),
                          blurRadius: 4

                        )
                      ]
                    ),
                    child: new Image.asset('images/logo.png'),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 26,
                    child: new Image.asset('images/omni.png'),
                  )
                ],
              )
            ),
            actions: <Widget>[
              new Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(32),
                    ),
                child: new FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context, //BuildContext对象
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new TopMenu();
                        });
                  },
                  child: new Container(
                    height: ScreenUtil().setHeight(46),
                    width: ScreenUtil().setWidth(46),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(46)),
                    // child: new Image.network(),
                    child: Image.asset('images/defaultAvatar.png'),
                  ),
                ),
              )
            ],
          );
  }
}

class AfterLoginFaqAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new AppBar(
            backgroundColor: Color.fromRGBO(70, 116, 182, 0.07),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: new Container(
              height: 40,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.12),
                          offset: Offset(4, 4),
                          blurRadius: 4

                        )
                      ]
                    ),
                    child: new Image.asset('images/logo.png'),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 26,
                    child: new Image.asset('images/omni.png'),
                  )
                ],
              )
            ),
            actions: <Widget>[
              new Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                height: ScreenUtil().setHeight(32),
                width: ScreenUtil().setWidth(32),
                decoration:new BoxDecoration(borderRadius: BorderRadius.circular(46)),
                child: new FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context, //BuildContext对象
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new TopMenu();
                        });
                  },
                  child: new Container(
                    height: ScreenUtil().setHeight(46),
                    width: ScreenUtil().setWidth(46),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(46)),
                    // child: new Image.network(),
                    child: Image.asset('images/defaultAvatar.png'),
                  ),
                ),
              )
            ],
          );
  }
}