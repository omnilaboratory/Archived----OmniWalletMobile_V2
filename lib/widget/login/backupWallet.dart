import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/login/backupMnemonic.dart';

class BackupWalletHome extends StatefulWidget {
  _BackupWalletHomeState createState() => new _BackupWalletHomeState();
}

class _BackupWalletHomeState extends State<BackupWalletHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            Positioned(
              child: new BeforLoginHead(),
            ),
            Positioned(
              bottom: 0,
              child: new Container(
                padding: EdgeInsets.only(top: 30, left: 18, right: 18),
                height: ScreenUtil().setHeight(692),
                width: ScreenUtil().setWidth(376),
                decoration: new BoxDecoration(
                    color: Color(0xfff2f4f8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.10),
                          offset: Offset(0, -24),
                          blurRadius: 48)
                    ]),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Container(
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                alignment: Alignment.center,
                                child: new Text(
                                  'BACK UP WALLET',
                                  textAlign: TextAlign.center,
                                  style: UtilStyle.titleFont,
                                ),
                              ),
                            ),
                            new Container(
                              width: 50,
                              height: 24,
                              child: new FlatButton(
                                splashColor: Color(0xfff2f4f8),
                                highlightColor: Color(0xfff2f4f8),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/walletAndAddress');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                padding: EdgeInsets.all(0),
                                child: new Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff4a77b7)),
                                      borderRadius: BorderRadius.circular(24)),
                                  child: new Text(
                                    'LATER',
                                    style: new TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff4a77b7),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 86),
                      width: 172,
                      child: Image.asset('images/allWallet.png'),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new Text(
                        'Back up your wallet now！',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000)),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 30, bottom: 3),
                      child: new Text('Notice:',
                          style: new TextStyle(
                              color: Color(0xff4a77b7),
                              fontSize: 13,
                              height: 1.4,
                              fontWeight: FontWeight.bold)),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                          top: 3, bottom: 3, left: 30, right: 30),
                      child: new Text(
                          "Please back up your wallet, Omni will never visit your account, can not restore your never visit your account, can not restore your manage your wallet on your own, and make sure the safety of your asset.",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Color(0xff4a77b7),
                            fontSize: 13,
                            height: 1.4,
                          )),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 136),
                      child: new FlatButton(
                        splashColor: Color(0xfff2f4f8),
                        highlightColor: Color(0xfff2f4f8),
                        onPressed: (){
                          Navigator.push(context, 
                            new MaterialPageRoute(
                              builder: (BuildContext context){
                                return new BackupMnemonic();
                              }
                            )
                          );
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: SvgPicture.asset('svg/arrowUp.svg',width: 18,)
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 21),
                                child: new Text(
                                  'BACK UP MNEMONIC PHRASE',
                                  style:TextStyle(
                                    fontSize:12,
                                    fontWeight:FontWeight.bold,
                                    color:Colors.black,
                                    letterSpacing: 3.5
                                  )
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
            )
          ],
        ),
      ),
    );
  }
}
