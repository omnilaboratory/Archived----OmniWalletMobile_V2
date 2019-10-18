import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/exchange/newMarket.dart';
import 'package:omni/widget/menu/topMenu.dart';

class MarketBuy extends StatefulWidget {
  final Map<String, Object> item;
  MarketBuy({Key key, this.item}) : super(key: key);
  _MarketBuyState createState() => new _MarketBuyState();
}

class _MarketBuyState extends State<MarketBuy>
    with SingleTickerProviderStateMixin {
  Map<String, Object> item;
  List marketData = [];
  Animation<double> marketAnimation;
  AnimationController marketController;
  String showContent = 'BUY';
  String selectedAddress = '1YjsJhJH12918nmHkKUwjaAHj2341Aj';
  
  TextEditingController buyController = new TextEditingController();
  TextEditingController sellController = new TextEditingController();
  
  FocusNode buyFocus = new FocusNode();
  FocusNode sellFocus = new FocusNode();
  @override
  void initState() {
    super.initState();
    item = widget.item;
    marketData.add(item);
    marketController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    marketAnimation = new Tween(begin: 0.1, end: 1.0).animate(marketController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    marketController.forward();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          body: new Container(
            height: ScreenUtil().setHeight(812),
            width: ScreenUtil().setWidth(376),
            child: new Column(
              children: <Widget>[
                new Container(
                  color: Color.fromRGBO(70, 116, 182, 0.10),
                  height: ScreenUtil().setHeight(100),
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(18),
                      right: ScreenUtil().setWidth(18),
                      top: ScreenUtil().setHeight(50)),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        height: ScreenUtil().setHeight(24),
                        child: new Image(
                          image: AssetImage('images/headLogo.png'),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setHeight(32),
                        child: new FlatButton(
                          onPressed: () {
                            showDialog<Null>(
                                context: context, //BuildContext对象
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return new TopMenu();
                                });
                          },
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            height: ScreenUtil().setHeight(32),
                            child: new Image(
                              image: AssetImage('images/defaultAvatar.png'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  height: ScreenUtil().setHeight(712),
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
                                    color: Color.fromRGBO(70, 116, 182, 0.165),
                                    offset: Offset(
                                      ScreenUtil().setSp(0),
                                      ScreenUtil().setSp(-24),
                                    ),
                                    blurRadius: 48.0,
                                    spreadRadius: 2.0),
                              ]),
                          child: new Container(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(19)),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(18),
                                    right: ScreenUtil().setWidth(18),
                                  ),
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Container(
                                          child: new Text(
                                            'MARKETS',
                                            style: TextStyle(
                                              fontFamily: 'Helvetica',
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  74, 119, 183, 0.75),
                                              letterSpacing:
                                                  ScreenUtil().setHeight(3.5),
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          child: new FlatButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  new MaterialPageRoute(
                                                      builder: (BuildContext context) {
                                                return new NewMarket();
                                              }));
                                            },
                                            child: new Container(
                                              child: new Row(
                                                children: <Widget>[
                                                  new Container(
                                                    width: ScreenUtil()
                                                        .setWidth(24),
                                                    height: ScreenUtil()
                                                        .setWidth(24),
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
                                                        fontFamily: 'Helvetica',
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
                                new Container(
                                  padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(18),
                                    right: ScreenUtil().setWidth(18),
                                  ),
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        padding: EdgeInsets.only(
                                            top: 12, bottom: 12),
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
                                      ),
                                      new Container(
                                        padding: EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: new Row(
                                          children: <Widget>[
                                            new Container(
                                              width: ScreenUtil().setWidth(56),
                                              child: new Text(
                                                item['id'],
                                                style:
                                                    UtilStyle.tableContentFont,
                                              ),
                                            ),
                                            new Container(
                                              width: ScreenUtil().setWidth(120),
                                              child: new Text(
                                                item['name'],
                                                style:
                                                    UtilStyle.tableContentFont,
                                              ),
                                            ),
                                            new Container(
                                              width: ScreenUtil().setWidth(68),
                                              child: new Text(
                                                item['price'],
                                                style:
                                                    UtilStyle.tableContentFont,
                                              ),
                                            ),
                                            new Container(
                                              width: ScreenUtil().setWidth(88),
                                              child: new Text(
                                                item['supply'],
                                                style:
                                                    UtilStyle.tableContentFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(556),
                                  width: ScreenUtil().setWidth(376),
                                  color: Colors.white,
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        height: ScreenUtil().setHeight(46),
                                        child: new Row(
                                          children: <Widget>[
                                            new Expanded(
                                              child: Container(
                                                  height: ScreenUtil()
                                                      .setHeight(46),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              width: 2,
                                                              color: showContent ==
                                                                      'BUY'
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          50,
                                                                          231,
                                                                          163,
                                                                          1)
                                                                  : Colors
                                                                      .white))),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      showContent = 'BUY';
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'BUY',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: showContent ==
                                                              'BUY'
                                                          ? UtilStyle
                                                              .tabSelectedFont
                                                          : UtilStyle
                                                              .tabUnselectedFont,
                                                    ),
                                                  )),
                                            ),
                                            new Expanded(
                                              child: Container(
                                                  height: ScreenUtil()
                                                      .setHeight(46),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              width: 2,
                                                              color: showContent ==
                                                                      'SELL'
                                                                  ?  Color.fromRGBO(82, 135, 210, 1)
                                                                  : Colors
                                                                      .white))),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      showContent = 'SELL';
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'SELL',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: showContent ==
                                                              'SELL'
                                                          ? UtilStyle
                                                              .tabSelectedFont
                                                          : UtilStyle
                                                              .tabUnselectedFont,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      new Container(
                                        child: showContent=='BUY'? buildBuy():buildSell(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }

  Widget buildBuy() {
    Widget content;
    content = new Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(18),
              right: ScreenUtil().setWidth(18),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                    'BUY MAIDSAFECOIN',
                    style: UtilStyle.formTitleFont,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                  child: new Text(
                    'FROM ADDRESS',
                    style: UtilStyle.formSubtitleFont,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(12),
                      bottom: ScreenUtil().setHeight(32)),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: ScreenUtil().setHeight(0.7),
                              color: Colors.black))),
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
                                  style: UtilStyle.formSelectFont,
                                ),
                              ),
                            ),
                            new Container(
                              width: ScreenUtil().setWidth(24),
                              child: new Image.asset('images/down.png'),
                            )
                          ],
                        ),
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            new PopupMenuItem(
                              value: '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                              child: new Text(
                                "1YjsJhJH12918nmHkKUwjaAHj2341Aj",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setHeight(10),
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ]),
                ),
              ],
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
                color: Color.fromRGBO(50, 231, 163, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(44),
                  bottomRight: Radius.circular(44),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(50, 231, 163, 0.50),
                      offset: Offset(
                        ScreenUtil().setSp(0),
                        ScreenUtil().setSp(18),
                      ),
                      blurRadius: 40.0,
                      spreadRadius: 2.0),
                ]),
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(32),
                left: ScreenUtil().setWidth(18),
                right: ScreenUtil().setWidth(18),
                bottom: ScreenUtil().setHeight(30)),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Container(
                    child: new Text(
                      'AMOUNT TO BUY (OMN)',
                      style: UtilStyle.formKeyFont,
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),

                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: BorderRadius.circular(8)),
                  // padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(12), ScreenUtil().setWidth(15), ScreenUtil().setWidth(12), ScreenUtil().setWidth(15)),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: buyController,
                    focusNode: buyFocus,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w300,
                        fontSize: ScreenUtil().setSp(40)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(12),
                            ScreenUtil().setWidth(15),
                            ScreenUtil().setWidth(12),
                            ScreenUtil().setWidth(15)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: '0.0',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w300,
                            fontSize: ScreenUtil().setSp(40))),
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
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(12)),
                          child: new Text('0.00648945',
                              style: UtilStyle.formCacularFont),
                        ),
                        new Expanded(
                          child: new Container(
                            child: new Text('MADESAFECOIN',
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: ScreenUtil().setHeight(14),
                                    color: Color.fromRGBO(17, 27, 41, 0.5),
                                    letterSpacing:
                                        ScreenUtil().setHeight(-0.43))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Center(
                    child: new Container(
                      child: new FlatButton(
                        onPressed: () {
                          this._cancel();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setHeight(12)),
                                child: new Image(
                                  image: AssetImage('images/cancel.png'),
                                ),
                              ),
                              new Container(
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
                ),
                new Expanded(
                  child: new Center(
                    child: new Container(
                      child: new FlatButton(
                        onPressed: () {
                          this._buy();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setHeight(12)),
                                child: new Image.asset('images/upG.png'),
                              ),
                              new Container(
                                child: new Text(
                                  'BUY',
                                  style: UtilStyle.formSubmitFont,
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
    );
    return content;
  }

Widget buildSell() {
    Widget content;
    content = new Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(18),
              right: ScreenUtil().setWidth(18),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                    'SELL MAIDSAFECOIN',
                    style: UtilStyle.formTitleFont,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                  child: new Text(
                    'FROM ADDRESS',
                    style: UtilStyle.formSubtitleFont,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(12),
                      bottom: ScreenUtil().setHeight(32)),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: ScreenUtil().setHeight(0.7),
                              color: Colors.black))),
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
                                  style: UtilStyle.formSelectFont,
                                ),
                              ),
                            ),
                            new Container(
                              width: ScreenUtil().setWidth(24),
                              child: new Image.asset('images/down.png'),
                            )
                          ],
                        ),
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            new PopupMenuItem(
                              value: '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                              child: new Text(
                                "1YjsJhJH12918nmHkKUwjaAHj2341Aj",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setHeight(10),
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ]),
                ),
              ],
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
                color: Color.fromRGBO(82, 135, 210, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(44),
                  bottomRight: Radius.circular(44),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(82, 135, 210, 0.50),
                      offset: Offset(
                        ScreenUtil().setSp(0),
                        ScreenUtil().setSp(18),
                      ),
                      blurRadius: 40.0,
                      spreadRadius: 2.0),
                ]),
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(32),
                left: ScreenUtil().setWidth(18),
                right: ScreenUtil().setWidth(18),
                bottom: ScreenUtil().setHeight(30)),
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
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),

                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: BorderRadius.circular(8)),
                  // padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(12), ScreenUtil().setWidth(15), ScreenUtil().setWidth(12), ScreenUtil().setWidth(15)),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: sellController,
                    focusNode: sellFocus,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w300,
                        fontSize: ScreenUtil().setSp(40)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(12),
                            ScreenUtil().setWidth(15),
                            ScreenUtil().setWidth(12),
                            ScreenUtil().setWidth(15)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: '0.0',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w300,
                            fontSize: ScreenUtil().setSp(40))),
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
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(12)),
                          child: new Text('0.00648945',
                              style: UtilStyle.formCacularFont),
                        ),
                        new Expanded(
                          child: new Container(
                            child: new Text('MADESAFECOIN',
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: ScreenUtil().setHeight(14),
                                    color: Color.fromRGBO(17, 27, 41, 0.5),
                                    letterSpacing:
                                        ScreenUtil().setHeight(-0.43))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Center(
                    child: new Container(
                      child: new FlatButton(
                        onPressed: () {
                          this._cancel();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setHeight(12)),
                                child: new Image(
                                  image: AssetImage('images/cancel.png'),
                                ),
                              ),
                              new Container(
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
                ),
                new Expanded(
                  child: new Center(
                    child: new Container(
                      child: new FlatButton(
                        onPressed: () {
                          this._sell();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setHeight(12)),
                                child: new Image.asset('images/up.png'),
                              ),
                              new Container(
                                child: new Text(
                                  'SELL',
                                  style: UtilStyle.formSubmitFont,
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
    );
    return content;
  }

  _cancel() {
    Navigator.pop(context);
  }

  _sell() {}
  _buy() {}
}
