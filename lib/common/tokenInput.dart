import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';

class TokenInput extends StatefulWidget{
  final TextEditingController controller;
  final focus;
  final bool isError;
  final bool showLength;
  final String errorMsg;
  final String title;
  final int maxLength;
  TokenInput({Key key,this.controller,this.isError,this.errorMsg,this.focus,this.title,this.showLength,this.maxLength}):super(key:key);
  _TokenInputState createState() => new _TokenInputState();
}

class _TokenInputState extends State <TokenInput>{
   TextEditingController controller;
   var focus;
   bool isError;
   String errorMsg;
   String title;
   int maxLength;
   bool showLength = false;
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    focus = widget.focus;
    if(widget.isError ==null)
    isError = false;
    else
    isError = widget.isError;
    errorMsg = widget.errorMsg;
    title = widget.title;
    maxLength = widget.maxLength;
    if(widget.showLength ==null)
    showLength = false;
    else
    showLength = widget.showLength;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              title,
              style:UtilStyle.tokenTitleFont,
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.15)
                )
              )
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    child: new TextField(
              controller: controller,
              focusNode: focus,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: UtilStyle.tokenInputStyle,
            ),
                  ),
                ),
                showLength?new Container(
                  padding: EdgeInsets.only(left: 20),
                  child: new Text(
                    controller.text.length.toString() + ' / ' + maxLength.toString(),
                    style: controller.text.length>maxLength?UtilStyle.lengthErrorFont:UtilStyle.lengthFont,
                  ),
                ):new Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TokenSelect extends StatefulWidget{
  final String title;
  final List selectList;
  final String selectedValue;
  TokenSelect({Key key,this.title,this.selectList,this.selectedValue}):super(key:key);
  _TokenSelectState createState() => new _TokenSelectState();
}

class _TokenSelectState extends State <TokenSelect>{
   String title;
   List selectList;
   String selectedValue;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    selectList = widget.selectList;
    selectedValue = widget.selectedValue;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              title,
              style:UtilStyle.tokenTitleFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(340),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.15)
                )
              )
            ),
            child: new Container(
              child: new Stack(
                children: <Widget>[
                  Positioned(
                    child: new Container(
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              child: new Text('123456789'),
                            ),
                          ),
                          new Container(
                            child: new Image.asset('images/down.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: new Container(
                      color: Color(0xffffff),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                          new Container(
                            child: new Text('123456789'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}