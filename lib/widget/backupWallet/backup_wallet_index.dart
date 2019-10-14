import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/backupWallet/backup_wallet_word.dart';

class BackupWalletIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return new Scaffold(
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(242, 244, 248, 1),
            leading: new Container(
              child: new Image.asset('images/headLogo.png'),
            ),
            title: new Center(
              child: new Text(
                '备份钱包',
                style: TextStyle(
                  color: Colors.black
                ),
                ),
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/menu.png'),
                onPressed: () {},
              )
            ],
          ),
          body: new Container(
            height: ScreenUtil().setHeight(730),
            child: new Column(
              children: <Widget>[
                new Container(),
                new Container(
                  child: new Text(
                    '请立即备份您的钱包'
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(30),
                  child: new Text(
                    '注意：请备份你的钱包账户，Omniwallet不会访问你的账户，不能回复私钥、重置密码。你自己控制自己的钱包和资产安全',
                    textAlign: TextAlign.center,
                  ),
                ),
                new Container(
                  child: new Container(
                    child: new FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return BackupWalletWord();
                              }
                          ),
                              (route) => route == null,
            );
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                        child: new Text('立即备份'),
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
}