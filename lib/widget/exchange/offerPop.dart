import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/view_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class OfferPop extends StatefulWidget {
  final Map<String, Object> item;
  OfferPop({Key key, this.item}) : super(key: key);
  _OfferPopState createState() => new _OfferPopState();
}

class _OfferPopState extends State<OfferPop> {
  Map<String, Object> item;
  TextEditingController acceptController = new TextEditingController();

  FocusNode acceptFocus = new FocusNode();

  var selectedAddress = '1YjsJhJH12918nmHkKUwjaAHj2341Aj';
  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Scaffold(
          body: new Container(
            height: ScreenUtil().setHeight(812),
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 116, 182, 0.1),
            ),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: new AfterLoginHead(),
                ),
                Positioned(
                  bottom: 0,
                  child: new Container(
                    height: ScreenUtil().setHeight(702),
                    child: new Column(
                        children: <Widget>[
                          new Container(
                            width: ScreenUtil().setWidth(376),
                            height: 356,
                            padding: EdgeInsets.only(
                              top: 32,
                              bottom: 32,
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18), 
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(242, 244, 248, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(70, 116, 182, 0.02),
                                      offset: Offset(0, -24),
                                      blurRadius: 48),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(44),
                                  topRight: Radius.circular(44),
                                )),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text(
                                    'ACCEPT OFFER',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontWeight: FontWeight.bold
                                        // fontFamily: 'GothamRnd',
                                        ),
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(top: 28),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              child: new Text('BUYING ADDRESS',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.5))),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(
                                                  top: ScreenUtil()
                                                      .setHeight(12),
                                                  bottom: ScreenUtil()
                                                      .setHeight(20)),
                                              padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(7)),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: ScreenUtil()
                                                              .setHeight(0.7),
                                                          color:
                                                              Colors.black))),
                                              child: PopupMenuButton(
                                                  onSelected: (val) {
                                                    selectedAddress = val;
                                                    setState(() {});
                                                  },
                                                  child: new Container(
                                                    child: new Row(
                                                      children: <Widget>[
                                                        new Expanded(
                                                          child: new Container(
                                                            child: new Text(
                                                              selectedAddress,
                                                              style: UtilStyle
                                                                  .formSelectFont,
                                                            ),
                                                          ),
                                                        ),
                                                        new Container(
                                                          width: ScreenUtil()
                                                              .setWidth(24),
                                                          child: new Image
                                                                  .asset(
                                                              'images/down.png'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  itemBuilder: (BuildContext
                                                          context) =>
                                                      <PopupMenuItem<String>>[
                                                        new PopupMenuItem(
                                                          value:
                                                              '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                                                          child: new Text(
                                                            "1YjsJhJH12918nmHkKUwjaAHj2341Aj",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          10),
                                                              // fontFamily: 'GothamRnd',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      17,
                                                                      27,
                                                                      41,
                                                                      1),
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                      ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      new Container(
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              child: new Text('SELLERS ADDRESS',
                                                  style: TextStyle(
                                                      // fontFamily: 'GothamRnd',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.5))),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(top: 12),
                                              child: new Text(
                                                '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                                                style: UtilStyle.formSelectFont,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      new Container(
                                        margin: EdgeInsets.only(top: 16),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              child: new Text('SALE OFFER ID',
                                                  style: TextStyle(
                                                      // fontFamily: 'GothamRnd',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.5))),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(top: 12),
                                              child: new Text(
                                                'b09fc81170ea65f823a675f6d3c6e87f1fc6aeb75898cd183c9952c1',
                                                style: UtilStyle.formSelectFont,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      new Container(
                                        margin: EdgeInsets.only(top: 16),
                                        child: new Row(
                                          children: <Widget>[
                                            new Expanded(
                                              child: new Container(
                                                child: new Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    new Container(
                                                      child: new Text(
                                                          'PRICE PER COIN',
                                                          style: TextStyle(
                                                              // fontFamily: 'GothamRnd',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5))),
                                                    ),
                                                    new Container(
                                                      margin: EdgeInsets.only(
                                                          top: 12),
                                                      child: new Text(
                                                        '0.00650718',
                                                        style: UtilStyle
                                                            .formSelectFont,
                                                      ),
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
                                                      child: new Text(
                                                          'SALE FEES',
                                                          style: TextStyle(
                                                              // fontFamily: 'GothamRnd',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5))),
                                                    ),
                                                    new Container(
                                                      margin: EdgeInsets.only(
                                                          top: 12),
                                                      child: new Text(
                                                        '0.0002',
                                                        style: UtilStyle
                                                            .formSelectFont,
                                                      ),
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
                                                      child: new Text(
                                                          'TIMEFRAME',
                                                          style: TextStyle(
                                                              // fontFamily: 'GothamRnd',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5))),
                                                    ),
                                                    new Container(
                                                      margin: EdgeInsets.only(
                                                          top: 12),
                                                      child: new Text(
                                                        '100 Blocks',
                                                        style: UtilStyle
                                                            .formSelectFont,
                                                      ),
                                                    )
                                                  ],
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
                          new Container(
                            padding: EdgeInsets.only(
                                top: 32, bottom: 16, left: 18, right: 18),
                            width: ScreenUtil().setWidth(376),
                            height: 188,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 231, 163, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(50, 231, 163, 0.5),
                                      offset: Offset(0, 24),
                                      blurRadius: 48),
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(44),
                                  bottomRight: Radius.circular(44),
                                )),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Container(
                                    child: new Text(
                                      'AMOUNT TO SELL (OMN)',
                                      style: UtilStyle.formKeyFont,
                                    ),
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(8)),
                                  height: 68,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                      borderRadius: BorderRadius.circular(8)),
                                  // padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(12), ScreenUtil().setWidth(15), ScreenUtil().setWidth(12), ScreenUtil().setWidth(15)),
                                  child: new TextField(
                                    keyboardType: TextInputType.number,
                                    controller: acceptController,
                                    focusNode: acceptFocus,
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontFamily: 'GothamRnd',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 41),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 15, 12, 12),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: '0.0',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            // fontFamily: 'GothamRnd',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 41)),
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(12),
                                  ),
                                  child: new Container(
                                    child: new Row(
                                      children: <Widget>[
                                        new Container(
                                          padding: EdgeInsets.only(
                                              right: ScreenUtil().setWidth(12)),
                                          child: new Text('0.00648945',
                                              style:
                                                  UtilStyle.formCacularFontB),
                                        ),
                                        new Container(
                                            width: 38,
                                            height: 24,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            alignment: Alignment.centerLeft,
                                            child: new Center(
                                              child: new Text('BTC',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      // fontFamily: 'GothamRnd',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: ScreenUtil()
                                                          .setHeight(10),
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                      letterSpacing:
                                                          ScreenUtil()
                                                              .setHeight(
                                                                  -0.43))),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            width: ScreenUtil().setWidth(376),
                            margin: EdgeInsets.only(top: 30, bottom: 30),
                            child: new Row( 
                              children: <Widget>[
                                new Expanded(
                                  child: new Center(
                                    child: new Container(
                                      child: new FlatButton(
                                        splashColor: Color(0x00ffffff),
                                        highlightColor: Color(0x00ffffff),
                                        onPressed: () {
                                          this._cancel();
                                        },
                                        padding: EdgeInsets.all(0),
                                        child: new Container(
                                          child: new Column(
                                            children: <Widget>[
                                              new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                margin: EdgeInsets.only(
                                                    bottom: ScreenUtil()
                                                        .setHeight(12)),
                                                child: new Image(
                                                  image: AssetImage(
                                                      'images/cancel.png'),
                                                ),
                                              ),
                                              new Container(
                                                child: new Text(
                                                  'CANCEL',
                                                  style:
                                                      UtilStyle.formSubmitFont,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                new Expanded(
                                  child: new Center(
                                    child: new Container(
                                      child: new FlatButton(
                                        splashColor: Color(0x00ffffff),
                                        highlightColor: Color(0x00ffffff),
                                        onPressed: () {
                                          // this._newMarket();
                                        },
                                        padding: EdgeInsets.all(0),
                                        child: new Container(
                                          child: new Column(
                                            children: <Widget>[
                                              new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                margin: EdgeInsets.only(
                                                    bottom: ScreenUtil()
                                                        .setHeight(12)),
                                                child: new Image.asset(
                                                    'images/up.png'),
                                              ),
                                              new Container(
                                                child: new Text(
                                                  'NEW MARKET',
                                                  style:
                                                      UtilStyle.formSubmitFont,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
        );
      },
    );
  }

  _cancel() {
    Navigator.pop(context);
  }
}
