import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:scoped_model/scoped_model.dart';

class WalletImport extends StatefulWidget {
  _WalletImportState createState() => new _WalletImportState();
}

class _WalletImportState extends State<WalletImport> {
  bool isChooseFile = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          appBar: MyBaseBar(
            child: AfterLoginAppBar(),
          ),
          body: Container(
            color: Color.fromRGBO(70, 116, 182, 0.07),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                  top: ScreenUtil().setHeight(231),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: ScreenUtil().setHeight(192),
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(18),
                      top: ScreenUtil().setHeight(28),
                      right: ScreenUtil().setWidth(18),
                      bottom: ScreenUtil().setHeight(32),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(82, 135, 210, 0.25),
                            offset: Offset(0,24
                            ),
                            blurRadius: 48.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text('IMPORT WALLET BACKUP',
                              textAlign: TextAlign.left,
                              style: UtilStyle.tagTitleFontActive),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                          child: new Text('UPLOAD BACKUP FILE',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontFamily: 'GothamRnd',
                                fontSize: ScreenUtil().setSp(10),
                                color: Color.fromRGBO(0, 0, 0, 0.35),
                              )),
                        ),
                        new Container(
                            margin:
                                EdgeInsets.only(top: ScreenUtil().setHeight(9)),
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(9),
                                bottom: ScreenUtil().setHeight(9)),
                            width: ScreenUtil().setWidth(339),
                            height: ScreenUtil().setHeight(65),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(74, 119, 183, 0.1),
                              borderRadius:
                                  BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.12),
                                    offset: Offset(0,8),
                                    blurRadius: 24,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: new Container(
                                child: new FlatButton(
                              onPressed: () {
                                isChooseFile = !isChooseFile;
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: isChooseFile
                                  ? new Row(
                                      children: <Widget>[
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: ScreenUtil().setWidth(8)),
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(17)),
                                          width: ScreenUtil().setWidth(118),
                                          height: ScreenUtil().setHeight(50),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(74, 119, 183, 1),
                                            borderRadius: BorderRadius.circular(
                                                ScreenUtil().setSp(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      74, 119, 183, 0.5),
                                                  offset: Offset(0,12),
                                                  blurRadius:24,
                                                  spreadRadius: 0.0),
                                            ],
                                          ),
                                          child: new Text('CHOOSE FILE',
                                              textAlign: TextAlign.center,
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                // fontFamily: 'GothamRnd',
                                                fontSize:12,
                                                color: Colors.white,
                                              )),
                                        ),
                                        new Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    ScreenUtil().setWidth(12)),
                                            child: new Text('NO FILE CHOOSEN',
                                                textAlign: TextAlign.center,
                                                style: new TextStyle(
                                                  // fontFamily: 'GothamRnd',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(10),
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                )))
                                      ],
                                    )
                                  : new Row(
                                      children: <Widget>[
                                        new Expanded(
                                          child: new Container(
                                            margin: EdgeInsets.only(
                                                left: ScreenUtil().setWidth(8)),
                                            child: new Text('CHOOSE FILE',
                                                textAlign: TextAlign.right,
                                                style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  // fontFamily: 'GothamRnd',
                                                  fontSize:10,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                )),
                                          ),
                                        ),
                                        new Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    ScreenUtil().setWidth(12)),
                                            width: ScreenUtil().setWidth(158),
                                            height: ScreenUtil().setHeight(50),
                                            padding: EdgeInsets.only(
                                                top:
                                                    ScreenUtil().setHeight(17)),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  74, 119, 183, 1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ScreenUtil().setSp(8)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        74, 119, 183, 0.5),
                                                    offset: Offset(0,12),
                                                    blurRadius:24,
                                                    spreadRadius: 0.0),
                                              ],
                                            ),
                                            child: new Text('NO FILE CHOOSEN',
                                                textAlign: TextAlign.center,
                                                style: new TextStyle(
                                                  // fontFamily: 'GothamRnd',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:12,
                                                  color: Colors.white,
                                                )))
                                      ],
                                    ),
                            ))),
                      ],
                    ),
                  ),
                ),
                new Positioned(
                  bottom: ScreenUtil().setHeight(198),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(52)),
                          child: new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            padding: EdgeInsets.all(0),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                    margin: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(12)),
                                    width: ScreenUtil().setWidth(24),
                                    child:
                                        new Image.asset('images/cancel.png')),
                                new Container(
                                    child: new Text(
                                  'CANCEL',
                                  textAlign: TextAlign.center,
                                  style: UtilStyle.formSubmitFont,
                                ))
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(right: ScreenUtil().setWidth(52)),
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                  margin: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(12)),
                                  width: 24,
                                  child: new Image.asset('images/upB.png')),
                              new Container(
                                  child: new Text(
                                'IMPORT WALLET',
                                textAlign: TextAlign.center,
                                style: UtilStyle.formSubmitFont,
                              ))
                            ],
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
