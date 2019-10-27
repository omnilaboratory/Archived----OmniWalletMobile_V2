import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';

class MFAEnable extends StatefulWidget {
  _MFAEnableState createState() => new _MFAEnableState();
}

class _MFAEnableState extends State<MFAEnable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          body: new Container(
            width: ScreenUtil().setWidth(376),
            height: ScreenUtil().setHeight(812),
            color: Color(0xfff2f4f8),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  top: ScreenUtil().setHeight(70),
                  child: new Container(
                    padding: EdgeInsets.only(
                        left: 18, right: 18, top: 30, bottom: 26),
                    width: ScreenUtil().setWidth(376),
                    height: ScreenUtil().setHeight(630),
                    decoration: BoxDecoration(
                        color: Color(0xfff2f4f8),
                        borderRadius: BorderRadius.circular(44),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.10),
                              offset: Offset(0, 24),
                              blurRadius: 48),
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.10),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'SETUP MULTIFACTOR AUTHENTICATION',
                              style: UtilStyle.tokenTitleFont,
                            ),
                          ),
                          new Container(
                              margin: EdgeInsets.only(top: 24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setHeight(12)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        color: Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  70, 116, 182, 0.10),
                                              offset: Offset(0, 0),
                                              blurRadius: 48)
                                        ]),
                                    height: ScreenUtil().setHeight(130),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          margin: EdgeInsets.only(right: 12),
                                          width: ScreenUtil().setHeight(105),
                                          height: ScreenUtil().setHeight(105),
                                          decoration: BoxDecoration(
                                              color: Colors.green),
                                        ),
                                        new Expanded(
                                          child: new Container(
                                            width: ScreenUtil().setWidth(198),
                                            child: new Text(
                                                'REQUIRE AN MFA DEVICE SCAN THE QR CODE OR MANUALLY ENTER THE SECRET LISTED BELOW INTO YOUR MFA DEVICE/SOFTWARE.',
                                                style:
                                                    UtilStyle.mfaContentStyle),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                        color: Color(0xfff2f4f8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  70, 116, 182, 0.10),
                                              offset: Offset(0, 0),
                                              blurRadius: 48)
                                        ]),
                                    height: ScreenUtil().setHeight(116),
                                    padding: EdgeInsets.only(
                                        top: 16, left: 12, right: 12),
                                    child: new Column(
                                      children: <Widget>[
                                        new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                child: new Text(
                                                  'YOUR MFA CODE',
                                                  style:
                                                      UtilStyle.mfaTitleStyle,
                                                ),
                                              ),
                                              Expanded(
                                                child: new Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            50, 231, 163, 0.25),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16)),
                                                    height: 32,
                                                    child: new Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: new Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 18),
                                                            child: new Text(
                                                                'EWBDOG3D5FPLT5L7',
                                                                style: UtilStyle
                                                                    .mfaContentStyle),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 53,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Color
                                                                      .fromRGBO(
                                                                          50,
                                                                          231,
                                                                          163,
                                                                          0.25),
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          16),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16))),
                                                          child: new FlatButton(
                                                            splashColor:
                                                                Color.fromRGBO(
                                                                    50,
                                                                    231,
                                                                    163,
                                                                    0.0),
                                                            highlightColor:
                                                                Color.fromRGBO(
                                                                    50,
                                                                    231,
                                                                    163,
                                                                    0.0),
                                                            shape: new RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            16),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16))),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            child:
                                                                new Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              16),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              16))),
                                                              child: new Center(
                                                                child:
                                                                    new Container(
                                                                  width: 24,
                                                                  child: new Image
                                                                          .asset(
                                                                      'images/copy.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        new Container(
                                          child: new Text(
                                            'STORE THIS SAFELY AND SECURELY BECAUSE ANYONE WITH THIS SECRET WILL BE ABLE TO DUPLICATE YOUR MFA AUTHORIZATION CODES.',
                                            style: UtilStyle.mfaContentStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      child: new Column(
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  child: new Text(
                                                    'PERSONAL SECURITY QUESTION',
                                                    style:UtilStyle.mfaTitleStyle
                                                  ),
                                                ),
                                                new Container(
                                                  width: 24,
                                                  child: new Image.asset('images/info.png'),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(0, 0, 0, 0.15)
                                                )
                                              )
                                            ),
                                            child: new TextField(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                                                border: InputBorder.none
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      child: new Column(
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  child: new Text(
                                                    'PERSONAL SECURITY QUESTION ANSWER',
                                                    style:UtilStyle.mfaTitleStyle
                                                  ),
                                                ),
                                                new Container(
                                                  width: 24,
                                                  child: new Image.asset('images/info.png'),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(0, 0, 0, 0.15)
                                                )
                                              )
                                            ),
                                            child: new TextField(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                                                border: InputBorder.none
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      child: new Column(
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  child: new Text(
                                                    'MFA CODE',
                                                    style:UtilStyle.mfaTitleStyle
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(0, 0, 0, 0.15)
                                                )
                                              )
                                            ),
                                            child: new TextField(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                                                border: InputBorder.none
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new FlatButton(
                              onPressed: (){},
                              splashColor: Color.fromRGBO(238, 241, 246, 0.1),
                              highlightColor:
                                  Color.fromRGBO(238, 241, 246, 0.1),
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      width: 24,
                                      child: Image.asset('images/cancel.png'),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: new Text(
                                        'CANCEL',
                                        style: UtilStyle.formSubmitFont,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            child: new FlatButton(
                              splashColor: Color.fromRGBO(238, 241, 246, 0.1),
                              highlightColor:
                                  Color.fromRGBO(238, 241, 246, 0.1),
                              onPressed: () {},
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      width: 24,
                                      child: Image.asset('images/upG.png'),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: new Text(
                                        'SETUP',
                                        style: UtilStyle.formSubmitFont,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
