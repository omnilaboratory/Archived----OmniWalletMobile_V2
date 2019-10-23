import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/myInput.dart';
import 'package:omni/language/language.dart';
import 'package:omni/model/global_model.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/mnemonic_phrase_model.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/tools/Tools.dart';
import 'package:omni/tools/key_config.dart';
import 'package:omni/tools/net_config.dart';
import 'package:omni/widget/backupWallet/backup_wallet_index.dart';
import 'package:scoped_model/scoped_model.dart';

class Create extends StatefulWidget {
  _CreateState createState() => new _CreateState();
}

class _CreateState extends State<Create> {
  //user input Controller 
  TextEditingController userController = new TextEditingController();
  // user input focus
  FocusNode userFocus = new FocusNode();
  //pinCode input Controller 
  TextEditingController controllerPin = new TextEditingController();
  // pinCode input focus
  FocusNode pinFocus = new FocusNode();
  //pinCodeRepeate input Controller
  TextEditingController controllerPinRepeate = new TextEditingController();
  // pinCodeRepeate input Controller
  FocusNode pinRepeateFocus = new FocusNode();

  String nickNameErr = '';
  String pinErr = '';
  String rePinErr = '';

  @override
  void initState() {
    super.initState();
    userFocus.addListener(() {});
    pinFocus.addListener(() {});
    pinRepeateFocus.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Container(
          height: ScreenUtil().setHeight(541),
          width: ScreenUtil().setWidth(376),
          child: new Stack(
            children: <Widget>[
              new Positioned(
                bottom: 0,
                child: new Container(
                  height: ScreenUtil().setHeight(541),
                  width: ScreenUtil().setWidth(376),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        child: new MyInput(
                          rules: _validateNickName,
                          inputController: userController,
                          placeholder: 'NICKNAME',
                          inputFocuse: userFocus,
                          isPassword: false,
                          errorMsg: nickNameErr,
                        ),
                      ),
                      new Container(
                        child: new MyInput(
                          rules: _validatePin,
                          inputController: controllerPin,
                          placeholder: 'PIN',
                          inputFocuse: pinFocus,
                          isPassword: false,
                          errorMsg: pinErr,
                        ),
                      ),
                      new Container(
                        child: new MyInput(
                          rules: _validateRepeatPin,
                          inputController: controllerPinRepeate,
                          placeholder: 'PIN REAPTE',
                          inputFocuse: pinRepeateFocus,
                          isPassword: false,
                          errorMsg: rePinErr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Positioned(
                bottom: 0,
                child: new Container(
                  height: ScreenUtil().setHeight(196),
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
                          offset: Offset(
                            ScreenUtil().setSp(0),
                            ScreenUtil().setSp(0),
                          ),
                          blurRadius: 40.0,
                          spreadRadius: 2.0),
                    ],
                  ),
                  child: new Container(
                    child: new FlatButton(
                      onPressed: () {
                        /* showDialog<Null>(
                          context: context, 
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return new Loading();
                          }); */
                        submit();
                        /* Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return BackupWalletIndex();
                  }
              ),
                  (route) => route == null,
            ); */
                      },
                      child: Center(
                        child: Text(Language.submit[model.language]),
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

  String _validateNickName(String val) {
    if (val == null || val.trim().length == 0) {
      return 'Nickname could not be empty!';
    } else if (val.trim().length < 3) {
      return 'Nickname`s length could not less than 3!';
    } else {
      return '';
    }
  }

  String _validatePin(String val) {
    if (val == null || val.trim().length == 0) {
      return 'Pin code could not be empty!';
    } else if (val.trim().length != 6) {
      return 'Pin code`s length must be 6!';
    } else {
      return '';
    }
  }

  String _validateRepeatPin(String val) {
    if (val == null || val.trim().length == 0) {
      return 'Pin code repeate could not be empty!';
    } else if (val != controllerPin.text) {
      return 'Pin code repeate is not the same as pin code!';
    } else {
      return '';
    }
  }

  bool checkForm() {
    print('check');
    nickNameErr = _validateNickName(userController.text);
    pinErr = _validatePin(controllerPin.text);
    rePinErr = _validateRepeatPin(controllerPinRepeate.text);
    setState(() {});
    if (nickNameErr == '' && pinErr == '' && rePinErr == '') {
      return true;
    } else {
      if (nickNameErr != '') {
        Tools.showToast(nickNameErr, toastLength: Toast.LENGTH_LONG);
      } else {
        if (pinErr != '') {
          Tools.showToast(pinErr, toastLength: Toast.LENGTH_LONG);
        } else {
          Tools.showToast(rePinErr, toastLength: Toast.LENGTH_LONG);
        }
      }
      return false;
    }
  }

  void submit() {
    print('submit');
    var isPass = checkForm();
    print(isPass);
    if (isPass) {
      // 1. Create Mnemonic Phrase.
      String _mnemonic = MnemonicPhrase.getInstance().createPhrases();
      print('==> [Mnemonic Phrase] ==> $_mnemonic');

      // 2. Encrypt the Mnemonic Phrase with the MD5 algorithm and
      // save it locally and remotely as User ID.
      // (User ID is used to associate user data)
      String _mnemonicMd5 = Tools.convertMD5Str(_mnemonic);

      // 3. Encrypt the PIN code with the MD5 algorithm.
      String _pinCodeMd5 = Tools.convertMD5Str(controllerPin.text);

      // Show loading animation.
      Tools.loadingAnimation(context);

      // 4. Nick name (Clear text) , Mnemonic Phrase (MD5) and Pin Code (MD5) save to remotely.
      Future data = NetConfig.post(context, NetConfig.createUser, {
        'userId': _mnemonicMd5,
        'nickname': userController.text,
        'password': _pinCodeMd5
      }, errorCallback: () {
        Navigator.of(context).pop();
      });
      data.then((data) {
        if (NetConfig.checkData(data)) {
          GlobalInfo.userInfo.userId = _mnemonicMd5;
          GlobalInfo.userInfo.mnemonic = _mnemonic;
          GlobalInfo.userInfo.pinCode = _pinCodeMd5;
          GlobalInfo.userInfo.nickname = userController.text;
          GlobalInfo.userInfo.loginToken = data['token'];

          // Save data to locally.
          // Login Token
          // Mnemonic Phrase (AES Encrypt and MD5)
          // Pin code (MD5)
          Tools.saveStringKeyValue(
              KeyConfig.userLoginToken, GlobalInfo.userInfo.loginToken);
          Tools.saveStringKeyValue(
              KeyConfig.userMnemonic, Tools.encryptAes(_mnemonic));
          Tools.saveStringKeyValue(KeyConfig.userMnemonicMd5, _mnemonicMd5);
          Tools.saveStringKeyValue(KeyConfig.userPinCodeMd5, _pinCodeMd5);

          GlobalInfo.userInfo.mnemonicSeed = null;

          GlobalInfo.userInfo.init(context, () {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) {
                return BackupWalletIndex();
              }),
              (route) => route == null,
            );
          });
        }
      });
    }
  }
}
