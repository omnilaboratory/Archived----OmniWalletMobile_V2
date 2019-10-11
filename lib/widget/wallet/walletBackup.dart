import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/menu/topMenu.dart';
import 'package:scoped_model/scoped_model.dart';

class WalletBackup extends StatefulWidget {
  _WalletBackupState createState() => new _WalletBackupState();
}

class _WalletBackupState extends State<WalletBackup> {
  bool isAccept = false;

  TextEditingController walletNameControll = new TextEditingController();
  FocusNode walletNameFocus = new FocusNode();
  TextEditingController passControll = new TextEditingController();
  FocusNode passFocus = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: new Container(
              height: ScreenUtil().setHeight(46),
              child: new Image.asset('images/headLogo.png'),
            ),
            actions: <Widget>[
              new Container(
                height: ScreenUtil().setHeight(46),
                width: ScreenUtil().setWidth(46),
                decoration:
                    new BoxDecoration(borderRadius: BorderRadius.circular(46)),
                child: new FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog<Null>(
                        context: context, //BuildContext对象
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new TopMenu();
                        });
                  },
                  child: new Container(
                    height: ScreenUtil().setHeight(46),
                    width: ScreenUtil().setWidth(46),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(46)),
                    // child: new Image.network(),
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            child: new Stack(
              children: <Widget>[
                new Positioned(
                  top: ScreenUtil().setHeight(100),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: ScreenUtil().setHeight(440),
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(18),
                      top: ScreenUtil().setHeight(28),
                      right: ScreenUtil().setWidth(18),
                      bottom: ScreenUtil().setHeight(32),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(82, 135, 210, 0.25),
                            offset: Offset(
                              ScreenUtil().setSp(0),
                              ScreenUtil().setSp(24),
                            ),
                            blurRadius: 48.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text('WALLET BACKUP',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Helvetica',
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color.fromRGBO(74, 119, 183, 1),
                                  letterSpacing: ScreenUtil().setSp(3.5))),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                height: ScreenUtil().setHeight(24),
                                width: ScreenUtil().setWidth(27),
                                color: Colors.red,
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
                            ],
                          ),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                          child: new Text('BACKUP NAME',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                                fontSize: ScreenUtil().setSp(10),
                                color: Color.fromRGBO(0, 0, 0, 0.35),
                              )),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(9)),
                          width: ScreenUtil().setWidth(339),
                          height: ScreenUtil().setHeight(68),
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(ScreenUtil().setSp(8)),
                              color: Color.fromRGBO(74, 119, 183, 0.1)),
                          child: new TextField(
                            controller: walletNameControll,
                            focusNode: walletNameFocus,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(16)),
                          child: new Text('PASSWORD',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                                fontSize: ScreenUtil().setSp(10),
                                color: Color.fromRGBO(0, 0, 0, 0.35),
                              )),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(9)),
                          width: ScreenUtil().setWidth(339),
                          height: ScreenUtil().setHeight(68),
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(ScreenUtil().setSp(8)),
                              color: Color.fromRGBO(74, 119, 183, 0.1)),
                          child: new TextField(
                            controller: passControll,
                            focusNode: passFocus,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'ENTER YOUR PASSWORD',
                                hintStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(10),
                                    color: Color.fromRGBO(0, 0, 0, 0.35),
                                    fontFamily: 'Helvetica')),
                          ),
                        ),
                        new Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(24)),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  child: new Checkbox(
                                    value: isAccept,
                                    activeColor: Color.fromRGBO(0, 0, 0, 1),
                                    onChanged: (bool val) {
                                      isAccept = val;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                new Container(
                                  child: new Text(
                                    'ACCEPT YOU`VE',
                                    style: new TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: ScreenUtil().setSp(10)),
                                  ),
                                ),
                                new Container(
                                  child: new FlatButton(
                                    padding: EdgeInsets.all(0),
                                    child: new Container(
                                      child: new Text(
                                        ' READ THIS WARNING',
                                        style: new TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Color.fromRGBO(
                                                74, 119, 183, 0.5)),
                                      ),
                                    ),
                                  ),
                                ),
                                new Container(
                                  child: new Text(
                                    ' AND UNDERSTAND',
                                    style: new TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: ScreenUtil().setSp(10)),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                new Positioned(
                  bottom: ScreenUtil().setHeight(78),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(52)),
                          child: new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            padding: EdgeInsets.all(0),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                    margin: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(12)),
                                    width: ScreenUtil().setWidth(24),
                                    child:
                                        new Image.asset('images/cancel.png')),
                                new Container(
                                    child: new Text(
                                  'CANCEL',
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Helvetica',
                                      fontSize: ScreenUtil().setSp(12),
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: ScreenUtil().setSp(3.5)),
                                ))
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          margin:
                              EdgeInsets.only(right: ScreenUtil().setWidth(52)),
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                  margin: EdgeInsets.only(
                                      bottom: ScreenUtil().setHeight(12)),
                                  height: ScreenUtil().setWidth(24),
                                  child: new Image.asset('images/up.png')),
                              new Container(
                                  child: new Text(
                                'BACKUP WALLET',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Helvetica',
                                    fontSize: ScreenUtil().setSp(12),
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    letterSpacing: ScreenUtil().setSp(3.5)),
                              ))
                            ],
                          ),
                        ),
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
}
