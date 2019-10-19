import 'package:omni/model/state_lib.dart';
import 'package:omni/object/wordInfo.dart';
import 'package:scoped_model/scoped_model.dart';

class BackupMnemonicPhrase extends Model{
  BackupMnemonicPhrase of(context) => ScopedModel.of<BackupMnemonicPhrase>(context);

  List<WordInfo> wordList=[];

  List<WordInfo> createNewWords(String mnemonic){
    if(this.wordList!=null){
      this.wordList.clear();
    }else{
      this.wordList = [];
    }

    List<String> list = mnemonic.split(' ');
    for(int count=0;count<list.length;count++){
      this.wordList.add(WordInfo(content: list[count],seqNum: count));
    }
    return this.wordList;
  }

  List<WordInfo> get mnemonicPhrases{
    createNewWords(GlobalInfo.userInfo.mnemonic);
    return this.wordList;
  }

  List<WordInfo> get randomSortMnemonicPhrases{
    createNewWords(GlobalInfo.userInfo.mnemonic);
    var temp = this.wordList.sublist(0);
    for(var item in temp){
      item.visible=true;
    }
    temp.shuffle();
    return temp;
  }

  String get mnemonicPhraseString{
    String result = '';
    if(this.wordList==null){
      return result;
    }
    for(int i=0;i<this.wordList.length;i++){
      result += this.wordList[i].content+' ';
    }
    result = result.substring(0,result.length-1);
    return result;
  }

}