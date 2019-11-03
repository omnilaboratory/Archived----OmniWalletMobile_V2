import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupMnemonicOrder extends StatefulWidget{
  _BackupMnemonicOrderState createState() => new _BackupMnemonicOrderState();
}

class _BackupMnemonicOrderState extends State<BackupMnemonicOrder>{
  List words = ["wordswordswordswordswordswords","words","words","words","words","words","words","words","words","words","words","words"];
  bool showErrorTips = false;
  void checkResult(){
    showErrorTips =false;
    for(var i=0;i<this.resultWords.length;i++){
      var node = this.resultWords[i];
      /* if(node.seqNum!=i){
        showErrorTips = true;
        break;
      } */
    }
  }
  Function checkFinish(){
    checkResult();
    if(showErrorTips==false&&this.resultWords.length==this.words.length){
      return (){
        Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        prefs.then((share){
          /* share.remove(KeyConfig.backParentId);

          // User have finished to back up mnimonic.
          share.setBool(KeyConfig.isBackup, true); */
        });

        /* if(this.backParentId !=null&&this.backParentId==1){
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        }else{
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginAndCreate()),
                  (route) => route == null
          );
        } */
      };
    }
    return null;
  }
  Function onClickSelectableWord(int index){
    if(this.words[index]!=null){
      return (){
        setState(() {
          this.resultWords.add(this.words[index]);
          this.words[index]='';
          checkFinish();
        });
      };
    }else{
      return null;
    }
  }
  List resultWords=[];
  List<Widget> resultWordBulid(){
    List<Widget> results= [];
    for(var j=0;j<this.resultWords.length;j++){
      results.add(
          InkWell(
            onTap: (){
              setState(() {
                resultWords.remove(resultWords[j]);
                // resultWords[j].visible=true;
                checkFinish();
              });
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                        text: '${j+1} ',
                        style: TextStyle(
                        color: Color(0xff4a77b7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GothamRnd'
                      ),
                      ),
                      new TextSpan(
                        text: resultWords[j],
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
  List<Widget> createWords (){
    // this.words = BackupMnemonicPhrase().mnemonicPhrases;
    if (this.words == null) return [];
    List <Widget> list = [];
    for(int i =0;i<this.words.length;i++){
      list.add(
        InkWell(
          onTap: onClickSelectableWord(i),
          child: Container(
          margin: EdgeInsets.only(top: 5,bottom: 5,right: 7.5),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffbbc2cd)),
            borderRadius: BorderRadius.circular(18)
          ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,7,10,7),
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 0),
                    opacity: this.words[i]!=''?1:0,
                    child: Text(
                      '${this.words[i]}',
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
              child: new BeforLoginHead(),
            ),
            Positioned(
              bottom: 0,
              child: new Container(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
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
                      height: 24,
                      child: new FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          height: 24,
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
                      margin: EdgeInsets.only(top: 20),
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
                      margin: EdgeInsets.only(top:18),
                      padding: EdgeInsets.fromLTRB(7, 15, 7, 15),
                      decoration: BoxDecoration(
                        color: Color(0xffe0e4ed),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      width: double.infinity,
                      height: 138,
                      child: new Wrap(
                        children: resultWordBulid(),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new Wrap(
                        children: createWords(),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 122),
                      child: new FlatButton(
                        splashColor: Color(0xfff2f4f8),
                        highlightColor: Color(0xfff2f4f8),
                        onPressed: (){
                          Navigator.push(context, 
                            new MaterialPageRoute(
                              builder: (BuildContext context){
                                return new WalletAndAddress();
                              }
                            ));
                        },
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                width: 18,
                                child: SvgPicture.asset('svg/arrowUp.svg',width: 18),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 21),
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
            )
          ],
        ),
      ),
    );
  }
}