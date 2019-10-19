import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/menu/walletMenu.dart';
import 'package:scoped_model/scoped_model.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => new _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {
  Animation<double> animationWallet;
  AnimationController controllerWallet;
  @override
  void initState() {
    super.initState();
    controllerWallet = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animationWallet = new Tween(begin: 0.0, end: 1.0).animate(controllerWallet)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controllerWallet.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controllerWallet.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 376, height: 812, allowFontScaling: true)
          ..init(context);
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Positioned(
          bottom: (controllerWallet.value - 1) * ScreenUtil().setHeight(702),
          child: new Container(
            width: ScreenUtil().setWidth(376),
            height: ScreenUtil().setHeight(702),
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
                    width: ScreenUtil().setWidth(376),
                    child: new FlatButton(
                      onPressed: () {
                        model.changeIsAddressFull(false);
                        model.changeWalletIsActive(true);
                        setState(() {
                          
                        });
                      },
                      child: new Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(32),),
                        child: new Text('WALLET',
                            textAlign: TextAlign.left,
                            style: model.walletIsActive?UtilStyle.tagTitleFontActive:UtilStyle.tagTitleFont),
                      ),
                    ),
                  ),
                  new Container(
                    height: ScreenUtil().setHeight(226),
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(26),
                        left: ScreenUtil().setWidth(19)),
                    child: new Container(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  height: ScreenUtil().setHeight(24),
                                  width: ScreenUtil().setWidth(27),
                                  child: new Icon(Icons.mail),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(6),
                                      right: ScreenUtil().setWidth(12)),
                                  height: ScreenUtil().setHeight(24),
                                  width: ScreenUtil().setWidth(252),
                                  child: new Center(
                                    child: new Container(
                                      width: ScreenUtil().setWidth(252),
                                      child: new Text(
                                        '43021736-625b-42f3-9b79-21fd0216f00d',
                                        style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: ScreenUtil().setSp(12),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                new Container(
                                  height: ScreenUtil().setHeight(24),
                                  width: ScreenUtil().setHeight(24),
                                  child: new FlatButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      showDialog<Null>(
                                          context: context, //BuildContext对象
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return new WalletMenu();
                                          });
                                    },
                                    child: new Container(
                                      child: new Image.asset(
                                          'images/wallerInfo.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(17)),
                            child: Text(
                              '\$4,133.04',
                              style: TextStyle(
                                color: Color.fromRGBO(47, 214, 151, 1),
                                fontFamily: 'Helvetica',
                                fontSize: ScreenUtil().setSp(41.5),
                              ),
                            ),
                          ),
                          new Container(
                            margin:
                                EdgeInsets.only(top: ScreenUtil().setHeight(6)),
                            child: new Text(
                              '* ESTIMATED TOTAL VALUE',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontFamily: 'Helvetica',
                                  fontSize: ScreenUtil().setSp(10),
                                  height: 1.2),
                            ),
                          )
                        ],
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
