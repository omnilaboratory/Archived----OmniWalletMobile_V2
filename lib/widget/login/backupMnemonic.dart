import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni/common/mnemonic.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/login/backupMnemonicOrder.dart';

class BackupMnemonic extends StatefulWidget{
  _BackupMnemonicState createState() => new _BackupMnemonicState();
}

class _BackupMnemonicState extends State<BackupMnemonic>{
  Future <SharedPreferences> prefs = SharedPreferences.getInstance();
  List <WordInfo> words = [];
  List<Widget> createWords () {
    // this.words = BackupMnemonicPhrase().mnemonicPhrases;
    if (this.words == null) return [];
    prefs.then((share){
      words = Mnemonic().createNewWords(share.getString('mnemonic'));
      setState(() {
        
      });
    });
    List <Widget> list = [];
    for(int i =0;i<this.words.length;i++){
      list.add(
        Container(
              child: new Padding(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(11),ScreenUtil().setHeight(5),ScreenUtil().setWidth(11),ScreenUtil().setHeight(5)),
                child: RichText(
                  text: TextSpan(
                      text: '${i+1} ',
                      style: TextStyle(
                        color: Color(0xff4a77b7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GothamRnd'
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${this.words[i].content}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GothamRnd',
                            fontSize: 12,
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ]
                  ),
                ),
              )
          )
      );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: new BeforLoginHead(isHome: false,),
            ),
            Positioned(
              bottom: 0,
              child: new Container(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
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
                                  'BACK UP MNEMONIC PHRASE',
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
                        child: new Column(
                          children: <Widget>[
                            new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),left: ScreenUtil().setWidth(25),right: ScreenUtil().setWidth(25)),
                      child: new Text(
                        'Write down or copy these words in the right order and save them somewhere safe.',
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
                      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(7), ScreenUtil().setHeight(15), ScreenUtil().setWidth(7), ScreenUtil().setHeight(15)),
                      decoration: BoxDecoration(
                        color: Color(0xffe0e4ed),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: new Wrap(
                        children: createWords()
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: new FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (){
                          prefs.then((share){
                            var str = share.getString('mnemonicPhraseString');
                            UtilFunction.copyToClipboard(str);
                            UtilFunction.showToast('Copy success');
                          });
                          
                        },
                        splashColor: Color(0x00ffffff),
                        highlightColor: Color(0x00ffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: new Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(40),
                          decoration: BoxDecoration(
                            color: Color(0xff4a77b7),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: new Center(
                            child: new Text(
                              'COPY',
                              style:new TextStyle(                                
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.5
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                      padding: EdgeInsets.fromLTRB(18, ScreenUtil().setHeight(5), 18, ScreenUtil().setHeight(11)),
                      decoration: BoxDecoration(
                        color: Color(0xffe0f0ea),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            width: ScreenUtil().setWidth(24),
                            child: Image.asset('images/info.png'),
                          ),
                          new Container(
                            child: new Text(
                              'Never share recovery pharse with anyone,store it securely!',
                              textAlign: TextAlign.center,
                              style:new TextStyle(
                                fontSize: 12,
                                height: 1.7,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(96)),
                      child: new FlatButton(
                        splashColor: Color(0x00ffffff),
                        highlightColor: Color(0x00ffffff),
                        onPressed: (){
                          Navigator.push(context, 
                            new MaterialPageRoute(
                              builder: (BuildContext context){
                                return new BackupMnemonicOrder();
                              }
                            ));
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
                                  'NEXT',
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
            )
          
          ],
        ),
      ),
    );
  }
}