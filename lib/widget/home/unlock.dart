import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omni/common/utilFunction.dart';
import 'package:omni/model/state_lib.dart';

class Unlock extends StatefulWidget{
  final parentID; 
  final Function callback;
  Unlock({Key key,this.callback,this.parentID}):super(key:key);
  _UnlockState createState() => new _UnlockState();
}

class _UnlockState extends State<Unlock>{
  Future <SharedPreferences> prefs = SharedPreferences.getInstance();
  List<int> pinCodeArr = [];
  bool isUnlock = false;
  bool isError = false;
  void numberClick(num){
    pinCodeArr.add(num);
    setState(() {
      
    });
    if(pinCodeArr.length==6){
      UtilFunction.showLoading(context);
      String pinCodeArrStr = pinCodeArr.join('');
      print(LocalModel().of(context).userInfo.pinCode);
      prefs.then((share){
        if(UtilFunction.convertMD5Str(pinCodeArrStr)!=share.getString('pinCode')){
        print(pinCodeArrStr);
        isUnlock = false;
        isError = true;
        pinCodeArr = [];
        setState(() {
          
        });
        Navigator.pop(context);
      }else{
        isUnlock = true;
        isError = false;
        LocalModel().of(context).isUnlockSuccessfully = true;
        if (widget.callback != null) { // from send or my page.
          widget.callback();
        } else { // from background
          Navigator.of(context).pop();
        }
        setState(() {
          
        });
        // Navigator.pushNamed(context, '/walletAndAddress');
        Navigator.pop(context);
      }
      });
      
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return Scaffold(
          body: new Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xfff2f4f8),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(50),right: ScreenUtil().setWidth(50)),
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(90)),
                  child: isUnlock?new SvgPicture.asset('svg/unlock.svg'):new SvgPicture.asset('svg/lock.svg'),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: new Text(
                    'PIN Code',
                    style:new TextStyle(
                      fontSize:20,
                    )
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(36)),
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(42),right: ScreenUtil().setWidth(42)),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>0?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>1?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>2?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>3?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>4?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setWidth(12),
                        width: ScreenUtil().setWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                          border: Border.all(color: Color(0xffaaadb9),width: 1.0),
                          color: pinCodeArr.length>5?Color(0xff4a77b7):Color(0xfff2f4f8)
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: new Text(
                        isError?'Your code is wrong,please try again!':'',
                        textAlign: TextAlign.center,
                        style:new TextStyle(
                          color:Colors.red,
                          fontSize:12
                        )
                      ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                  width: ScreenUtil().setWidth(272),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(1);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '1',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(2);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '2',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(3);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '3',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(30),),
                  width: ScreenUtil().setWidth(272),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(4);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '4',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(5);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '5',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(6);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '6',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(30),),
                  width: ScreenUtil().setWidth(272),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(7);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '7',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(8);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '8',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(9);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '9',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(30),),
                  width: ScreenUtil().setWidth(272),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: ScreenUtil().setWidth(64),
                        height: ScreenUtil().setWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xffd9dbe3),
                          borderRadius: new BorderRadius.circular(32)
                        ),
                        child: new FlatButton(
                          onPressed: (){
                            numberClick(0);
                          },
                          splashColor: Color(0xffC4C7D0),
                          highlightColor: Color(0xffC4C7D0),
                          color: Color(0xffd9dbe3),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            child: new Text(
                              '0',
                              style:new TextStyle(
                                fontSize:30,
                                color: Color(0xff949BB7)
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
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
