import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/myInput.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/language/language.dart';
import 'package:omni/model/user_info.dart';
import 'package:omni/widget/login/backupWallet.dart';
import 'package:omni/widget/view_model/main_model.dart';
import 'package:omni/widget/view_model/state_lib.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerOldPin = new TextEditingController();
  TextEditingController controllerNewPin = new TextEditingController();
  TextEditingController controllerConfirmPin = new TextEditingController();
  TextEditingController controllerMnemonic = new TextEditingController();

  FocusNode oldPinFocus = new FocusNode();
  FocusNode newPinFocus = new FocusNode();
  FocusNode confirmPinFocus = new FocusNode();
  FocusNode mnemonicNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  String _validateOldPin(String val) {
    if (val == null || val.trim().length == 0) {
      return 'Old pin code could not be empty!';
    } else if (val.trim().length != 6) {
      return "Old pin's length must be 6!";
    } else {
      return '';
    }
  }

  String _validateNewPin(String val) {
    if (val == null || val.trim().length == 0) {
      return 'New pin code could not be empty!';
    } else if (val.trim().length != 6) {
      return "New pin's length must be 6!";
    } else {
      return '';
    }
  }

  String _validateConfirmPin(String val) {
    if (val == null || val.trim().length == 0) {
      return 'Confirm pin code could not be empty!';
    } else if (val.trim().length != 6) {
      return "Confirm pin's length must be 6!";
    } else if (val.trim() != controllerNewPin.text.trim()) {
      return "Confirm pin's code is not the same as new pin's code!";
    } else {
      return '';
    }
  }

  Function restore(BuildContext context) {
    String text = this.controllerMnemonic.text;
    var split = text.split(' ');
    split.removeWhere((item) {
      return item == ' ' || item.length == 0;
    });

    if (split.length == 12) {
      return () {
        var _mnemonic= split.join(' ');
        if(bip39.validateMnemonic(_mnemonic)==false){
          Tools.showToast(WalletLocalizations.of(context).restoreAccountTipError1);
          return null;
        }

          FocusScope.of(context).requestFocus(new FocusNode());

          String pin0 = this.controllerOldPin.text;
          String pin = this.controllerNewPin.text;

          String _pinCodeMd5 = Tools.convertMD5Str(pin0);
          String _pinCodeNewMd5 =  Tools.convertMD5Str(pin);

          var  userId = Tools.convertMD5Str(_mnemonic);
          Tools.loadingAnimation(context);
          Future result = NetConfig.post(context,
              NetConfig.restoreUser,
              {
                'userId':userId,
                'password':_pinCodeMd5,
                'newPsw':_pinCodeNewMd5
              },
              errorCallback: (msg){
                
              }
          );
          result.then((data){
            if(NetConfig.checkData(data)){
              GlobalInfo.userInfo.userId = userId;
              GlobalInfo.userInfo.faceUrl = data['faceUrl'];
              GlobalInfo.userInfo.nickname = data['nickname'];
              GlobalInfo.userInfo.loginToken = data['token'];
              if(data["fpUserInfo"]!=null&&data["fpUserInfo"]["username"]!=null){
                FPUserInfo fpUserInfo = FPUserInfo();
                fpUserInfo.hyperUsername =data["fpUserInfo"]["username"];
                List list = data["fpUserInfo"]["addresses"];
                fpUserInfo.addresses = [];
                for(int i=0;i<list.length;i++){
                  fpUserInfo.addresses.add(list[i]);
                }
                GlobalInfo.userInfo.fpUserInfo = fpUserInfo;
              }

              Tools.saveStringKeyValue(KeyConfig.userLoginToken, GlobalInfo.userInfo.loginToken);

              Tools.saveStringKeyValue(KeyConfig.userPinCodeMd5, _pinCodeNewMd5);
              GlobalInfo.userInfo.pinCode = _pinCodeNewMd5;


              Tools.saveStringKeyValue(KeyConfig.userMnemonic, Tools.encryptAes(_mnemonic));
              GlobalInfo.userInfo.mnemonic = _mnemonic;

              Tools.saveStringKeyValue(KeyConfig.userMnemonicMd5, userId);

              Future<SharedPreferences> prefs = SharedPreferences.getInstance();
              prefs.then((share){
                share.setBool(KeyConfig.isBackup, true);
              });

              GlobalInfo.bip39Seed = null;
              GlobalInfo.userInfo.init(context,(){
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => WalletAndAddress()), (
                    route) => route == null
                );
              });
            }else{
              Navigator.of(context).pop();
            }
          });
        
      };
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return new Container(
          height: ScreenUtil().setHeight(605),
          width: ScreenUtil().setWidth(376),
          child: new Stack(
            children: <Widget>[
              new Positioned(
                bottom: 0,
                child: new Container(
                  height: ScreenUtil().setHeight(605),
                  width: ScreenUtil().setWidth(376),
                  child: new Container(
                    height: ScreenUtil().setHeight(405),
                    width: ScreenUtil().setWidth(376),
                    child: new SingleChildScrollView(
                      child: new Container(
                    height: ScreenUtil().setHeight(405),
                    width: ScreenUtil().setWidth(376),
                    child: new SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          new Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 30, right: 30),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  padding: EdgeInsets.only(top: 3, bottom: 3),
                                  child: new Text('Notice:',
                                      style: new TextStyle(
                                          color: Color(0xff4a77b7),
                                          fontSize: 13,
                                          height: 1,
                                          fontWeight: FontWeight.bold)),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(top: 3, bottom: 3),
                                  child: new Text(
                                      'After importing account by Mnemonic Phrase,you can reset password for safety concerns.',
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        color: Color(0xff4a77b7),
                                        fontSize: 13,
                                        height: 1.4,
                                      )),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(top: 17, bottom: 30),
                                  height: ScreenUtil().setHeight(65),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffcfd1d9)),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: new TextField(
                                    controller: controllerMnemonic,
                                    focusNode: mnemonicNode,
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                    style: UtilStyle.inputStyleM,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 30,
                                            right: 50,
                                            top: 10,
                                            bottom: 10),
                                        hintText: 'Input mnemonic phrase',
                                        hintStyle: UtilStyle.hintTextFontM),
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: new Text('RESET PIN',
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff7a82a3),
                                        fontSize: 10,
                                      )),
                                ),
                                new Container(
                                  width: double.infinity,
                                  child: new MyInput(
                                    rules: _validateOldPin,
                                    inputController: controllerOldPin,
                                    maxLength: 6,
                                    keyType: TextInputType.number,
                                    placeholder: 'OLD PIN',
                                    hinText: 'INPUT OLD PIN',
                                    inputFocuse: oldPinFocus,
                                    isPassword: false,
                                    errorMsg: '',
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  child: new MyInput(
                                    rules: _validateNewPin,
                                    inputController: controllerNewPin,
                                    keyType: TextInputType.number,
                                    maxLength: 6,
                                    placeholder: 'NEW PIN',
                                    hinText: 'INPUT NEW PIN',
                                    inputFocuse: newPinFocus,
                                    isPassword: false,
                                    errorMsg: '',
                                  ),
                                ),
                                new Container(
                                  width: double.infinity,
                                  child: new MyInput(
                                    rules: _validateConfirmPin,
                                    inputController: controllerConfirmPin,
                                    keyType: TextInputType.number,
                                    maxLength: 6,
                                    placeholder: 'CONFIRM PIN',
                                    hinText: 'INPUT CONFIRM PIN',
                                    inputFocuse: confirmPinFocus,
                                    isPassword: false,
                                    errorMsg: '',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                    ),
                  ),
                  ),
              ),
              new Positioned(
                bottom: 0,
                child: new Container(
                  height: ScreenUtil().setHeight(192),
                  width: ScreenUtil().setWidth(376),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(242, 244, 248, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ScreenUtil().setHeight(44)),
                      topRight: Radius.circular(ScreenUtil().setHeight(44)),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.10),
                          offset: Offset(0, -24),
                          blurRadius: 48.0,
                          spreadRadius: 2.0),
                    ],
                  ),
                  child: new Container(
                    child: new FlatButton(
                      splashColor: Color(0x00ffffff),
                      highlightColor: Color(0x00ffffff),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/walletAndAddress');
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) {
                          return new BackupWalletHome();
                        }));
                      },
                      child: Center(
                        child: Text(
                          Language.login[model.language],
                          style: UtilStyle.submitFont,
                        ),
                      ),
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
