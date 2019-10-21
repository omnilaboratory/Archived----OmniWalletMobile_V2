import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/menu/addressMenu.dart';
import 'package:scoped_model/scoped_model.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => new _AddressState();
}

class _AddressState extends State<Address> with SingleTickerProviderStateMixin {
  Animation<double> animationAddress;
  AnimationController controllerAddress;
  @override
  void initState() {
    super.initState();
    controllerAddress = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationAddress =
        new Tween(begin: 1.0, end: 0.0).animate(controllerAddress)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    controllerAddress.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controllerAddress.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Positioned(
          bottom: (controllerAddress.value - 1) * ScreenUtil().setHeight(406),
          child: new Container(
            width: ScreenUtil().setWidth(376),
            height: ScreenUtil().setHeight(406),
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
              height: ScreenUtil().setHeight(406),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: ScreenUtil().setHeight(82),
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
                              style: UtilStyle.tagTitleFont),
                        ),
                        new Container(
                          child: new FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                showDialog<Null>(
                                    context: context, //BuildContext对象
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return new AddressMenu();
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
                    height: ScreenUtil().setHeight(324),
                    child: new Container(
                      height: ScreenUtil().setHeight(324),
                      child: new Container(
                        height: ScreenUtil().setHeight(324),
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
    {'name': 'BUSINESS WALLET', 'countAmount': '3,211.05', 'data': []},
    {'name': 'PERSONAL', 'countAmount': '611.99', 'data': []}
  ];
  var page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        height: ScreenUtil().setHeight(324),
        child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new AddressTypeItem(
                itemData: data[index],
                isLast: data.length == index + 1,
                idx: index);
          },
        ),
      ),
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
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child: ListTile(
                  onTap: () {
                    if (!model.isAddressFull) {
                      model.changeIsAddressFull(true);
                    }
                    model.changeOpenWallet(idx);
                    model.changeWalletIsActive(false);
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
                              right: ScreenUtil().setWidth(12),
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
            ],
          ),
        );
      },
    );
  }
}
