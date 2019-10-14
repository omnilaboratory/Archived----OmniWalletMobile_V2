import 'package:flutter/material.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';

class BackupWalletWord extends StatefulWidget{
  _BackupWalletWordState createState()=>new _BackupWalletWordState();
}

class _BackupWalletWordState extends State<BackupWalletWord>{
  @override
  void initState() {
    super.initState();
  }
  List<WordInfo> words;
  List<Widget> createWords (){
    if (this.words == null) return [];
    List <Widget> list = [];
    for(int i =0;i<this.words.length;i++){
      list.add(
        Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: '${i+1} ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${this.words[i].content}',
                          style: TextStyle(color: Colors.white),
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
    return ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return new Scaffold(
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(242, 244, 248, 1),
            leading: new Container(
              child: new Image.asset('images/headLogo.png'),
            ),
            title: new Center(
              child: new Text(
                '备份助记单词',
                style: TextStyle(
                  color: Colors.black
                ),
                ),
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/menu.png'),
                onPressed: () {},
              )
            ],
          ),
          body: new SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text('请仔细抄写下方主机单词，我们将在下一步验证'),
                  ),
                  new Container(
                    child: new Wrap(
                      children: createWords()
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}