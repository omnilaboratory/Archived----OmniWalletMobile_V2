import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletMenu extends Dialog {
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
            top: ScreenUtil().setHeight(130),
            right: ScreenUtil().setWidth(55),
            child: new Container(
              // padding: EdgeInsets.only(top: ScreenUtil().setHeight(30),bottom: ScreenUtil().setHeight(30),left: ScreenUtil().setWidth(24),right: ScreenUtil().setWidth(24) ),
              width: ScreenUtil().setWidth(85),
              height: ScreenUtil().setHeight(90),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtil().setHeight(12)),
                    bottomLeft: Radius.circular(ScreenUtil().setHeight(12)),
                    topRight: Radius.circular(ScreenUtil().setHeight(12)),
                    bottomRight: Radius.circular(ScreenUtil().setHeight(12)),
                  ),
                  color: Colors.white),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    width: ScreenUtil().setWidth(85),
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(74, 119, 183, 0.15)))),
                    height: ScreenUtil().setHeight(44),
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/walletBackup');
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                        width: ScreenUtil().setWidth(85),
                        child: new Text(
                          'BACKUP',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GothamRnd',
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(17, 27, 41, 1),
                              height: ScreenUtil().setSp(1)),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    width: ScreenUtil().setWidth(85),
                    height: ScreenUtil().setHeight(44),
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/walletImport');
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                        width: ScreenUtil().setWidth(85),
                        child: new Text(
                          'IMPORT',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GothamRnd',
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(17, 27, 41, 1),
                              height: ScreenUtil().setSp(1)),
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
    );
  }
}
