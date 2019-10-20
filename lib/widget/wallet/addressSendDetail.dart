import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSendDetail extends Dialog {
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
              padding: EdgeInsets.only(
                bottom: 10
              ),
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
                      height: 84,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.30),
                                offset: Offset(0,-24
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(
                                top: 28,
                                bottom: 28,
                                left: ScreenUtil().setWidth(161),
                                right: ScreenUtil().setWidth(161),
                              ),
                              width: 54,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(70, 116, 182, 0.30),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            new Container(
                              width: ScreenUtil().setWidth(338),
                              margin: EdgeInsets.only(
                                  left: 18,
                                  right: 18),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Container(
                                    child: new Row(
                                      children: <Widget>[
                                        new Container(
                                          child: new Text(
                                            'STATUS:',
                                            style: new TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.5),
                                                fontFamily: 'GothamRnd',
                                                fontSize:12),
                                          ),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: 6),
                                          child: new Text(
                                            'SENT',
                                            style: new TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 231, 163, 1),
                                                fontFamily: 'GothamRnd',
                                                fontSize:
                                                    12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    child: new Image(
                                      width: 24,
                                      image:
                                          AssetImage('images/wallerInfo.png'),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        top: 25,
                        left: ScreenUtil().setWidth(19),
                        right: ScreenUtil().setWidth(19),
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Container(
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        child: new Text('AMOUNT IN USD',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.35),
                                                fontFamily: 'GothamRnd',
                                                fontSize:12)),
                                      ),
                                      new Container(
                                        margin: EdgeInsets.only(
                                            top: 8),
                                        height: 20,
                                        child: new Text('\$' + '200',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontFamily: 'GothamRnd',
                                                fontSize:12,
                                                height: 1.6)),
                                      )
                                    ],
                                  ),
                                ),
                                ),
                                new Expanded(
                                  child: new Container(
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('CURRENCY',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 20,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('.43215',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,
                                                        height: 1.6)),
                                              ),
                                              new Container(
                                                height:
                                                    20,
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
                                                  child: new Text('OMNI',
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
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(28)),
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'FROM ADDRESS',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.35),
                                  fontSize: 12,
                                  fontFamily: 'GothamRnd',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Container(
                            height: 19,
                            margin: EdgeInsets.only(
                              top: 8
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      borderRadius: BorderRadius.circular(3)),
                                  width: ScreenUtil().setHeight(27),
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
                                    left: 6
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
                            margin: EdgeInsets.only(
                                top: 28),
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'TO ADDRESS',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.35),
                                  fontSize: 12,
                                  fontFamily: 'GothamRnd',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Container(
                            height: 19,
                            margin: EdgeInsets.only(
                              top: 8
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
                                    left: 6
                                  ),
                                  child: new Text(
                                    '1PbtpQ2gsUZBhqLuPgHsJreVrNBVM',
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
                            margin: EdgeInsets.only(
                              top: 20
                            ),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('FEES',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 20,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('.43215',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,
                                                        height: 1.6)),
                                              ),
                                              new Container(
                                                height:20,
                                                width:38,
                                                margin: EdgeInsets.only(
                                                    left: 6),
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
                                                          fontSize: 12,
                                                          height: 1.6)),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          new Container(
                            margin: EdgeInsets.only(
                              top: 20
                            ),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('TRANSACTION TYPE',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 20,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('SIMPLE SEND',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,
                                                        height: 1.6)),
                                              ),
                                              ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          new Container(
                            margin: EdgeInsets.only(
                              top: 20
                            ),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('TRANSACTION DATE',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 20,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('8 / 25 / 2019',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,
                                                        height: 1.6)),
                                              ),
                                              ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          new Container(
                            margin: EdgeInsets.only(
                              top: 20
                            ),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('TRANSACTION TIME',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 20,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                child: new Text('1568194920000',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,
                                                        height: 1.6)),
                                              ),
                                              ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          new Container(
                            margin: EdgeInsets.only(
                              top: 20
                            ),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text('TRANSACTION HASH',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.35),
                                                  fontFamily: 'GothamRnd',
                                                  fontSize:12)),
                                        ),
                                        new Container(
                                          height: 28,
                                          margin: EdgeInsets.only(
                                              top: 8),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                width: ScreenUtil().setWidth(330),
                                                child: new Text('ef9a334db2806a0c14f2167a9153b1a121f1aa679224acf2c0dc4810d2380785',
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'GothamRnd',
                                                        fontSize: 12,)),
                                              ),
                                              ],
                                          ),
                                        )
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
          )
        ],
      ),
    );
  }
}
