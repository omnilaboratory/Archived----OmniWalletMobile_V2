import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';

class MyInput extends StatefulWidget {
  final rules;
  final placeholder;
  final isPassword;
  final inputController;
  final inputFocuse;
  final errorMsg;
  final hinText;

  MyInput(
      {Key key,
      this.rules,
      this.placeholder,
      this.inputController,
      this.isPassword,
      this.inputFocuse,
      this.errorMsg,
      this.hinText})
      : super(key: key);
  _MyInputState createState() => new _MyInputState();
}

class _MyInputState extends State<MyInput> {
  Function rules;
  var placeholder;
  var isPassword;
  var inputController;
  var inputFocuse;
  var errorMsg;
  String hinText;
  bool showBorder = false;
  bool isShow = true;
  bool isTrue = false;
  bool isFocus = false;
  int passStrong = 3;
  @override
  void initState() {
    super.initState();
    rules = widget.rules;
    placeholder = widget.placeholder;
    isPassword = widget.isPassword;
    inputController = widget.inputController;
    inputFocuse = widget.inputFocuse;
    errorMsg = widget.errorMsg;
    hinText = widget.hinText;
    inputFocuse.addListener(() {
      if (inputFocuse.hasFocus) {
        isFocus = true;
      } else {
        errorMsg = rules(inputController.text);
        if (errorMsg != '') {
          showBorder = true;
        } else {
          showBorder = false;
        }
        isFocus = false;
      }
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 10),
      height: 40,
      child: new Column(
        children: <Widget>[
          new Container(
              height: ScreenUtil().setHeight(22),
              child: new Row(
                children: <Widget>[
                  new Container(
                    width: ScreenUtil().setWidth(376) - 60,
                    child: new TextField(
                      controller: inputController,
                      focusNode: inputFocuse,
                      textAlign: TextAlign.center,
                      style: UtilStyle.inputStyle,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 0,
                            bottom: 0,
                            left: ScreenUtil().setWidth(74),
                            right: ScreenUtil().setWidth(20)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: hinText,
                        hintStyle: UtilStyle.hintTextFont
                      ),
                    ),
                  ),
                  new Container(
                    width: ScreenUtil().setWidth(24),
                    child: isTrue
                        ? new Image.asset('images/tickBlue.png')
                        : new Container(),
                  )
                ],
              )),
          new Container(
            child: isTrue
                ? new Container()
                : new Container(
                    margin: EdgeInsets.only(top: 3),
                    child: new Text(
                      '$errorMsg',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.red),
                    ),
                  ),
          ),
          new Container(
            child: isPassword
                ? new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new Row(
                            children: <Widget>[
                              passStrong == 0
                                  ? new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.white,
                                    )
                                  : new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.red,
                                    ),
                              passStrong < 2
                                  ? new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.grey,
                                    )
                                  : new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.orange,
                                    ),
                              passStrong < 3
                                  ? new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.grey,
                                    )
                                  : new Container(
                                      width: ScreenUtil().setWidth(32),
                                      height: ScreenUtil().setHeight(3),
                                      color: Colors.green,
                                    ),
                            ],
                          ),
                        ),
                        new Container()
                      ],
                    ),
                  )
                : new Container(),
          )
        ],
      ),
    );
  }
}
