import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/login/login.dart';
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
    return new ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: MyBaseBar(
            child: LoginAppBar(isHome: false),
          ),
          body: new Container(
            color: Color.fromRGBO(242, 244, 248, 1),
            child: Stack(
              children: <Widget>[
                new Positioned(
                  bottom: 0,
                  child: new Container(
                    height: ScreenUtil().setHeight(637),
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
                            offset: Offset(
                              ScreenUtil().setSp(0),
                              ScreenUtil().setSp(0),
                            ),
                            blurRadius: 40.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    child: new Container(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
                      height: ScreenUtil().setHeight(48),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            width: ScreenUtil().setWidth(186),
                            height: ScreenUtil().setHeight(48),
                            child: new FlatButton(
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
                            color: Color.fromRGBO(151, 151, 151, 1),
                          ),
                          new Container(
                            width: ScreenUtil().setWidth(186),
                            height: ScreenUtil().setHeight(48),
                            child: new FlatButton(
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
                    height: ScreenUtil().setHeight(541),
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
                            offset: Offset(
                              ScreenUtil().setSp(0),
                              ScreenUtil().setSp(0),
                            ),
                            blurRadius: 40.0,
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
