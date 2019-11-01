import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/login/backupMnemonicOrder.dart';

class BackupMnemonic extends StatefulWidget{
  _BackupMnemonicState createState() => new _BackupMnemonicState();
}

class _BackupMnemonicState extends State<BackupMnemonic>{
  List words = ["wordswordswordswordswordswords","words","words","words","words","words","words","words","words","words","words","words"];
  List<Widget> createWords (){
    // this.words = BackupMnemonicPhrase().mnemonicPhrases;
    if (this.words == null) return [];
    List <Widget> list = [];
    for(int i =0;i<this.words.length;i++){
      list.add(
        Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11,5,11,5),
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
                          text: '${this.words[i]}',
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
                      margin: EdgeInsets.only(top: 20,left: 25,right: 25),
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
                      margin: EdgeInsets.only(top:18),
                      padding: EdgeInsets.fromLTRB(7, 15, 7, 15),
                      decoration: BoxDecoration(
                        color: Color(0xffe0e4ed),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: new Wrap(
                        children: createWords()
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (){},
                        splashColor: Color(0xff4a77b7),
                        highlightColor:  Color(0xff4a77b7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: new Container(
                          width: 100,
                          height: 40,
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
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.fromLTRB(18, 5, 18, 11),
                      decoration: BoxDecoration(
                        color: Color(0xffe0f0ea),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            width: 24,
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
                      margin: EdgeInsets.only(top: 136),
                      child: new FlatButton(
                        splashColor: Color(0xfff2f4f8),
                        highlightColor: Color(0xfff2f4f8),
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
                                width: 18,
                                child: SvgPicture.asset('svg/arrowUp.svg',width: 18),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 21),
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
    );
  }
}