import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni/common/mnemonic.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupMnemonicOrder extends StatefulWidget{
  _BackupMnemonicOrderState createState() => new _BackupMnemonicOrderState();
}

class _BackupMnemonicOrderState extends State<BackupMnemonicOrder>{
  Future <SharedPreferences> prefs = SharedPreferences.getInstance();
  List<WordInfo> words = [];
  bool showErrorTips = false;
  @override
  void initState() {
    creatWords();
    super.initState();
  }
  void checkResult(){
    showErrorTips =false;
    for(var i=0;i<this.resultWords.length;i++){
      var node = this.resultWords[i];
      if(node.seqNum!=i){
        showErrorTips = true;
        break;
      }
    }
  }
  void checkFinish(){
    print(resultWords.length);
    if(resultWords.length <12){
      showErrorTips=true;
      setState(() {
        
      });
    }else{
      checkResult();
    if(showErrorTips==false&&this.resultWords.length==this.words.length){
        prefs.then((share){
          share.remove('backParentId');

          // User have finished to back up mnimonic.
          share.setBool('isBuckup', true);
          LocalModel().of(context).changeIsBackUp(true);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => new WalletAndAddress()),
                (route) => route == null
        );
        });
        
    }
    }
    
  }
  Function onClickSelectableWord(int index){
    if(this.words[index]!=null){
      return (){
        setState(() {
          if(this.words[index].visible){
            this.resultWords.add(this.words[index]);
            this.words[index].visible = false;
            checkResult();
          }
        });
      };
    }else{
      return null;
    }
  }
  List resultWords=[];
  List<Widget> resultWordBulid(){
    List<Widget> results= [];
    for(var item in resultWords){
      results.add(
          InkWell(
            onTap: (){
              setState(() {
                item.visible=true;
                resultWords.remove(item);
                checkResult();
              });
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                        text: item.content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ]
                  ),
                ),
              )
            ),
          )
      );
    }
    return results;
  }
  void creatWords(){
    prefs.then((share){
      this.words = UtilFunction.randomSortMnemonicPhrases(Mnemonic().createNewWords(share.getString('mnemonic')));
      setState(() {
        
      });
    });
  }
  List<Widget> createWords (){
    List <Widget> list = [];
    for(int i =0;i<words.length;i++){
      list.add(
        InkWell(
          onTap: onClickSelectableWord(i),
          child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(5),bottom: ScreenUtil().setHeight(5),right: ScreenUtil().setWidth(7.5)),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffbbc2cd)),
            borderRadius: BorderRadius.circular(18)
          ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10),ScreenUtil().setHeight(7),ScreenUtil().setWidth(10),ScreenUtil().setHeight(7)),
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 0),
                    opacity: words[i].visible?1:0,
                    child: Text(
                      '${words[i].content}',
                      style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GothamRnd',
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                  ),
              )
          ),  
        )
      );
    }
    return list;
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: new BeforLoginHead(isHome: false,),
            ),
            Positioned(
              bottom: 0,
              child: new Container(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(30), left: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(30)),
                height: ScreenUtil().setHeight(692),
                width: ScreenUtil().setWidth(376),
                decoration: new BoxDecoration(
                    color: Color(0xfff2f4f8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(70, 116, 182, 0.10),
                          offset: Offset(0, -24),
                          blurRadius: 48)
                    ]),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: ScreenUtil().setHeight(24),
                      child: new FlatButton(
                        splashColor: Color(0x00ffffff),
                        highlightColor: Color(0x00ffffff),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          height: ScreenUtil().setHeight(24),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              child: new SvgPicture.asset('svg/back.svg'),
                            ),
                            new Expanded(
                              child: new Container(
                                alignment: Alignment.center,
                                child: new Text(
                                  'CONFIRM MNEMONIC PHRASE',
                                  textAlign: TextAlign.center,
                                  style: UtilStyle.titleFont,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),
                    ),
                    new Container(
                      height: ScreenUtil().setHeight(636),
                      child: new SingleChildScrollView(
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: new Text(
                        'Click the following 12-word phrase in exact sequence, to make sure you have a correct backup.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.7,
                            color: Color(0xff000000)),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top:ScreenUtil().setHeight(18)),
                      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(7), 15, ScreenUtil().setWidth(7), 15),
                      decoration: BoxDecoration(
                        color: Color(0xffe0e4ed),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(138),
                      child: new Wrap(
                        children: resultWordBulid(),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 10),
                      child: new Text(
                        showErrorTips?'Invalid order. Try again!':'',
                        style: new TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: new Wrap(
                        children: createWords(),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(122)),
                      child: new FlatButton(
                        splashColor: Color(0x00ffffff),
                        highlightColor: Color(0x00ffffff),
                        onPressed: (){
                          checkFinish();
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(18),
                                child: SvgPicture.asset('svg/arrowUp.svg',width: ScreenUtil().setWidth(18)),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: ScreenUtil().setHeight(21)),
                                child: new Text(
                                  'FINISH',
                                  style:TextStyle(
                                    fontSize:12,
                                    fontWeight:FontWeight.bold,
                                    color:Colors.black,
                                    letterSpacing: 3.5
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}