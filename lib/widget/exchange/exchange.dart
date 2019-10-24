import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/exchange/marketBuy.dart';
import 'package:omni/widget/exchange/offerPop.dart';
import 'package:omni/widget/menu/footMenu.dart';

import 'newMarket.dart';

class Exchange extends StatefulWidget {
  _ExchangeState createState() => new _ExchangeState();
}

class _ExchangeState extends State<Exchange> with TickerProviderStateMixin {
  Animation<double> marketAnimation;
  AnimationController marketController;

  Animation<double> tradeAnimation;
  AnimationController tradeController;

  Animation<double> offerAnimation;
  AnimationController offerController;

  double tradeHeight = 465;
  double offerHeight = 250;
  double tradeTableHeight = 290;
  double offerTableHeight = 140;
  bool tradeTableIsShow = true;
  bool offerTableIsShow = true;

  String tradeDataType = 'ALL';
  String offerDataType = 'ALL';
  List<Map<String, Object>> tradeData = [];
  List<Map<String, Object>> offerData = [];
  List<Map<String, Object>> marketData = [];

  String nowShow = '';
  // get data about market
  void _getMarketData() {
    marketData = [
      {'id': '#3', 'name': 'MAIDSAFECOIN', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#31', 'name': 'btc', 'price': '0.09', 'supply': '9.01917857'},
      {'id': '#97', 'name': 'abc', 'price': '0.09', 'supply': '35930.9152'},
      {'id': '#322', 'name': 'usd', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#33', 'name': 'usdt', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#3', 'name': 'MAIDSAFECOIN', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#31', 'name': 'btc', 'price': '0.09', 'supply': '9.01917857'},
      {'id': '#97', 'name': 'abc', 'price': '0.09', 'supply': '35930.9152'},
      {'id': '#322', 'name': 'usd', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#33', 'name': 'usdt', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#3', 'name': 'MAIDSAFECOIN', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#31', 'name': 'btc', 'price': '0.09', 'supply': '9.01917857'},
      {'id': '#97', 'name': 'abc', 'price': '0.09', 'supply': '35930.9152'},
      {'id': '#322', 'name': 'usd', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#33', 'name': 'usdt', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#3', 'name': 'MAIDSAFECOIN', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#31', 'name': 'btc', 'price': '0.09', 'supply': '9.01917857'},
      {'id': '#97', 'name': 'abc', 'price': '0.09', 'supply': '35930.9152'},
      {'id': '#322', 'name': 'usd', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#33', 'name': 'usdt', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#3', 'name': 'MAIDSAFECOIN', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#31', 'name': 'btc', 'price': '0.09', 'supply': '9.01917857'},
      {'id': '#97', 'name': 'abc', 'price': '0.09', 'supply': '35930.9152'},
      {'id': '#322', 'name': 'usd', 'price': '0.09', 'supply': '1735.0'},
      {'id': '#33', 'name': 'usdt', 'price': '0.09', 'supply': '1735.0'},
    ];
  }

  // get data about trade
  void _getTradeData() {
    tradeData = [
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'fees': '0.09', 'blocks': '100'},
      {'id': '#31', 'price': 'btc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#97', 'price': 'abc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#322', 'price': 'usd', 'fees': '0.09', 'blocks': '100'},
      {'id': '#33', 'price': 'usdt', 'fees': '0.09', 'blocks': '100'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'fees': '0.09', 'blocks': '100'},
      {'id': '#31', 'price': 'btc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#97', 'price': 'abc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#322', 'price': 'usd', 'fees': '0.09', 'blocks': '100'},
      {'id': '#33', 'price': 'usdt', 'fees': '0.09', 'blocks': '100'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'fees': '0.09', 'blocks': '100'},
      {'id': '#31', 'price': 'btc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#97', 'price': 'abc', 'fees': '0.09', 'blocks': '100'},
      {'id': '#322', 'price': 'usd', 'fees': '0.09', 'blocks': '100'},
      {'id': '#33', 'price': 'usdt', 'fees': '0.09', 'blocks': '11'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'fees': '0.09', 'blocks': '560'},
      {'id': '#31', 'price': 'btc', 'fees': '0.09', 'blocks': '90'},
      {'id': '#97', 'price': 'abc', 'fees': '0.09', 'blocks': '25'},
      {'id': '#322', 'price': 'usd', 'fees': '0.09', 'blocks': '57'},
      {'id': '#33', 'price': 'usdt', 'fees': '0.09', 'blocks': '54'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'fees': '0.09', 'blocks': '7'},
      {'id': '#31', 'price': 'btc', 'fees': '0.09', 'blocks': '145'},
      {'id': '#97', 'price': 'abc', 'fees': '0.09', 'blocks': '55'},
      {'id': '#322', 'price': 'usd', 'fees': '0.09', 'blocks': '20'},
      {'id': '#33', 'price': 'usdt', 'fees': '0.09', 'blocks': '7'},
    ];
  }

// get data about offer
  void _getOfferData() {
    offerData = [
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'amount': '0.09', 'total': '100'},
      {'id': '#31', 'price': 'btc', 'amount': '0.09', 'total': '100'},
      {'id': '#97', 'price': 'abc', 'amount': '0.09', 'total': '100'},
      {'id': '#322', 'price': 'usd', 'amount': '0.09', 'total': '100'},
      {'id': '#33', 'price': 'usdt', 'amount': '0.09', 'total': '100'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'amount': '0.09', 'total': '100'},
      {'id': '#31', 'price': 'btc', 'amount': '0.09', 'total': '100'},
      {'id': '#97', 'price': 'abc', 'amount': '0.09', 'total': '100'},
      {'id': '#322', 'price': 'usd', 'amount': '0.09', 'total': '100'},
      {'id': '#33', 'price': 'usdt', 'amount': '0.09', 'total': '100'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'amount': '0.09', 'total': '100'},
      {'id': '#31', 'price': 'btc', 'amount': '0.09', 'total': '100'},
      {'id': '#97', 'price': 'abc', 'amount': '0.09', 'total': '100'},
      {'id': '#322', 'price': 'usd', 'amount': '0.09', 'total': '100'},
      {'id': '#33', 'price': 'usdt', 'amount': '0.09', 'total': '11'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'amount': '0.09', 'total': '560'},
      {'id': '#31', 'price': 'btc', 'amount': '0.09', 'total': '90'},
      {'id': '#97', 'price': 'abc', 'amount': '0.09', 'total': '25'},
      {'id': '#322', 'price': 'usd', 'amount': '0.09', 'total': '57'},
      {'id': '#33', 'price': 'usdt', 'amount': '0.09', 'total': '54'},
      {'id': '#3', 'price': 'MAIDSAFECOIN', 'amount': '0.09', 'total': '7'},
      {'id': '#31', 'price': 'btc', 'amount': '0.09', 'total': '145'},
      {'id': '#97', 'price': 'abc', 'amount': '0.09', 'total': '55'},
      {'id': '#322', 'price': 'usd', 'amount': '0.09', 'total': '20'},
      {'id': '#33', 'price': 'usdt', 'amount': '0.09', 'total': '7'},
    ];
  }

  @override
  void initState() {
    super.initState();
    marketController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    marketAnimation = new Tween(begin: 0.1, end: 1.0).animate(marketController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    marketController.forward();
    tradeController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    tradeAnimation = new Tween(begin: 0.1, end: 1.0).animate(tradeController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    tradeController.forward();
    offerController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    offerAnimation = new Tween(begin: 0.1, end: 1.0).animate(offerController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    offerController.forward();
    setState(() {});
    Future.delayed(Duration(milliseconds: 10), () {
      this._getMarketData();
      this._getTradeData();
      this._getOfferData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    marketController.dispose();
    tradeController.dispose();
    offerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return Scaffold(
          floatingActionButton: new Container(
            width: ScreenUtil().setSp(45),
            height: ScreenUtil().setSp(45),
            child: new FlatButton(
              onPressed: () {
                showDialog<Null>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new FootMenu();
                    });
              },
              padding: EdgeInsets.all(0),
              child: new Container(
                child: new Image.asset('images/logo.png'),
              ),
            ),
          ),
          appBar: MyBaseBar(
            child: AfterLoginAppBar(),
          ),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.02),
            height: ScreenUtil().setHeight(762),
            width: ScreenUtil().setWidth(376),
            child: new Container(
              child: new Stack(
                children: <Widget>[
                  Positioned(
                    bottom: (marketController.value - 1) *
                        ScreenUtil().setHeight(702),
                    child: new Container(
                      width: ScreenUtil().setWidth(376),
                      height: ScreenUtil().setHeight(702),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.10),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Container(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(19)),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(18),
                                right: ScreenUtil().setWidth(18),
                              ),
                              child: new FlatButton(
                                onPressed: () {
                                  tradeHeight = 134;
                                  offerHeight = 68;
                                  tradeTableIsShow = false;
                                  offerTableIsShow = false;
                                  nowShow = 'MARKET';
                                  setState(() {});
                                },
                                padding: EdgeInsets.all(0),
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                        child: new Text(
                                          'MARKETS',
                                          style: nowShow == 'MARKET'
                                              ? UtilStyle.tagTitleFontActive
                                              : UtilStyle.tagTitleFont,
                                        ),
                                      ),
                                      new Container(
                                        child: new FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            Navigator.push(context,
                                                new MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return new NewMarket();
                                            }));
                                          },
                                          child: new Container(
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  width:
                                                      ScreenUtil().setWidth(24),
                                                  height:
                                                      ScreenUtil().setWidth(24),
                                                  child: new Image(
                                                    width: 14,
                                                    height: 14,
                                                    image: AssetImage(
                                                        'images/add.png'),
                                                  ),
                                                ),
                                                new Container(
                                                  margin: EdgeInsets.only(
                                                      left: ScreenUtil()
                                                          .setHeight(4)),
                                                  child: new Text(
                                                    'START NEW MARKET',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: ScreenUtil()
                                                          .setSp(10),
                                                      color: Color.fromRGBO(
                                                          74, 119, 183, 1),
                                                      letterSpacing:
                                                          ScreenUtil()
                                                              .setHeight(0.3),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(18),
                                right: ScreenUtil().setWidth(18),
                              ),
                              child: MarketTable(marketData),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: (tradeController.value - 1) * tradeHeight,
                    child: new Container(
                      padding: EdgeInsets.only(top: 19),
                      width: ScreenUtil().setWidth(376),
                      height: tradeHeight,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.10),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                            child: new FlatButton(
                              onPressed: () {
                                tradeHeight = ScreenUtil().setHeight(630);
                                offerHeight = 68;
                                tradeTableHeight = ScreenUtil().setHeight(510);
                                tradeTableIsShow = true;
                                offerTableIsShow = false;
                                nowShow = 'TRADE';
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      height: 36,
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(right: 6),
                                            child: new Text(
                                              'TRADE',
                                              style: nowShow == 'TRADE'
                                                  ? UtilStyle.tagTitleFontActive
                                                  : UtilStyle.tagTitleFont,
                                            ),
                                          ),
                                          new Container(
                                            height: 24,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    50, 231, 163, 0.12),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            width: ScreenUtil().setWidth(124),
                                            child: new Text(
                                              '47 ACTIVE OFFERS',
                                              textAlign: TextAlign.center,
                                              style: new TextStyle(
                                                  fontSize: 10,
                                                  // fontFamily: 'GothamRnd',
                                                  color: Color.fromRGBO(
                                                      50, 231, 163, 1),
                                                  height: 2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      child: new PopupMenuButton(
                                        shape: new BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        padding: EdgeInsets.all(0),
                                        offset: Offset(20, 20),
                                        onSelected: (val) {
                                          tradeDataType =
                                              val.toString().toUpperCase();
                                          setState(() {});
                                        },
                                        child: new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                height: 24,
                                                child: new Image(
                                                  width: 14,
                                                  height: 14,
                                                  image: AssetImage(
                                                      'images/down.png'),
                                                ),
                                              ),
                                              new Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                child: new Text(
                                                  '$tradeDataType',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    // fontFamily: 'GothamRnd',
                                                    fontSize:
                                                        ScreenUtil().setSp(10),
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    letterSpacing: ScreenUtil()
                                                        .setHeight(2.9),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          new PopupMenuItem(
                                            value: 'all',
                                            child: new Text(
                                              "ALL",
                                              style: TextStyle(
                                                fontSize: 10,
                                                // fontFamily: 'GothamRnd',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    17, 27, 41, 1),
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          new PopupMenuItem(
                                              value: 'sell',
                                              child: new Text(
                                                "SELL",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  // fontFamily: 'GothamRnd',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      17, 27, 41, 1),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                            child: new TradeTable(
                              data: tradeData,
                              isShow: tradeTableIsShow,
                              tableHeight: tradeTableHeight,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: (offerController.value - 1) * offerHeight,
                    child: new Container(
                      padding: EdgeInsets.only(top: 18),
                      width: ScreenUtil().setWidth(376),
                      height: offerHeight,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.10),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                            child: new FlatButton(
                              onPressed: () {
                                tradeHeight = ScreenUtil().setHeight(630);
                                offerHeight = ScreenUtil().setHeight(560);
                                offerTableHeight = ScreenUtil().setHeight(450);
                                tradeTableIsShow = true;
                                offerTableIsShow = true;
                                nowShow = 'OFFER';
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      height: 36,
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(right: 6),
                                            child: new Text(
                                              'MY OFFERS',
                                              style: nowShow == 'OFFER'
                                                  ? UtilStyle.tagTitleFontActive
                                                  : UtilStyle.tagTitleFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      child: new PopupMenuButton(
                                        shape: new BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        padding: EdgeInsets.all(0),
                                        offset: Offset(20, 20),
                                        onSelected: (val) {
                                          offerDataType =
                                              val.toString().toUpperCase();
                                          setState(() {});
                                        },
                                        child: new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                height: 24,
                                                child: new Image(
                                                  width: 14,
                                                  height: 14,
                                                  image: AssetImage(
                                                      'images/down.png'),
                                                ),
                                              ),
                                              new Container(
                                                margin: EdgeInsets.only(
                                                    left: ScreenUtil()
                                                        .setHeight(4)),
                                                child: new Text(
                                                  '$offerDataType',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    // fontFamily: 'GothamRnd',
                                                    fontSize:
                                                        ScreenUtil().setSp(10),
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    letterSpacing: ScreenUtil()
                                                        .setHeight(2.9),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          new PopupMenuItem(
                                            value: 'all',
                                            child: new Text(
                                              "ALL",
                                              style: TextStyle(
                                                fontSize: 10,
                                                // fontFamily: 'GothamRnd',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    17, 27, 41, 1),
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          new PopupMenuItem(
                                              value: 'sell',
                                              child: new Text(
                                                "SELL",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  // fontFamily: 'GothamRnd',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      17, 27, 41, 1),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                            child: new OfferTable(
                                data: offerData,
                                isShow: offerTableIsShow,
                                tableHeight: offerTableHeight),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MarketTable extends StatelessWidget {
  final List data;
  MarketTable(this.data);

  Widget buildContent() {
    Widget content;
    List<Widget> listUI = [];
    Widget tableHead = new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(56),
            child: new Text(
              'ID',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(120),
            child: new Text(
              'NAME',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(68),
            child: new Text(
              'PRICE',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(88),
            child: new Text(
              'SUPPLY',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    // listUI.add(tableHead);
    for (var i = 0; i < data.length; i++) {
      listUI.add(MarketTableRow(
          id: data[i]['id'],
          name: data[i]['name'],
          price: data[i]['price'],
          supply: data[i]['supply']));
    }
    content = new Container(
      child: new Column(
        children: <Widget>[
          tableHead,
          new Container(
            padding: EdgeInsets.only(bottom: 20),
            height: ScreenUtil().setHeight(484),
            child: new SingleChildScrollView(
                child: new Container(
              child: new Column(
                children: listUI,
              ),
            )),
          )
        ],
      ),
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildContent(),
    );
  }
}

class MarketTableRow extends StatefulWidget {
  final String id;
  final String name;
  final String price;
  final String supply;
  MarketTableRow({Key key, this.id, this.name, this.price, this.supply})
      : super(key: key);
  _MarketTableRowState createState() => new _MarketTableRowState();
}

class _MarketTableRowState extends State<MarketTableRow> {
  String id;
  String name;
  String price;
  String supply;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    name = widget.name;
    price = widget.price;
    supply = widget.supply;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FlatButton(
        onPressed: () {
          Map<String, Object> item = {
            'id': id,
            'name': name,
            'price': price,
            'supply': supply,
          };
          Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) {
            return new MarketBuy(item: item);
          }));
        },
        padding: EdgeInsets.all(0),
        child: new Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: new Row(
            children: <Widget>[
              new Container(
                width: ScreenUtil().setWidth(56),
                child: new Text(
                  id,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(120),
                child: new Text(
                  name,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(68),
                child: new Text(
                  price,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(88),
                child: new Text(
                  supply,
                  style: UtilStyle.tableContentFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TradeTable extends StatelessWidget {
  final List data;
  final bool isShow;
  final double tableHeight;
  TradeTable({this.data, this.isShow, this.tableHeight});
  Widget buildContent() {
    Widget content;
    List<Widget> listUI = [];
    Widget tableHead = new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(114),
            child: new Text(
              'ID',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(119),
            child: new Text(
              'PRICE(BTC/OMN)',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(68),
            child: new Text(
              'FEES',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(39),
            child: new Text(
              'BLOCKS',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    // listUI.add(tableHead);
    for (var i = 0; i < data.length; i++) {
      listUI.add(TradeTableRow(
          id: data[i]['id'],
          fees: data[i]['fees'],
          price: data[i]['price'],
          blocks: data[i]['blocks']));
    }
    content = new Container(
      child: new Column(
        children: <Widget>[
          tableHead,
          new Container(
            padding: EdgeInsets.only(bottom: 20),
            height: tableHeight,
            child: new SingleChildScrollView(
                child: new Container(
              child: new Column(
                children: listUI,
              ),
            )),
          )
        ],
      ),
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return isShow
        ? new Container(
            child: buildContent(),
          )
        : new Container();
  }
}

class TradeTableRow extends StatefulWidget {
  TradeTableRow({Key key, this.id, this.price, this.fees, this.blocks})
      : super(key: key);
  final String id;
  final String price;
  final String fees;
  final String blocks;
  _TradeTableRowState createState() => new _TradeTableRowState();
}

class _TradeTableRowState extends State<TradeTableRow> {
  String id;
  String price;
  String fees;
  String blocks;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    price = widget.price;
    fees = widget.fees;
    blocks = widget.blocks;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(114),
            child: new Text(
              id,
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(119),
            child: new Text(
              price,
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(68),
            child: new Text(
              fees,
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(39),
            child: new Text(
              blocks,
              style: UtilStyle.tableContentFont,
            ),
          ),
        ],
      ),
    );
  }
}

class OfferTable extends StatelessWidget {
  final List data;
  final bool isShow;
  final double tableHeight;
  OfferTable({this.data, this.isShow, this.tableHeight});
  Widget buildContent() {
    Widget content;
    List<Widget> listUI = [];
    Widget tableHead = new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(114),
            child: new Text(
              'ID',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(119),
            child: new Text(
              'CION PRICE',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(68),
            child: new Text(
              'AMOUNT',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(39),
            child: new Text(
              'TOTAL',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    for (var i = 0; i < data.length; i++) {
      listUI.add(OfferTableRow(
          id: data[i]['id'],
          amount: data[i]['amount'],
          price: data[i]['price'],
          total: data[i]['total']));
    }
    content = new Container(
      child: new Column(
        children: <Widget>[
          tableHead,
          new Container(
            padding: EdgeInsets.only(bottom: 20),
            height: tableHeight,
            child: new SingleChildScrollView(
                child: new Container(
              child: new Column(
                children: listUI,
              ),
            )),
          )
        ],
      ),
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return isShow
        ? new Container(
            child: buildContent(),
          )
        : new Container();
  }
}

class OfferTableRow extends StatefulWidget {
  OfferTableRow({Key key, this.id, this.price, this.amount, this.total})
      : super(key: key);
  final String id;
  final String price;
  final String amount;
  final String total;
  _OfferTableRowState createState() => new _OfferTableRowState();
}

class _OfferTableRowState extends State<OfferTableRow> {
  String id;
  String price;
  String amount;
  String total;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    price = widget.price;
    amount = widget.amount;
    total = widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Map<String, Object> item = {
            'id': id,
            'amount': amount,
            'price': price,
            'total': total,
          };
          Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) {
            return new OfferPop(item: item);
          }));
        },
        child: new Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: new Row(
            children: <Widget>[
              new Container(
                width: ScreenUtil().setWidth(114),
                child: new Text(
                  id,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(119),
                child: new Text(
                  price,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(68),
                child: new Text(
                  amount,
                  style: UtilStyle.tableContentFont,
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(39),
                child: new Text(
                  total,
                  style: UtilStyle.tableContentFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
