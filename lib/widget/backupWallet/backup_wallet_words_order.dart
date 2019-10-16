
import 'package:flutter/material.dart';
import 'package:omni/model/backup_mnemonic_prase.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:omni/tools/key_config.dart';
import 'package:omni/widget/login/LoginAndCreate.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupWalletWordsOrder extends StatefulWidget {
  @override
  _BackupWalletWordsOrderState createState() => _BackupWalletWordsOrderState();
}

class _BackupWalletWordsOrderState extends State<BackupWalletWordsOrder> {
  List<WordInfo> words=null;
  int backParentId = null;

  @override
  void initState() {
    super.initState();
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    this.words = BackupMnemonicPhrase().randomSortMnemonicPhrases;
    print(words);
    setState(() {
      
    });
    prefs.then((share){
      this.backParentId = share.getInt(KeyConfig.backParentId);
    });
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
                '确认助记单词',
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
          body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Text('请按顺序点击助记单词，以确认您正确备份。'),
                ),
                new Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: new Wrap(
                    children: resultWordBulid(),
                  ),
                ),
                new Container(
                  child: AnimatedOpacity(
            duration: Duration(milliseconds: 0),
            opacity: showErrorTips?1:0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '順序錯誤',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
                ),
                new Container(
                  child: createWords(),
                ),
                new Container(
                  child: new FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WalletAndAddress()));
                    },
                    padding: EdgeInsets.all(0),
                    child: new Container(
                      child: new Text('完成'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  List<WordInfo> resultWords=[];
  List<Widget> resultWordBulid(){
    List<Widget> results= [];
    for(var item in this.resultWords){
      results.add(
          InkWell(
            onTap: (){
              setState(() {
                resultWords.remove(item);
                item.visible=true;
                checkFinish();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.content,style: TextStyle(color: Colors.black),),
              )
            ),
          )
      );
    }
    return results;
  }
  Function checkFinish(){
    checkResult();
    if(showErrorTips==false&&this.resultWords.length==this.words.length){
      return (){
        Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        prefs.then((share){
          share.remove(KeyConfig.backParentId);

          // User have finished to back up mnimonic.
          share.setBool(KeyConfig.is_backup, true);
        });

        if(this.backParentId !=null&&this.backParentId==1){
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        }else{
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginAndCreate()),
                  (route) => route == null
          );
        }
      };
    }
    return null;
  }

  bool showErrorTips = false;
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

  Widget createWords(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        runSpacing: 5,
        children: wrapChildren(),
      ),
    );
  }

  Function onClickSelectableWord(int index){
    if(this.words[index].visible){
      return (){
        setState(() {
          this.words[index].visible=false;
          this.resultWords.add(this.words[index]);
          checkFinish();
        });
      };
    }else{
      return null;
    }
  }

  List<Widget> wrapChildren(){
    List<Widget> list = [];
    
    for(int i=0;i<this.words.length;i++){
      list.add(
          InkWell(
            onTap: onClickSelectableWord(i),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: this.words[i].visible?Colors.grey:Colors.grey[200]),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 0),
                    opacity: this.words[i].visible?1:0,
                    child: Text(
                      '${this.words[i].content}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
            ),
          )
      );
    }
    print(list.length);
    return list;
  }



}