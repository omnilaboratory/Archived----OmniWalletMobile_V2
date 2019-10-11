import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/model/localModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:omni/language/language.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(70, 116, 182, 0.10),
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/menu.png'),
                onPressed: () {},
              )
            ],
          ),
          body: new Container(
              height: ScreenUtil().setHeight(812),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: ScreenUtil().setWidth(376),
                    color: Color.fromRGBO(70, 116, 182, 0.10),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(120)),
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setWidth(100),
                          child: new Image.asset('images/logo.png'),
                        ),
                        new Container(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(29)),
                          child: new Text('OMNI',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: ScreenUtil().setSp(26),
                                  color: Color.fromRGBO(93, 93, 93, 1),
                                  letterSpacing: ScreenUtil().setSp(10))),
                        ),
                        new Container(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                          child: new Text('WALLET',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: ScreenUtil().setSp(11),
                                  color: Color.fromRGBO(128, 168, 226, 1),
                                  letterSpacing: ScreenUtil().setSp(12))),
                        ),
                      ],
                    ),
                  ),
                  new Positioned(
                    bottom: 0,
                    child: new Container(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
                      height: ScreenUtil().setHeight(238),
                      width: ScreenUtil().setWidth(376),
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(242, 244, 248, 1),
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(ScreenUtil().setHeight(44)),
                            topRight:
                                Radius.circular(ScreenUtil().setHeight(44))),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.10),
                              offset: Offset(
                                ScreenUtil().setSp(0),
                                ScreenUtil().setSp(0),
                              ),
                              blurRadius: 40.0,
                              spreadRadius: 2.0),
                        ],
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: ScreenUtil().setHeight(48),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  width: ScreenUtil().setWidth(186),
                                  child: new FlatButton(
                                    onPressed: () {
                                      model.changeLoginType('login');
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: new Text(
                                        Language.login[model.language],
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Color.fromRGBO(
                                                128, 168, 226, 1),
                                            letterSpacing:
                                                ScreenUtil().setSp(3))),
                                  ),
                                ),
                                new Container(
                                  width: ScreenUtil().setWidth(2),
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                                new Container(
                                  width: ScreenUtil().setWidth(186),
                                  child: new FlatButton(
                                    onPressed: () {
                                      model.changeLoginType('create');
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: new Text(
                                        Language.create[model.language],
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Color.fromRGBO(
                                                128, 168, 226, 1),
                                            letterSpacing:
                                                ScreenUtil().setSp(3))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(48)),
                            height: ScreenUtil().setHeight(48),
                            width: ScreenUtil().setWidth(206),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(179, 199, 226, 1),
                                  Color.fromRGBO(74, 119, 183, 1)
                                ])),
                            child: FlatButton(
                              child: new Container(
                                child: new Text(
                                  Language.checkBlance[model.language],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: ScreenUtil().setSp(10),
                                      color: Colors.white,
                                      letterSpacing: ScreenUtil().setSp(5)),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
