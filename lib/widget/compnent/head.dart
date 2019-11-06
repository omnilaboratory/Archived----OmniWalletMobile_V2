import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/widget/menu/loginTopMenu.dart';
import 'package:omni/widget/menu/topMenu.dart';

class BeforLoginHead extends StatefulWidget {
  final bool isHome;
  BeforLoginHead({Key key, this.isHome}) : super(key: key);
  _BeforLoginHeadState createState() => new _BeforLoginHeadState();
}

class _BeforLoginHeadState extends State<BeforLoginHead> {
  bool isHome;
  @override
  void initState() {
    super.initState();
    isHome = widget.isHome;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: ScreenUtil().setWidth(376),
        height: ScreenUtil().setHeight(812),
        color: Color(0xfff2f4f8),
        alignment: Alignment.topLeft,
        child: new Container(
          alignment: Alignment.bottomLeft,
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left: 18, right: 18),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              isHome
                  ? new Container(
                      height: 32,
                      width: 32,
                    )
                  : new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(70, 116, 182, 0.15),
                                      offset: Offset(3, 8),
                                      blurRadius: 8)
                                ]),
                            child: new Image.asset('images/logo.png'),
                          ),
                          new Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 26,
                            child: new Image.asset('images/omni.png'),
                          )
                        ],
                      ),
                    ),
              new Container(
                height: ScreenUtil().setHeight(32),
                width: ScreenUtil().setWidth(32),
                decoration:
                    new BoxDecoration(borderRadius: BorderRadius.circular(46)),
                child: new FlatButton(
                  splashColor: Color(0xfff2f4f8),
                  highlightColor: Color(0xfff2f4f8),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context,
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
                    child: Image.asset('images/menu.png'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class AfterLoginHead extends StatefulWidget {
  _AfterLoginHead createState() => new _AfterLoginHead();
}

class _AfterLoginHead extends State<AfterLoginHead> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        width: ScreenUtil().setWidth(376),
        height: ScreenUtil().setHeight(812),
        color: Color(0xfff2f4f8),
        alignment: Alignment.topLeft,
        child: new Container(
          alignment: Alignment.bottomLeft,
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left: 18, right: 18),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
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
                                blurRadius: 8)
                          ]),
                      child: new Image.asset('images/logo.png'),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 26,
                      child: new Image.asset('images/omni.png'),
                    )
                  ],
                ),
              ),
              new Container(
                height: ScreenUtil().setHeight(32),
                width: ScreenUtil().setWidth(32),
                decoration:
                    new BoxDecoration(borderRadius: BorderRadius.circular(46)),
                child: new FlatButton(
                  splashColor: Color(0xfff2f4f8),
                  highlightColor: Color(0xfff2f4f8),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new TopMenu();
                        });
                  },
                  child: new Container(
                    height: 32,
                    width: 32,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(46)),
                    child: Image.asset('images/defaultAvatar.png'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
