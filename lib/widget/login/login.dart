import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/myInput.dart';
import 'package:omni/language/language.dart';
import 'package:omni/model/localModel.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  //pinCodeController 的输入框
  TextEditingController controllerPin = new TextEditingController();
  // pinCode聚焦
  FocusNode pinFocus = new FocusNode();

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        print(model.loginType);
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
                          rules: _validatePin,
                          inputController: controllerPin,
                          placeholder: 'PIN CODE',
                          inputFocuse: pinFocus,
                          isPassword: false,
                          errorMsg: '',
                        ),
                      )
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
                        Navigator.pushNamed(context, '/walletAndAddress');
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
}
