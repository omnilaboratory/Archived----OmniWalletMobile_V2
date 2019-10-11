import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/loading.dart';
import 'package:omni/common/myInput.dart';
import 'package:omni/language/language.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/mnemonic_phrase_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Create extends StatefulWidget {
  _CreateState createState() => new _CreateState();
}

class _CreateState extends State<Create> {
  //userController 的输入框
  TextEditingController userController = new TextEditingController();
  // user聚焦
  FocusNode userFocus = new FocusNode();
  //pinCodeController 的输入框
  TextEditingController controllerPin = new TextEditingController();
  // pinCode聚焦
  FocusNode pinFocus = new FocusNode();
  //pinCodeController 的输入框
  TextEditingController controllerPinRepeate = new TextEditingController();
  // pinCode聚焦
  FocusNode pinRepeateFocus = new FocusNode();

  String nickNameErr = '';
  String pinErr = '';
  String rePinErr = '';

  @override
  void initState() {
    super.initState();
    userFocus.addListener((){
      
    });
    pinFocus.addListener((){
      
    });
    pinRepeateFocus.addListener((){
      
    });
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
                          rules: '',
                          inputController: userController,
                          placeholder: 'NICKNAME',
                          inputFocuse: userFocus,
                          isPassword: false,
                          errorMsg: nickNameErr,
                        ),
                      ),
                      new Container(
                        child: new MyInput(
                          rules: '',
                          inputController: controllerPin,
                          placeholder: 'PIN',
                          inputFocuse: pinFocus,
                          isPassword: false,
                          errorMsg: pinErr,
                        ),
                      ),
                      new Container(
                        child: new MyInput(
                          rules: '',
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
                        showDialog<Null>(
                          context: context, //BuildContext对象
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return new Loading();
                          });
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

  String _validateNickName(String val){
    if(val == null || val.trim().length == 0){
      return 'Nickname could not be empty!';
    }else if(val.trim().length<3){
      return 'Nickname`s length could not less than 3!';
    }else {
      return '';
    }
  }
  String _validatePin(String val){
    if(val == null || val.trim().length == 0){
      return 'Pin code could not be empty!';
    }else if(val.trim().length!=6){
      return 'Pin code`s length must be 6!';
    }else {
      return '';
    }
  }
  String _validateRepeatPin(String val){
    if(val == null || val.trim().length == 0){
      return 'Pin code repeate could not be empty!';
    }else if(val != controllerPin.text){
      return 'Pin code repeate is not the same as pin code!';
    }else {
      return '';
    }
  }

  
  bool checkForm (){
    nickNameErr =  _validateNickName(userController.text);
    pinErr =  _validateNickName(controllerPin.text);
    rePinErr =  _validateNickName(controllerPinRepeate.text);
    setState(() {
      
    });
    if(nickNameErr==''&&pinErr==''&&rePinErr==''){
      return true;
    }else {
      return false;
    }
    
  }

  void submit(){
    var isPass = checkForm();
    if(isPass){
      String _mnemonic =  MnemonicPhrase.getInstance().createPhrases();
    }
  }
}
