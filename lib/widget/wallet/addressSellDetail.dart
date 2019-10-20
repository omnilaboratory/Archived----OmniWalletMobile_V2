import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';

class AddressSellDetail extends Dialog {
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
            bottom: 0,
            child: new Container(
              height: ScreenUtil().setHeight(712),
              width: ScreenUtil().setWidth(376),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(242, 244, 248, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  )),
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: ScreenUtil().setHeight(42),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(31.5),
                                left: ScreenUtil().setWidth(161),
                                right: ScreenUtil().setWidth(161),
                              ),
                              width: ScreenUtil().setWidth(54),
                              height: ScreenUtil().setHeight(5),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(70, 116, 182, 0.30),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            ],
                        ),
                      ),
                    ),
                    new Container(
                      width: ScreenUtil().setWidth(338),
                      margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(30),
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(28)
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(151, 151, 151, 1)
                          )
                        )
                      ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            width: 80,
                            child: new Text(
                              'STATUS',
                              textAlign: TextAlign.right,
                              style: UtilStyle.tagTitleFont
                            ),
                          ),
                          new Container(
                            height: 28,
                            margin: EdgeInsets.only(
                              top: 28
                            ),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  height: 28,
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 80,
                                        child: new Text(
                                          '25/AUG',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellDate,
                                        ),
                                      ),
                                      new Container(
                                        width: 80,
                                        margin: EdgeInsets.only(
                                          top: 4
                                        ),
                                        child: new Text(
                                          '10:10AM',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color.fromRGBO(54, 220, 158, 1)
                                          ),
                                          borderRadius: BorderRadius.circular(24)
                                        ),
                                      child: new Center(
                                        child: new Container(
                                          width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(54, 220, 158, 1),
                                          borderRadius: BorderRadius.circular(18)
                                        ),
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  child: Center(
                                    child: new Text(
                                    'SALE POSTED',
                                    style: UtilStyle.sellStatus,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            height: 60,
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Container(
                                        width: 80,
                                        child: new Text(
                                          '25/AUG',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellDate,
                                        ),
                                      ),
                                      new Container(
                                        width: 80,
                                        margin: EdgeInsets.only(
                                          top: 4
                                        ),
                                        child: new Text(
                                          '10:10AM',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 1.5,
                                        height: 36,
                                        color: Color.fromRGBO(54, 220, 158, 1),
                                      ),
                                      new Container(
                                        width: 24,
                                        height:  24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color.fromRGBO(54, 220, 158, 1)
                                          ),
                                          borderRadius: BorderRadius.circular(24)
                                        ),
                                      child: new Center(
                                        child: new Container(
                                          width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(54, 220, 158, 1),
                                          borderRadius: BorderRadius.circular(18)
                                        ),
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  child: Center( child: new Text(
                                    'BUYER RESERVED',
                                    style: UtilStyle.sellStatus,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            height: 60,
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Container(
                                        width: 80,
                                        child: new Text(
                                          '25/AUG',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellDate,
                                        ),
                                      ),
                                      new Container(
                                        width: 80,
                                        margin: EdgeInsets.only(
                                          top: 4
                                        ),
                                        child: new Text(
                                          '10:10AM',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 1.5,
                                        height: 36,
                                        color: Color.fromRGBO(54, 220, 158, 1),
                                      ),
                                      new Container(
                                        width:  24,
                                        height:  24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color.fromRGBO(54, 220, 158, 1)
                                          ),
                                          borderRadius: BorderRadius.circular(24)
                                        ),
                                      child: new Center(
                                        child: new Container(
                                          width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(54, 220, 158, 1),
                                          borderRadius: BorderRadius.circular(18)
                                        ),
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  child: Center( child: new Text(
                                    'PAYMENT IN TRANSIT',
                                    style: UtilStyle.sellStatus,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        new Container(
                            height: 60,
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Container(
                                        width: 80,
                                        child: new Text(
                                          '25/AUG',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellDate,
                                        ),
                                      ),
                                      new Container(
                                        width: 80,
                                        margin: EdgeInsets.only(
                                          top: 4
                                        ),
                                        child: new Text(
                                          '10:10AM',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 1.5,
                                        height: 36,
                                        color: Color.fromRGBO(54, 220, 158, 1),
                                      ),
                                      new Container(
                                        width:  24,
                                        height:  24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color.fromRGBO(54, 220, 158, 1)
                                          ),
                                          borderRadius: BorderRadius.circular(24)
                                        ),
                                      child: new Center(
                                        child: new Container(
                                          width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(54, 220, 158, 1),
                                          borderRadius: BorderRadius.circular(18)
                                        ),
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  child: Center( child: new Text(
                                    'PAYMENT COMPLETED',
                                    style: UtilStyle.sellStatus,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        new Container(
                            height: 60,
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Container(
                                        width: 80,
                                        child: new Text(
                                          '25/AUG',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellDate,
                                        ),
                                      ),
                                      new Container(
                                        width: 80,
                                        margin: EdgeInsets.only(
                                          top: 4
                                        ),
                                        child: new Text(
                                          '10:10AM',
                                          textAlign: TextAlign.right,
                                          style: UtilStyle.sellTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        width: 1.5,
                                        height: 36,
                                        color: Color.fromRGBO(54, 220, 158, 1),
                                      ),
                                      new Container(
                                        width:  24,
                                        height:  24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color.fromRGBO(54, 220, 158, 1)
                                          ),
                                          borderRadius: BorderRadius.circular(24)
                                        ),
                                      child: new Center(
                                        child: new Container(
                                          width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(54, 220, 158, 1),
                                          borderRadius: BorderRadius.circular(18)
                                        ),
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  height: 24,
                                  child: Center( child: new Text(
                                    'SALE FINALIZED',
                                    style: UtilStyle.sellStatus,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        
                        ],
                      ),
                    )
                    ,
                    new Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(28),
                        left: ScreenUtil().setWidth(19),
                        right: ScreenUtil().setWidth(19),
                        ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'FROM ADDRESS',
                              textAlign: TextAlign.left,
                              style:UtilStyle.tagTitleFont
                            ),
                          ),
                          new Container(
                            height: 19,
                            margin: EdgeInsets.only(
                              top: 24
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      borderRadius: BorderRadius.circular(3)),
                                  width: 27,
                                  height: 19,
                                  child: new Center(
                                    child: new Text('ID',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: 'GothamRnd',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing:2.89)),
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(6)
                                  ),
                                  child: new Text(
                                    '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                                    style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'GothamRnd',
                                          fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                                          height: 24,
                                          margin: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(8)),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('.43215',
                                                    style: new TextStyle(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 20)),
                                              ),
                                              new Container(
                                                height:
                                                    24,
                                                width:
                                                    ScreenUtil().setHeight(38),
                                                margin: EdgeInsets.only(
                                                    left: ScreenUtil()
                                                        .setWidth(6)),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: new Center(
                                                  child: new Text('BTC',
                                                      style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                          fontFamily:
                                                              'GothamRnd',
                                                          fontSize: 10,
                                                          height: 1.6)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        new Container(
                                          height: 24,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('.43215',
                                                    style: new TextStyle(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 20,)),
                                              ),
                                              new Container(
                                                height:
                                                    24,
                                                width:
                                                    ScreenUtil().setHeight(38),
                                                margin: EdgeInsets.only(
                                                    left: ScreenUtil()
                                                        .setWidth(6)),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: new Center(
                                                  child: new Text('BTC',
                                                      style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                          fontFamily:
                                                              'GothamRnd',
                                                          fontSize: 10,
                                                          height: 1.6)),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
