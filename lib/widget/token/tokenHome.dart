import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/tokenInput.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/menu/footMenu.dart';
import 'package:omni/widget/token/tokenDetail.dart';

class TokenHome extends StatefulWidget {
  _TokenHomeState createState() => new _TokenHomeState();
}

class _TokenHomeState extends State<TokenHome> with TickerProviderStateMixin {
  Animation<double> tokenAnimation;
  AnimationController tokenController;

  Animation<double> historyAnimation;
  AnimationController historyController;

  TextEditingController descriptionController;
  TextEditingController nameController;
  TextEditingController websiteController;
  TextEditingController rateController;
  TextEditingController bonusController;
  TextEditingController feeController;

  FocusNode rateFocus;

  double historyHeight = ScreenUtil().setHeight(420);
  double historyTableHeight = ScreenUtil().setHeight(310);
  String nowShow = '';

  bool categoryShow = false;
  bool subCategoryShow = false;
  bool addressShow = false;
  bool showPadding = false;
  int _issuanceValue = 1;
  String timeType = '';
  bool tableShow = true;

  @override
  void initState() {
    descriptionController = new TextEditingController();
    nameController = new TextEditingController();
    websiteController = new TextEditingController();
    rateController = new TextEditingController();
    bonusController = new TextEditingController();
    feeController = new TextEditingController();
    rateFocus = new FocusNode();
    super.initState();
    tokenController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    tokenAnimation = new Tween(begin: 0.1, end: 1.0).animate(tokenController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    tokenController.forward();
    historyController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    historyAnimation =
        new Tween(begin: 0.1, end: 1.0).animate(historyController)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    historyController.forward();
    setState(() {});
    Future.delayed(Duration(milliseconds: 10), () {
      // this._getHistoryData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    tokenController.dispose();
    historyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
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
          body: Container(
            color: Color.fromRGBO(70, 116, 182, 0.02),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  bottom:
                      (tokenController.value - 1) * ScreenUtil().setHeight(702),
                  child: new Container(
                    height: ScreenUtil().setHeight(702),
                    width: ScreenUtil().setWidth(376),
                    decoration: BoxDecoration(
                        color: Color(0xfff2f4f8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.07),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: Column(
                        children: <Widget>[
                          new Container(
                            padding:
                                EdgeInsets.only(left: 18, right: 18, top: 16),
                            child: new FlatButton(
                              splashColor: Color(0xfff2f4f8),
                              highlightColor: Color(0xfff2f4f8),
                              onPressed: () {
                                nowShow = 'token';
                                historyHeight = 68;
                                historyTableHeight = 0;
                                tableShow = false;
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                child: new Text('CREATE TOKEN',
                                    style: nowShow == "token"
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont),
                              ),
                            ),
                          ),
                          new Container(
                            child: _tokenContent(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: (tokenController.value - 1) * historyHeight,
                  child: new Container(
                    height: historyHeight,
                    width: ScreenUtil().setWidth(376),
                    decoration: BoxDecoration(
                        color: Color(0xfff2f4f8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.1),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: Column(
                        children: <Widget>[
                          new Container(
                            padding:
                                EdgeInsets.only(left: 18, right: 18, top: 16),
                            child: new FlatButton(
                              splashColor: Color(0xfff2f4f8),
                              highlightColor: Color(0xfff2f4f8),
                              onPressed: () {
                                nowShow = "history";
                                historyHeight = ScreenUtil().setHeight(642);
                                tableShow = true;
                                historyTableHeight = ScreenUtil().setHeight(520);
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                child: new Text('HISTORY',
                                    style: nowShow == "history"
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont),
                              ),
                            ),
                          ),
                          tableShow?new Container(
                            child: _historyContent([]),
                          ):new Container()
                        ],
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

  Widget _tokenContent() {
    Widget content;

    content = new Container(
      height: ScreenUtil().setHeight(565),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(44), bottomRight: Radius.circular(44)),
      ),
      width: double.infinity,
      child: new SingleChildScrollView(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(
                    bottom: showPadding ? ScreenUtil().setHeight(200) : 20),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: new TokenInput(
                        title: 'NAME',
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: new TokenInput(
                        title: 'WEBSITE',
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: new TokenInput(
                        title: 'DESCRIPTION',
                        showLength: true,
                        maxLength: 80,
                        controller: descriptionController,
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 24),
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'CATEGORY',
                              style: UtilStyle.tokenTitleFont,
                            ),
                          ),
                          new Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.15)))),
                            child: new FlatButton(
                              splashColor: Color(0xfff2f4f8),
                              highlightColor: Color(0xfff2f4f8),
                              onPressed: () {
                                categoryShow = !categoryShow;
                                showPadding = !showPadding;
                                print(showPadding);
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new Container(
                                      child: new Text(
                                        'data',
                                        style: UtilStyle.tokenInputStyle,
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    width: 32,
                                    child: new Image.asset('images/down.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      margin: EdgeInsets.only(top: 24),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'SUB CATEGORY',
                              style: UtilStyle.tokenTitleFont,
                            ),
                          ),
                          new Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.15)))),
                            child: new FlatButton(
                              splashColor: Color(0xfff2f4f8),
                              highlightColor: Color(0xfff2f4f8),
                              onPressed: () {
                                subCategoryShow = !subCategoryShow;
                                showPadding = !showPadding;
                                print(showPadding);
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new Container(
                                      child: new Text(
                                        'data',
                                        style: UtilStyle.tokenInputStyle,
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    width: 32,
                                    child: new Image.asset('images/down.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      margin: EdgeInsets.only(top: 24),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'ADDRESS',
                              style: UtilStyle.tokenTitleFont,
                            ),
                          ),
                          new Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.15)))),
                            child: new FlatButton(
                              splashColor: Color(0xfff2f4f8),
                              highlightColor: Color(0xfff2f4f8),
                              onPressed: () {
                                addressShow = !addressShow;
                                showPadding = !showPadding;
                                print(addressShow);
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new Container(
                                      child: new Text(
                                        'data',
                                        style: UtilStyle.tokenInputStyle,
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    width: 32,
                                    child: new Image.asset('images/down.png'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      margin: EdgeInsets.only(top: 24),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            // margin: EdgeInsets.only(bottom: 18),
                            child: new Text(
                              'ISSUANCE',
                              style: UtilStyle.tokenTitleFont,
                            ),
                          ),
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                    child: new FlatButton(
                                      splashColor: Color(0xfff2f4f8),
                                      highlightColor: Color(0xfff2f4f8),
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        _issuanceValue = 1;
                                        setState(() {});
                                      },
                                      child: new Container(
                                        child: new Row(
                                          children: <Widget>[
                                            new Container(
                                              child: new Container(
                                                width: 14,
                                                height: 14,
                                                decoration: new BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    border:
                                                        Border.all(width: 1.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14)),
                                                child: _issuanceValue == 1
                                                    ? new Center(
                                                        child: new Container(
                                                          width: 8,
                                                          height: 8,
                                                          decoration: new BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(left: 8),
                                              child: new Text('CROWD SALE',
                                                  style: UtilStyle
                                                      .tokenInputStyle),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: new Container(
                                      child: new FlatButton(
                                    splashColor: Color(0xfff2f4f8),
                                    highlightColor: Color(0xfff2f4f8),
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      _issuanceValue = 2;
                                      setState(() {});
                                    },
                                    child: new Container(
                                      child: new Row(
                                        children: <Widget>[
                                          new Container(
                                            child: new Container(
                                              width: 14,
                                              height: 14,
                                              decoration: new BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  border:
                                                      Border.all(width: 1.3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                              child: _issuanceValue == 2
                                                  ? new Center(
                                                      child: new Container(
                                                        width: 8,
                                                        height: 8,
                                                        decoration:
                                                            new BoxDecoration(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                          ),
                                          new Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: new Text('FIXED',
                                                style:
                                                    UtilStyle.tokenInputStyle),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: new Container(
                                      child: new FlatButton(
                                          splashColor: Color(0xfff2f4f8),
                                          highlightColor: Color(0xfff2f4f8),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            _issuanceValue = 3;
                                            setState(() {});
                                          },
                                          child: new Container(
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  child: new Container(
                                                    width: 14,
                                                    height: 14,
                                                    decoration:
                                                        new BoxDecoration(
                                                            color:
                                                                Color
                                                                    .fromRGBO(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        1),
                                                            border:
                                                                Border.all(
                                                                    width: 1.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14)),
                                                    child: _issuanceValue == 3
                                                        ? new Center(
                                                            child:
                                                                new Container(
                                                              width: 8,
                                                              height: 8,
                                                              decoration: new BoxDecoration(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                                new Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  child: new Text('MANUAL',
                                                      style: UtilStyle
                                                          .tokenInputStyle),
                                                ),
                                              ],
                                            ),
                                          ))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: ScreenUtil().setWidth(110),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text('RATE',
                                      style: UtilStyle.tokenTitleFont),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 4),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.7,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.15)))),
                                  child: new Row(
                                    children: <Widget>[
                                      new Container(
                                        width: ScreenUtil().setWidth(60),
                                        child: new TextField(
                                          controller: rateController,
                                          focusNode: rateFocus,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 0, right: 0),
                                              border: InputBorder.none),
                                          style: UtilStyle.tokenInputStyle,
                                        ),
                                      ),
                                      new Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(0xffffffff),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    138, 168, 212, 0.25),
                                                offset: Offset(0, 2),
                                                blurRadius: 12,
                                              )
                                            ]),
                                        padding: EdgeInsets.only(left: 5),
                                        child: new Row(
                                          children: <Widget>[
                                            new Container(
                                              child: new Text('OMNI',
                                                  style: UtilStyle
                                                      .tokenInputTagStyle),
                                            ),
                                            new Container(
                                              width: 24,
                                              child: Image.asset(
                                                  'images/down.png'),
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
                          new Container(
                            width: ScreenUtil().setWidth(57),
                            margin: EdgeInsets.only(left: 32, right: 32),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text('BONUS',
                                      style: UtilStyle.tokenTitleFont),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 4),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.7,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.15)))),
                                  child: new Row(
                                    children: <Widget>[
                                      new Container(
                                        height: 24,
                                        child: new Text('%',
                                            style: UtilStyle.tokenTitleFont),
                                      ),
                                      new Container(
                                        width: ScreenUtil().setWidth(45),
                                        child: new TextField(
                                          controller: rateController,
                                          focusNode: rateFocus,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 0, right: 0),
                                              border: InputBorder.none),
                                          style: UtilStyle.tokenInputStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            width: ScreenUtil().setWidth(86),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text('miner fees'.toUpperCase(),
                                      style: UtilStyle.tokenTitleFont),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 4),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.7,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.15))),
                                  ),
                                  child: new Row(
                                    children: <Widget>[
                                      new Container(
                                        width: ScreenUtil().setWidth(56),
                                        child: new TextField(
                                          controller: rateController,
                                          focusNode: rateFocus,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 0, right: 0),
                                              border: InputBorder.none),
                                          style: UtilStyle.tokenInputStyle,
                                        ),
                                      ),
                                      new Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(0xffffffff)),
                                        padding: EdgeInsets.only(
                                            left: 7,
                                            right: 7,
                                            top: 7,
                                            bottom: 7),
                                        child: new Row(
                                          children: <Widget>[
                                            new Container(
                                              decoration:
                                                  BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      138, 168, 212, 0.25),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 12,
                                                )
                                              ]),
                                              child: new Text('BTC',
                                                  style: UtilStyle
                                                      .tokenInputTagStyle),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      margin: EdgeInsets.only(top: 24),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    child: new Text(
                                      'END DATE',
                                      style: UtilStyle.tokenTitleFont,
                                    ),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(
                                      right: 48,
                                    ),
                                    child: new Row(
                                      children: <Widget>[
                                        Container(
                                          width: 30,
                                          child: new Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.15)))),
                                            margin: EdgeInsets.only(right: 8),
                                            child: new TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'MM',
                                                  hintStyle: UtilStyle
                                                      .tokenInputStyle),
                                              style: UtilStyle.tokenInputStyle,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          child: new Container(
                                            margin: EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.15)))),
                                            child: new TextField(
                                              style: UtilStyle.tokenInputStyle,
                                              decoration: InputDecoration(
                                                  hintText: 'DD',
                                                  hintStyle:
                                                      UtilStyle.tokenInputStyle,
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          child: new Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.15)))),
                                            child: new TextField(
                                              style: UtilStyle.tokenInputStyle,
                                              decoration: InputDecoration(
                                                  hintText: 'YYYY',
                                                  hintStyle:
                                                      UtilStyle.tokenInputStyle,
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Expanded(
                            child: new Container(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    child: new Text(
                                      'END TIME (UTC)',
                                      style: UtilStyle.tokenTitleFont,
                                    ),
                                  ),
                                  new Container(
                                    child: new Row(
                                      children: <Widget>[
                                        Container(
                                          width: 30,
                                          child: new Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.15)))),
                                            margin: EdgeInsets.only(right: 8),
                                            child: new TextField(
                                              style: UtilStyle.tokenInputStyle,
                                              decoration: InputDecoration(
                                                  hintText: 'HH',
                                                  hintStyle:
                                                      UtilStyle.tokenInputStyle,
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: new Text(
                                            ':',
                                            style: UtilStyle.tokenInputStyle,
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          child: new Container(
                                            margin: EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.15)))),
                                            child: new TextField(
                                              style: UtilStyle.tokenInputStyle,
                                              decoration: InputDecoration(
                                                  hintText: 'MM',
                                                  hintStyle:
                                                      UtilStyle.tokenInputStyle,
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                height: 24,
                                                width: 24,
                                                margin:
                                                    EdgeInsets.only(right: 6),
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    color: timeType == 'am'
                                                        ? Colors.black
                                                        : Color(0xfff2f4f8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: new FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  child: new Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            3.5, 7, 3.5, 7),
                                                    child: new Text(
                                                      'AM',
                                                      style: timeType == 'am'
                                                          ? UtilStyle
                                                              .timeTagFontActive
                                                          : UtilStyle
                                                              .timeTagFont,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    timeType = 'am';
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              new Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      color: timeType == 'pm'
                                                          ? Colors.black
                                                          : Color(0xfff2f4f8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  child: new FlatButton(
                                                    onPressed: () {
                                                      timeType = 'pm';
                                                      setState(() {});
                                                    },
                                                    padding: EdgeInsets.all(0),
                                                    child: new Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              3.5, 7, 3.5, 7),
                                                      child: new Text(
                                                        'PM',
                                                        style: timeType == 'pm'
                                                            ? UtilStyle
                                                                .timeTagFontActive
                                                            : UtilStyle
                                                                .timeTagFont,
                                                      ),
                                                    ),
                                                  ))
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
                        ],
                      ),
                    ),
                    new Container(
                      width: ScreenUtil().setWidth(376),
                      height: 86,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(44),
                            bottomRight: Radius.circular(44),
                          )),
                      child: new FlatButton(
                        splashColor: Color(0xFFf2f4f8),
                        // highlightColor: Color(0xfff2f4f8),
                        onPressed: (){

                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Text(
                            'CREATE TOKEN',
                            style: new TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 2.89
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              categoryShow
                  ? new Positioned(
                      top: ScreenUtil().setHeight(317),
                      left: 18,
                      child: new Container(
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44))),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(344),
                        child: new SingleChildScrollView(
                          child: new Container(
                            padding: EdgeInsets.only(
                                left: 18, right: 18, top: 0, bottom: 0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16
                                  ),
                                  child: new Text('123',style: UtilStyle.selectOptionStyle,),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16
                                  ),
                                  child: new Text('123',style: UtilStyle.selectOptionStyle,),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16
                                  ),
                                  child: new Text('123',style: UtilStyle.selectOptionStyle,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : new Container(),
              subCategoryShow
                  ? new Positioned(
                    left: 18,
                      top: ScreenUtil().setHeight(406),
                      child: new Container(
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44))),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(344),
                        child: new SingleChildScrollView(
                          child: new Container(
                            padding: EdgeInsets.only(
                                left: 18, right: 18, top: 32, bottom: 32),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text('123'),
                                ),
                                new Container(
                                  child: new Text('123'),
                                ),
                                new Container(
                                  child: new Text('123'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : new Container(),
              addressShow
                  ? new Positioned(
                      top: ScreenUtil().setHeight(495),
                      left: 18,
                      child: new Container(
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44))),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(344),
                        child: new SingleChildScrollView(
                          child: new Container(
                            padding: EdgeInsets.only(
                                left: 18, right: 18, top: 32, bottom: 32),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text('123'),
                                ),
                                new Container(
                                  child: new Text('123'),
                                ),
                                new Container(
                                  child: new Text('123'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : new Container(),
            ],
          ),
        ),
      ),
    );
    return content;
  }

  Widget _historyContent(List historyList) {
    List<Widget> listUI = [];
    for(var i =0;i<20;i++){
      listUI.add(HistoryTableRow(123));
    }
    Widget tableHead = new Container(
      padding: EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 58,
            child: new Text(
              'COIN',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: 91,
            child: new Text(
              'NAME',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: 100,
            child: new Text(
              'TYPE',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: 99,
            child: new Text(
              'STATUS',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    Widget content;
    content = new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: tableHead,
          ),
          new Container(
            height: historyTableHeight,
            child: new SingleChildScrollView(
              child: new Container(
                child: new Column(
                  children: listUI,
                ),
              ),
            ),
          )
        ],
      ),
    );
    return content;
  }
}

class  HistoryTableRow extends StatelessWidget {
  final data;
  HistoryTableRow(this.data);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FlatButton(
        splashColor: Color(0xfff2f4f8),
        highlightColor: Color(0xfff2f4f8),
        onPressed: (){
          showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new TokenDetailDilog(data);
            });
        },
        padding: EdgeInsets.all(0),
        child: Container(
      padding: EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 58,
            child: new Text(
              'COIN',
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: 91,
            child: new Text(
              'NAME',
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: 100,
            child: new Text(
              'TYPE',
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: 99,
            child: new Text(
              'STATUS',
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