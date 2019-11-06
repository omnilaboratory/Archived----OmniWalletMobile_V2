import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/login/login.dart';
import 'package:omni/widget/view_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:omni/language/language.dart';

import 'create.dart';

class LoginAndCreate extends StatefulWidget {
  @override
  _LoginAndCreateState createState() => new _LoginAndCreateState();
}

class _LoginAndCreateState extends State<LoginAndCreate> {
  bool showPinBorder = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          body: new Container(
            color: Color.fromRGBO(242, 244, 248, 1),
            child: Stack(
              children: <Widget>[
                new Positioned(
                  child: new BeforLoginHead(isHome: false,),
                ),
                new Positioned(
                  bottom: 0,
                  child: new Container(
                    height: ScreenUtil().setHeight(682),
                    width: ScreenUtil().setWidth(376),
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(242, 244, 248, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                        topRight: Radius.circular(ScreenUtil().setHeight(44)),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(70, 116, 182, 0.10),
                            offset: Offset(0,-24),
                            blurRadius: 48.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    child: new Container(
                      padding: EdgeInsets.only(top: 20),
                      height: ScreenUtil().setHeight(48),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            width: ScreenUtil().setWidth(186),
                            height: ScreenUtil().setHeight(48),
                            child: new FlatButton(
                              splashColor: Color(0x00ffffff),
                              highlightColor: Color(0x00ffffff),
                              onPressed: () {
                                model.changeLoginType('login');
                              },
                              child: new Text(Language.login[model.language],
                                  textAlign: TextAlign.center,
                                  style: model.loginType == 'login'
                                      ? UtilStyle.tagTitleFontActive
                                      : UtilStyle.tagTitleFont),
                            ),
                          ),
                          new Container(
                            width: ScreenUtil().setWidth(2),
                            height: ScreenUtil().setHeight(48),
                            color: Color.fromRGBO(97, 97, 97, 0.2),
                          ),
                          new Container(
                            width: ScreenUtil().setWidth(186),
                            height: ScreenUtil().setHeight(48),
                            child: new FlatButton(
                                splashColor: Color(0x00ffffff),
                                highlightColor: Color(0x00ffffff),
                                onPressed: () {
                                  model.changeLoginType('create');
                                },
                                child: new Text(Language.create[model.language],
                                    textAlign: TextAlign.center,
                                    style: model.loginType == 'create'
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new Positioned(
                  bottom: 0,
                  child: new Container(
                    height: ScreenUtil().setHeight(605),
                    width: ScreenUtil().setWidth(376),
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(242, 244, 248, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                        topRight: Radius.circular(ScreenUtil().setHeight(44)),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(70, 116, 182, 0.10),
                            offset: Offset(0,-24
                            ),
                            blurRadius: 48.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    child: new Container(
                      child: model.loginType == "login"
                          ? new Container(
                              child: new Login(),
                            )
                          : new Container(
                              child: new Create(),
                            ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        );
      },
    );
  }
}
