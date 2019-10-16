import 'package:flutter/material.dart';
import 'package:omni/model/backup_mnemonic_prase.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:omni/widget/backupWallet/backup_wallet_words_order.dart';

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
    this.words = BackupMnemonicPhrase().mnemonicPhrases;
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
                          style: TextStyle(color: Colors.black),
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
                  ),
                  new Container(
                    width: 120,
                    height: 20,
                    child: new FlatButton(
                      onPressed: (){
                        var str = BackupMnemonicPhrase().of(context).mnemonicPhraseString;
                        Tools.copyToClipboard(str);
                        Tools.showToast('copy success');
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                        child: new Text('复制'),
                      ),
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(),
                        new Container(
                          child: new Text(
                            '不要和他人分享你的助记单词，保护好他们'
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    width: 120,
                    height: 20,
                    child: new FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BackupWalletWordsOrder()));
                      },
                      padding: EdgeInsets.all(0),
                      child: new Container(
                        child: new Text('继续'),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}