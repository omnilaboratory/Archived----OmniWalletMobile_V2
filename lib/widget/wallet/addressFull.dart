import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/menu/addressFulMenu.dart';
import 'package:omni/widget/view_model/main_model.dart';
import 'package:omni/widget/wallet/addressSellDetail.dart';
import 'package:omni/widget/wallet/addressSendDetail.dart';
import 'package:omni/widget/wallet/sellPage.dart';
import 'package:omni/widget/wallet/sendPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:omni/common/utilFunction.dart';

class AddressFull extends StatefulWidget {
  @override
  _AddressFullState createState() => new _AddressFullState();
}

class _AddressFullState extends State<AddressFull>
    with SingleTickerProviderStateMixin {
  Animation<double> animationAddressFull;
  AnimationController controllerAddressFull;
  @override
  void initState() {
    super.initState();
    controllerAddressFull = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationAddressFull =
        new Tween(begin: 1.0, end: 0.0).animate(controllerAddressFull)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    controllerAddressFull.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controllerAddressFull.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Positioned(
          bottom:
              (controllerAddressFull.value - 1) * ScreenUtil().setHeight(640),
          child: new Container(
            width: ScreenUtil().setWidth(376),
            height: ScreenUtil().setHeight(640),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(44), topLeft: Radius.circular(44)),
              color: Color.fromRGBO(242, 244, 248, 1),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(70, 116, 182, 0.10),
                    offset: Offset(
                      ScreenUtil().setSp(0),
                      ScreenUtil().setSp(0),
                    ),
                    blurRadius: 40.0,
                    spreadRadius: 2.0),
              ],
            ),
            child: new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(32),
                        left: ScreenUtil().setWidth(19),
                        right: ScreenUtil().setWidth(19)),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          child: new Text('ADDRESSES',
                              textAlign: TextAlign.left,
                              style: UtilStyle.tagTitleFontActive),
                        ),
                        new Container(
                          child: new FlatButton(
                              splashColor: Color(0x00ffffff),
                              highlightColor: Color(0x00ffffff),
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                showDialog<Null>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return new AddressFullMenu();
                                    });
                              },
                              child: new Container(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(5),
                                  bottom: ScreenUtil().setHeight(5),
                                  left: ScreenUtil().setWidth(12),
                                  right: ScreenUtil().setWidth(12),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(8.0))),
                                child: new Row(
                                  children: <Widget>[
                                    new Container(
                                      child: new Text('ADD ADDRESS',
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              // fontFamily: 'GothamRnd',
                                              fontSize: ScreenUtil().setSp(10),
                                              letterSpacing:
                                                  ScreenUtil().setSp(0.91))),
                                    ),
                                    new Container(
                                      width: ScreenUtil().setWidth(24),
                                      child: new Image.asset('images/down.png'),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: ScreenUtil().setHeight(550),
                    child: new SingleChildScrollView(
                      child: new Container(
                        child: new AddressTypeList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddressTypeList extends StatefulWidget {
  _AddressTypeListState createState() => new _AddressTypeListState();
}

class _AddressTypeListState extends State<AddressTypeList> {
  ScrollController controller = new ScrollController();

  var data = [
    {
      'name': 'BUSINESS WALLET',
      'countAmount': '3,211.05',
      'data': [
        {
          'id': '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
          'btype': 0,
          'count': 0.1432214
        }
      ]
    },
    {
      'name': 'PERSONAL',
      'countAmount': '611.99',
      'data': [
        {'id': '1YjsJhJH12918nmHkKUwjaAHj2341A', 'btype': 0, 'count': 0.1432214}
      ]
    }
  ];
  var page = 1;

  @override
  void initState() {
    super.initState();
  }

  Widget typeListBuild() {
    List<Widget> items = [];
    Widget content;
    for (var i = 0; i < data.length; i++) {
      items.add(new AddressTypeItem(
        itemData: data[i],
        isLast: data.length == i - 1,
        idx: i,
      ));
    }
    content = new Column(
      children: items,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(child: typeListBuild()),
    );
  }
}

class AddressTypeItem extends StatelessWidget {
  AddressTypeItem({this.itemData, this.isLast, this.idx});

  final Map<String, Object> itemData;
  final bool isLast;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child: ListTile(
                  onTap: () {
                    if (!model.isAddressFull) {
                      model.changeIsAddressFull(true);
                      model.changeWalletIsActive(false);
                    }
                    if (model.dexfaultOpenWallet == idx) {
                      model.changeOpenWallet(null);
                    } else {
                      model.changeOpenWallet(idx);
                    }
                  },
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(18),
                        right: ScreenUtil().setWidth(18),
                        top: ScreenUtil().setHeight(6),
                        bottom: ScreenUtil().setHeight(6)),
                    decoration: BoxDecoration(),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(12),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                                  BorderRadius.circular(ScreenUtil().setSp(4)),
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(11),
                                    bottom: ScreenUtil().setHeight(11),
                                  ),
                                  child: new Text(
                                    itemData['name'],
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'GothamRnd',
                                        fontSize: ScreenUtil().setSp(10),
                                        letterSpacing: ScreenUtil().setSp(1.5)),
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(12)),
                                  width: ScreenUtil().setHeight(48),
                                  height: ScreenUtil().setHeight(48),
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  child: new FlatButton(
                                    splashColor: Color(0x00ffffff),
                                    highlightColor: Color(0x00ffffff),
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: new Container(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(11),
                                        bottom: ScreenUtil().setHeight(11),
                                      ),
                                      child: new Image(
                                        width: ScreenUtil().setHeight(24),
                                        height: ScreenUtil().setHeight(24),
                                        image:
                                            new AssetImage('images/edit.png'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        new Container(
                          child: new Text(
                            '\$' + itemData['countAmount'].toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(47, 214, 151, 1),
                                // fontFamily: 'GothamRnd',
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: ScreenUtil().setSp(-0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              idx == model.dexfaultOpenWallet
                  ? new Container(
                      child:
                          new AddressList(itemData: itemData['data'], idx: idx),
                    )
                  : new Container()
            ],
          ),
        );
      },
    );
  }
}

class AddressList extends StatefulWidget {
  AddressList({Key key, this.itemData, this.idx}) : super(key: key);
  final List<Map<String, Object>> itemData;
  final int idx;
  _AddressListState createState() => new _AddressListState();
}

class _AddressListState extends State<AddressList> {
  List<Map<String, Object>> data = [];
  int itemIdx;
  @override
  void initState() {
    data = widget.itemData;
    itemIdx = widget.idx;
    super.initState();
  }

  Widget addressItemBuild() {
    List<Widget> items = [];
    Widget content;
    for (var i = 0; i < data.length; i++) {
      items.add(new AddressItem(
        item: data[i],
        isLast: i == data.length - 1,
        itemIdx: itemIdx,
        idx: i,
      ));
    }
    content = new Column(
      children: items,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(child: addressItemBuild());
  }
}

class AddressItem extends StatefulWidget {
  AddressItem({Key key, this.item, this.isLast, this.itemIdx, this.idx})
      : super(key: key);
  final Map<String, Object> item;
  final bool isLast;
  final int itemIdx;
  final int idx;
  _AddressItemState createState() => new _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  Map<String, Object> item;
  bool isLast;
  int itemIdx;
  int idx;
  @override
  void initState() {
    super.initState();
    item = widget.item;
    isLast = widget.isLast;
    itemIdx = widget.itemIdx;
    idx = widget.idx;
  }

  var transactionType = 'ALL';

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              child: new FlatButton(
                  splashColor: Color(0x00ffffff),
                  highlightColor: Color(0x00ffffff),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    model.changeOpenAddress(idx);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(18),
                        right: ScreenUtil().setWidth(18)),
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(16),
                        bottom: ScreenUtil().setHeight(16)),
                    decoration: new BoxDecoration(
                        border: Border(
                            bottom: isLast
                                ? BorderSide.none
                                : BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                  ))),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(27),
                                height: ScreenUtil().setWidth(19),
                                margin: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(8)),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().setSp(3))),
                                child: new Text(
                                  'ID',
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(10),
                                      height: ScreenUtil().setHeight(1.9),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: ScreenUtil().setSp(2.89),
                                      fontFamily: 'GothamRnd'),
                                ),
                              ),
                              new Container(
                                width: ScreenUtil().setWidth(263),
                                margin: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(8)),
                                child: new Text(
                                  item['id'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              new Container(
                                child: new PopupMenuButton(
                                  child: new Container(
                                    width: ScreenUtil().setWidth(24),
                                    child: new Image.asset(
                                        'images/addressInfo.png'),
                                  ),
                                  offset: Offset(ScreenUtil().setWidth(12),
                                      ScreenUtil().setHeight(-1)),
                                  onSelected: (String value) {
                                    List valueArr = value.split(',');
                                    var address = valueArr[0];
                                    var name = valueArr[1];
                                    model.address = address;
                                    Navigator.pushNamed(context, name);
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                        value:
                                            item['id'].toString() + ',/PUBKEY',
                                        child: Container(
                                          child: new Text(
                                            "PUBKEY",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                    PopupMenuDivider(),
                                    new PopupMenuItem(
                                        value: item['id'].toString() +
                                            ',/signMessage',
                                        child: new Container(
                                          child: new Text(
                                            "SIGN MESSAGE",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                    PopupMenuDivider(),
                                    new PopupMenuItem(
                                        value: item['id'].toString() +
                                            ',/RemoveFromWallet',
                                        child: new Container(
                                          child: new Text(
                                            "REMOVE FROM WALLET",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(9),
                              right: ScreenUtil().setWidth(9),
                              top: ScreenUtil().setHeight(16),
                              bottom: ScreenUtil().setHeight(16)),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      child: new Row(
                                        children: <Widget>[
                                          new Container(
                                            width: ScreenUtil().setWidth(85),
                                            child: new Text(
                                              UtilFunction.formatCount(
                                                  item['count'], 7),
                                              textAlign: TextAlign.right,
                                              style: new TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(20),
                                                  // fontWeight: FontWeight.bold,
                                                  // fontFamily: 'GothamRnd',
                                                  letterSpacing: ScreenUtil()
                                                      .setSp(-0.61)),
                                            ),
                                          ),
                                          new Container(
                                              width: ScreenUtil().setWidth(38),
                                              height:
                                                  ScreenUtil().setHeight(24),
                                              margin: EdgeInsets.only(
                                                  left:
                                                      ScreenUtil().setWidth(8)),
                                              decoration: new BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: new Text(
                                                item['btype'] == 0
                                                    ? 'BTC'
                                                    : (item['btype'] == 31
                                                        ? 'USDT'
                                                        : 'OMNI'),
                                                textAlign: TextAlign.center,
                                                style: new TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(8),
                                                    fontWeight: FontWeight.bold,
                                                    // fontFamily: 'GothamRnd',
                                                    letterSpacing: ScreenUtil()
                                                        .setSp(-0.24),
                                                    height: ScreenUtil()
                                                        .setHeight(2.4)),
                                              )),
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      child: new Row(
                                        children: <Widget>[
                                          new Container(
                                            width: ScreenUtil().setWidth(85),
                                            child: new Text(
                                              "\$" +
                                                  UtilFunction.formatCount(
                                                      2211.05, 2),
                                              textAlign: TextAlign.right,
                                              style: new TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 231, 163, 1),
                                                  fontSize:
                                                      ScreenUtil().setSp(20),
                                                  // fontWeight: FontWeight.bold,
                                                  // fontFamily: 'GothamRnd',
                                                  letterSpacing: ScreenUtil()
                                                      .setSp(-0.61)),
                                            ),
                                          ),
                                          new Container(
                                              width: ScreenUtil().setWidth(38),
                                              height:
                                                  ScreenUtil().setHeight(24),
                                              margin: EdgeInsets.only(
                                                  left:
                                                      ScreenUtil().setWidth(8)),
                                              decoration: new BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: new Text(
                                                'USD',
                                                textAlign: TextAlign.center,
                                                style: new TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(8),
                                                    fontWeight: FontWeight.bold,
                                                    // fontFamily: 'GothamRnd',
                                                    letterSpacing: ScreenUtil()
                                                        .setSp(-0.24),
                                                    height: ScreenUtil()
                                                        .setHeight(2.4)),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                width: ScreenUtil().setHeight(54),
                                height: ScreenUtil().setHeight(54),
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(24)),
                                child: new Stack(
                                  children: <Widget>[
                                    new Container(
                                      width: ScreenUtil().setHeight(54),
                                      height: ScreenUtil().setHeight(54),
                                      color: Colors.green,
                                    ),
                                    new Container(
                                      width: ScreenUtil().setHeight(54),
                                      height: ScreenUtil().setHeight(54),
                                      color: Color.fromRGBO(255, 255, 255, 0.5),
                                      child: new Center(
                                        child: new Container(
                                          width: ScreenUtil().setHeight(24),
                                          height: ScreenUtil().setHeight(24),
                                          child: Image.asset('images/lock.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(24),
                                    right: ScreenUtil().setWidth(17)),
                                child: new Container(
                                  width: ScreenUtil().setWidth(32),
                                  child: new FlatButton(
                                    splashColor: Color(0x00ffffff),
                                    highlightColor: Color(0x00ffffff),
                                    onPressed: () {
                                      model.changeOpenAddress(null);
                                      model.changeOpenWallet(null);
                                      Navigator.push(context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return new SendPage(item: item);
                                      }));
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: new Column(
                                      children: <Widget>[
                                        new Container(
                                            width: ScreenUtil().setWidth(32),
                                            height: ScreenUtil().setWidth(32),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.green)),
                                            child: new Center(
                                              child: new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                height:
                                                    ScreenUtil().setWidth(24),
                                                child: new Image.asset(
                                                    'images/send.png'),
                                              ),
                                            )),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(11)),
                                          child: new Text(
                                            'SEND',
                                            style: UtilStyle.addressButtonFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              new Container(
                                child: new Container(
                                  width: ScreenUtil().setWidth(32),
                                  child: new FlatButton(
                                    splashColor: Color(0x00ffffff),
                                    highlightColor: Color(0x00ffffff),
                                    onPressed: () {
                                      model.changeOpenAddress(null);
                                      model.changeOpenWallet(null);
                                      Navigator.push(context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return new SellPage(item: item);
                                      }));
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: new Column(
                                      children: <Widget>[
                                        new Container(
                                            width: ScreenUtil().setWidth(32),
                                            height: ScreenUtil().setWidth(32),
                                            decoration: BoxDecoration(
                                                // color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color.fromRGBO(
                                                        142, 170, 211, 1))),
                                            child: new Center(
                                              child: new Container(
                                                width:
                                                    ScreenUtil().setWidth(24),
                                                height:
                                                    ScreenUtil().setWidth(24),
                                                child: new Image.asset(
                                                    'images/sell.png'),
                                              ),
                                            )),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(11)),
                                          child: new Text(
                                            'SELL',
                                            style: UtilStyle.addressButtonFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            model.dexfaultOpenWallet == itemIdx &&
                    model.defaultOpenAddress == idx
                ? Container(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(18),
                        right: ScreenUtil().setWidth(18)),
                    child: Column(
                      children: <Widget>[
                        new Container(
                          width: ScreenUtil().setWidth(331),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                child: new Text('TRANSACTIONS',
                                    style: new TextStyle(
                                        // fontFamily: 'GothamRnd',
                                        fontSize: ScreenUtil().setSp(12),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: ScreenUtil().setSp(3.5),
                                        color: Color.fromRGBO(
                                            74, 119, 183, 0.75))),
                              ),
                              new Container(
                                child: new PopupMenuButton(
                                  onSelected: (value) {
                                    transactionType =
                                        value.toString().toUpperCase();
                                    setState(() {});
                                  },
                                  offset: Offset(0, 20),
                                  child: new Container(
                                    child: new Row(
                                      children: <Widget>[
                                        new Container(
                                          child: new Icon(
                                            Icons.keyboard_arrow_down,
                                            size: ScreenUtil().setHeight(24),
                                          ),
                                        ),
                                        new Container(
                                          child: new Text(
                                            '$transactionType',
                                            style: TextStyle(
                                                // fontFamily: 'GothamRnd',
                                                fontSize:
                                                    ScreenUtil().setSp(10),
                                                fontWeight: FontWeight.bold,
                                                letterSpacing:
                                                    ScreenUtil().setSp(2.89),
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                        value: 'all',
                                        child: Container(
                                          child: new Text(
                                            "ALL",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setHeight(10),
                                              // fontFamily: 'GothamRnd',
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                    PopupMenuDivider(),
                                    new PopupMenuItem(
                                        value: 'send',
                                        child: new Container(
                                          child: new Text(
                                            "SEND",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setHeight(10),
                                              // fontFamily: 'GothamRnd',
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                    PopupMenuDivider(),
                                    new PopupMenuItem(
                                        value: 'sell',
                                        child: new Container(
                                          child: new Text(
                                            "SELL",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setHeight(10),
                                              // fontFamily: 'GothamRnd',
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(17, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          child: new TransctionTable(
                            id: item['id'],
                            idx: idx,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ));
      },
    );
  }
}

class TransctionTable extends StatefulWidget {
  TransctionTable({Key key, this.id, this.idx}) : super(key: key);
  final String id;
  final int idx;
  _TransctionTable createState() => new _TransctionTable();
}

class _TransctionTable extends State<TransctionTable> {
  String id;
  int idx;
  List<Map<String, Object>> data = [
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'send', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'send', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'send', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'send', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'send', 'date': '7/20', 'amount': 31.45, 'status': 'sold'},
    {'transType': 'sell', 'date': '7/20', 'amount': 31.45, 'status': 'sold'}
  ];
  @override
  void initState() {
    super.initState();
    id = widget.id;
    idx = widget.idx;
    setState(() {});
  }

  Widget transactionTableBuild() {
    List<Widget> items = [];
    Widget tableHead = new Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(13),
      ),
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10), bottom: ScreenUtil().setHeight(10)),
      child: Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(58),
            child: new Text('I/O', style: UtilStyle.tableHeadFont),
          ),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text('DATE', style: UtilStyle.tableHeadFont),
          ),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text('USD', style: UtilStyle.tableHeadFont),
          ),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text('STATUS', style: UtilStyle.tableHeadFont),
          ),
        ],
      ),
    );
    Widget content;

    items.add(tableHead);
    for (var i = 0; i < data.length; i++) {
      Widget item = new Container(
        child: new FlatButton(
          splashColor: Color(0x00ffffff),
          highlightColor: Color(0x00ffffff),
          onPressed: () {
            showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  // return new AddressSendDetail();
                  if(data[i]['transType'] == 'sell'){
                    return new AddressSellDetail();
                  }else{
                    return new AddressSendDetail();
                  }
                });
          },
          padding: EdgeInsets.all(0),
          child: new Container(
            child: new TableRow(data: data[i]),
          ),
        ),
      );
      items.add(item);
    }
    content = new Column(
      children: items,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return Container(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5)),
          child: transactionTableBuild(),
        );
      },
    );
  }
}

class TableRow extends StatelessWidget {
  final Map<String, Object> data;
  TableRow({this.data});
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        bottom: ScreenUtil().setHeight(10),
      ),
      child: Row(
        children: <Widget>[
          new Container(
              child: new Container(
            width: ScreenUtil().setWidth(58),
            alignment: Alignment.centerLeft,
            child: new Image(
              width: ScreenUtil().setHeight(24),
              height: ScreenUtil().setHeight(24),
              image: data['transType'].toString() == 'sell'
                  ? AssetImage('images/tranSell.png')
                  : AssetImage('images/tranReserve.png'),
            ),
          )),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text(data['date'], style: UtilStyle.tableContentFont),
          ),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text('\$' + data['amount'].toString(),
                style: UtilStyle.tableContentFont),
          ),
          new Container(
            width: ScreenUtil().setWidth(90),
            child: new Text(data['status'].toString().toUpperCase(),
                style: UtilStyle.tableContentFont),
          ),
        ],
      ),
    );
  }
}
