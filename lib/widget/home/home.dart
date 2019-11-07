import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/home/unlock.dart';
import 'package:omni/widget/login/LoginAndCreate.dart';
import 'package:omni/language/language.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          body: new Container(
              // color: Color.fromRGBO(242, 244, 248, 1),
              height: ScreenUtil().setHeight(812),
              child: new Stack(
                children: <Widget>[
                  new Positioned(
                    child: new BeforLoginHead(isHome: true),
                  ),
                  new Positioned(
                    top: ScreenUtil().setHeight(150),
                    child: new Container(
                    width: ScreenUtil().setWidth(376),
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Color.fromRGBO(93, 93, 93, 1),
                                  letterSpacing: 10)),
                        ),
                        new Container(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                          child: new Text(
                            'WALLET',
                            textAlign: TextAlign.center,
                            style: UtilStyle.tagTitleFontActive,
                          ),
                        )
                      ],
                    ),
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
                                    splashColor: Color(0x00ffffff),
                                    highlightColor: Color(0x00ffffff),
                                    onPressed: () {
                                      model.changeLoginType('login');
                                      Navigator.push(context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return new LoginAndCreate();
                                      }));
                                    },
                                    child: new Text(
                                        Language.login[model.language],
                                        textAlign: TextAlign.center,
                                        style: UtilStyle.tagTitleFontActive),
                                  ),
                                ),
                                new Container(
                                  width: ScreenUtil().setWidth(2),
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                                new Container(
                                  width: ScreenUtil().setWidth(186),
                                  child: new FlatButton(
                                    splashColor: Color(0x00ffffff),
                                    highlightColor: Color(0x00ffffff),
                                    onPressed: () {
                                      model.changeLoginType('create');
                                      Navigator.push(context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return new LoginAndCreate();
                                      }));
                                    },
                                    child: new Text(
                                        Language.create[model.language],
                                        textAlign: TextAlign.center,
                                        style: UtilStyle.tagTitleFontActive),
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
                              splashColor: Color(0x00ffffff),
                              highlightColor: Color(0x00ffffff),
                              child: new Container(
                                child: new Text(
                                  Language.checkBlance[model.language],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 4.5),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, 
                                  new MaterialPageRoute(
                                    builder: (BuildContext context){
                                      return new Unlock();
                                    }
                                  )
                                );
                              },
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
