import 'package:omni/common/myInput.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/login/backupWallet.dart';
import 'package:bip39/bip39.dart' as bip39;

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
  Future <SharedPreferences> prefs = SharedPreferences.getInstance();

  bool canSubmit = false;

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

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<LocalModel>(
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
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                    left: ScreenUtil().setWidth(30),
                                    right: ScreenUtil().setWidth(30)),
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(3),
                                          bottom: ScreenUtil().setHeight(3)),
                                      child: new Text('Notice:',
                                          style: new TextStyle(
                                              color: Color(0xff4a77b7),
                                              fontSize: 13,
                                              height: 1,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    new Container(
                                      padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(3),
                                          bottom: ScreenUtil().setHeight(3)),
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
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(71),
                                          bottom: ScreenUtil().setHeight(30)),
                                      height: ScreenUtil().setHeight(65),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffcfd1d9)),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: new TextField(
                                        controller: controllerMnemonic,
                                        focusNode: mnemonicNode,
                                        maxLines: 4,
                                        textAlign: TextAlign.center,
                                        style: UtilStyle.inputStyleM,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: ScreenUtil().setWidth(30),
                                                right:
                                                    ScreenUtil().setWidth(50),
                                                top: ScreenUtil().setHeight(10),
                                                bottom:
                                                    ScreenUtil().setHeight(10)),
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
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(20)),
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
                        String mnemonic = controllerMnemonic.text;
                        var mnemonicArr = mnemonic.split(' ');
                        mnemonicArr.removeWhere((item) {
                          return item == ' ' || item.length == 0;
                        });
                        if (mnemonicArr.length == 12) {
                          var _mnemonic = mnemonicArr.join(' ');
                          if (bip39.validateMnemonic(_mnemonic) == false) {
                            UtilFunction.showToast('Wrong Mnemonic!');
                            return null;
                          }
                          String _oldPinMd5 = UtilFunction.convertMD5Str(controllerOldPin.text);
                          String _newPinMd5 =  UtilFunction.convertMD5Str(controllerNewPin.text);
                          var userId = UtilFunction.convertMD5Str(_mnemonic);
                          UtilFunction.showLoading(context);
                          Future result = NetConfig.post(context, HttpConst.restoreUser, {
                            'userId':userId,
                            'password':_oldPinMd5,
                            'newPsw':_newPinMd5

                          },
                          errorCallback: (msg){});
                          result.then((data){
                            prefs.then((share){
                              share.setString('userId', data['userId']);
                              share.setString('mnemonic', mnemonic);
                              share.setString('pinCode', _newPinMd5);
                              share.setString('nickname', data['username']);
                              share.setString('loginToken', data['token']);
                              LocalModel().of(context).userInfo.userId = userId;
                              LocalModel().of(context).userInfo.mnemonic = mnemonic;
                              LocalModel().of(context).userInfo.pinCode = _newPinMd5;
                              LocalModel().of(context).userInfo.nickname = data['username'];
                              LocalModel().of(context).userInfo.loginToken = data['token'];
                              LocalModel().of(context).userInfo.mnemonicSeed = null;
                              LocalModel().of(context).userInfo.initUserInfo(context,(){
                                  UtilFunction.stopLoading(context);
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return BackupWalletHome();
                                        }
                                    ),
                                        (route) => route == null,
                                  );
                              });
                            });
                          });
                          
                        } else {
                          UtilFunction.showToast('Wrong Mnemonic!');
                        }
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
