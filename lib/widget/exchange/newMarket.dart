import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/head.dart';

class NewMarket extends StatefulWidget {
  final Map<String, Object> item;
  NewMarket({Key key, this.item}) : super(key: key);
  _NewMarketState createState() => new _NewMarketState();
}

class _NewMarketState extends State<NewMarket>
    with SingleTickerProviderStateMixin {
  Map<String, Object> item;
  List marketData = [];
  Animation<double> marketAnimation;
  AnimationController marketController;
  String selectedAddress = '1YjsJhJH12918nmHkKUwjaAHj2341Aj';

  TextEditingController buyController = new TextEditingController();
  TextEditingController sellController = new TextEditingController();

  FocusNode buyFocus = new FocusNode();
  FocusNode sellFocus = new FocusNode();

  String selectType = 'OMNI';
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
            color: Color.fromRGBO(70, 116, 182, 0.1),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  child: new AfterLoginHead(),
                ),
                Positioned(
                  bottom: (marketController.value - 1) *
                      ScreenUtil().setHeight(652),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: ScreenUtil().setHeight(652),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 244, 248, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.1),
                              offset: Offset(
                                ScreenUtil().setSp(0),
                                ScreenUtil().setSp(-24),
                              ),
                              blurRadius: 48.0,
                              spreadRadius: 2.0),
                        ]),
                    child: new Container(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(18),
                              right: ScreenUtil().setWidth(18),
                            ),
                            child: new Container(
                              child: new Container(
                                child: new Text(
                                  'START NEW MARKET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: 'GothamRnd',
                                    fontSize: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(376),
                            color: Color.fromRGBO(242, 244, 248, 1),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  child: buildSell(),
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
          ),
        );
      },
    );
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
                      bottom: ScreenUtil().setHeight(24)),
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
                                  // fontFamily: 'GothamRnd',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(17, 27, 41, 1),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ]),
                ),
                new Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(32)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'CHOOSE COIN TO SELL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'GothamRnd',
                              fontSize: ScreenUtil().setWidth(10),
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(8)),
                        width: ScreenUtil().setWidth(50),
                        height: ScreenUtil().setWidth(24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(138, 168, 212, 0.25),
                                  offset: Offset(0, 2),
                                  blurRadius: 12)
                            ]),
                        child: new PopupMenuButton(
                          onSelected: (val) {
                            selectType = val;
                            setState(() {});
                          },
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  child: new Text(selectType,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setWidth(8),
                                          color: Colors.black,
                                          letterSpacing:
                                              ScreenUtil().setHeight(-0.24))),
                                ),
                              ),
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                child: Image.asset('images/down.png'),
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<String>>[
                            PopupMenuItem(
                              value: 'OMNI',
                              child: new Text('OMNI'),
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
                        // fontFamily: 'GothamRnd',
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
                            // fontFamily: 'GothamRnd',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(12)),
                          child: new Text('0.00648945',
                              style: UtilStyle.formCacularFont),
                        ),
                        new Container(
                            width: ScreenUtil().setWidth(38),
                            height: ScreenUtil().setWidth(24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.centerLeft,
                            child: new Center(
                              child: new Text('BTC',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      // fontFamily: 'GothamRnd',
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setHeight(10),
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing:
                                          ScreenUtil().setHeight(-0.43))),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
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
                        splashColor: Color(0x00ffffff),
                        highlightColor: Color(0x00ffffff),
                        onPressed: () {
                          this._newMarket();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(24),
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setHeight(12)),
                                child: new Image.asset('images/upB.png'),
                              ),
                              new Container(
                                child: new Text(
                                  'NEW MARKET',
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

  _newMarket() {}
}
