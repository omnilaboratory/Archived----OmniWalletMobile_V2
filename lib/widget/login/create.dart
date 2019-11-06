import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/mnemonic.dart';
import 'package:omni/common/myInput.dart';
import 'package:omni/common/utilFunction.dart';
import 'package:omni/language/language.dart';
import 'package:omni/tools/net_config.dart';
import 'package:omni/widget/login/backupWallet.dart';
import 'package:omni/widget/view_model/state_lib.dart';
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
    return new ScopedModelDescendant<MainStateModel>(
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
                          hinText: 'NICKNAME',
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
                          hinText: 'PIN CODE',
                          isPassword: false,
                          errorMsg: pinErr,
                        ),
                      ),
                      new Container(
                        child: new MyInput(
                          rules: _validateRepeatPin,
                          inputController: controllerPinRepeate,
                          placeholder: 'PIN REAPTE',
                          hinText: 'PIN CONFIRM',
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
                      splashColor: Color(0x00ffffff),
                      highlightColor: Color(0x00ffffff),
                      onPressed: () {
                        submit();
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
    nickNameErr = _validateNickName(userController.text);
    pinErr = _validatePin(controllerPin.text);
    rePinErr = _validateRepeatPin(controllerPinRepeate.text);
    setState(() {});
    if (nickNameErr == '' && pinErr == '' && rePinErr == '') {
      return true;
    } else {
      return false;
    }
  }

  /*
   * author:Tong
   * time:2019/11/14
   * 英文注释：
   * step1:Create mnemonic words
   * step2:Encrypt the words with the md5 and save it at location
   * step3:Encrypt the PIN cod with the md5
   * step4:Nickname and PIN code in md5 save to remotely、mnemonic wods in md5 as user ID save to remotely
   * Chinese note:
   * 第一步:生成助记单词
   * 第二步:将助记单词 转换为MD5
   * 第三步:将PIN code 转换为MD5
   * 第四部:将昵称和PIN code的md5存入服务器、将助记单词的md5以User ID存入服务器
   */
  void submit() {
    // step1 第一步
    String mnemonic = Mnemonic.getInstance().createPhrases();
    // step2 第二步
    String mnemonicMd5 = UtilFunction.convertMD5Str(mnemonic);
    // step3 第三步
    String pinCodeMd5 = UtilFunction.convertMD5Str(controllerPin.text);
    UtilFunction.showLoading(context);
    // step4 第四步
    Future data = NetConfig.post(context, NetConfig.createUser, {
      'userId': mnemonicMd5,
      'nickname': userController.text,
      'password': pinCodeMd5
    }, errorCallback: () {
      Navigator.of(context).pop();
    });
    data.then((data) {
      if (NetConfig.checkData(data)) {
        GlobalInfo.userInfo.userId = mnemonicMd5;
        GlobalInfo.userInfo.mnemonic = mnemonic;
        GlobalInfo.userInfo.pinCode = pinCodeMd5;
        GlobalInfo.userInfo.nickname = userController.text;
        GlobalInfo.userInfo.loginToken = data['token'];

        // Save data to locally.
        // Login Token
        // Mnemonic Phrase (AES Encrypt and MD5)
        // Pin code (MD5)
        Tools.saveStringKeyValue(
            KeyConfig.userLoginToken, GlobalInfo.userInfo.loginToken);
        Tools.saveStringKeyValue(
            KeyConfig.userMnemonic, Tools.encryptAes(mnemonic));
        Tools.saveStringKeyValue(KeyConfig.userMnemonicMd5, mnemonicMd5);
        Tools.saveStringKeyValue(KeyConfig.userPinCodeMd5, pinCodeMd5);

        GlobalInfo.userInfo.mnemonicSeed = null;

        GlobalInfo.userInfo.init(context, () {
          print('woyaokaishile');
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (BuildContext context) {
              return new BackupWalletHome();
            }),
            (route) => route == null,
          );
        });
      }
    });
  }
}
