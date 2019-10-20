import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressFullMenu extends Dialog {
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
            top: ScreenUtil().setHeight(230),
            right: ScreenUtil().setWidth(20),
            child: new Container(
              // padding: EdgeInsets.only(top: ScreenUtil().setHeight(30),bottom: ScreenUtil().setHeight(30),left: ScreenUtil().setWidth(24),right: ScreenUtil().setWidth(24) ),
              width: ScreenUtil().setWidth(232),
              height: ScreenUtil().setHeight(172),
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
                    width: ScreenUtil().setWidth(232),
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(74, 119, 183, 0.15)))),
                    height: ScreenUtil().setHeight(42),
                    child: new FlatButton(
                      padding: EdgeInsets.all(0),
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              child: new Container(
                            child: new Text(
                              'CREATE NEW ADDRESS',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'GothamRnd',
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                  height: ScreenUtil().setSp(2.5)),
                            ),
                          )),
                        ],
                      )),
                    ),
                  ),
                  new Container(
                    width: ScreenUtil().setWidth(232),
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(74, 119, 183, 0.15)))),
                    height: ScreenUtil().setHeight(42),
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/importAddress');
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              child: new Container(
                            child: new Text(
                              'IMPORT ADDRESS WITH PRIVATE KEY',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'GothamRnd',
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                  height: ScreenUtil().setSp(2.5)),
                            ),
                          )),
                        ],
                      )),
                    ),
                  ),
                  new Container(
                    width: ScreenUtil().setWidth(232),
                    height: ScreenUtil().setHeight(42),
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(74, 119, 183, 0.15)))),
                    child: new FlatButton(
                      padding: EdgeInsets.all(0),
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              child: new Container(
                            child: new Text(
                              'ADD WATCH ONLY ADDRESS',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'GothamRnd',
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                  height: ScreenUtil().setSp(2.5)),
                            ),
                          )),
                        ],
                      )),
                    ),
                  ),
                  new Container(
                    width: ScreenUtil().setWidth(232),
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                    height: ScreenUtil().setHeight(42),
                    child: new FlatButton(
                      padding: EdgeInsets.all(0),
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              child: new Center(
                            child: new Text(
                              'ADD MEMORY OFFLINE ADDRESS',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'GothamRnd',
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                  height: ScreenUtil().setSp(2.5)),
                            ),
                          )),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
