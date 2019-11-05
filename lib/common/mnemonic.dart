import 'dart:isolate';
import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:omni/common/utilFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Mnemonic{
  static Mnemonic _instance;
  static Uint8List bip39Seed;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Mnemonic getInstance(){
    if(_instance == null){
      _instance = Mnemonic();
    }
    return _instance;
  }
  // 利用bip39创建助记单词
  // Create mnemonic phrase with bip39
  String createPhrases(){
    return bip39.generateMnemonic();
  }
   initBipSeed(String _mnemonic,{Function callback}) async {
    prefs.then((share) async {
      var seed = share.get('mnemonicSeed');
      if(seed!=null){
        var seedStr = seed.toString();
        //兼容没有加密的之前的种子
        if(seedStr.startsWith('[')==false&&seedStr.endsWith(']')==false){
          seedStr = UtilFunction().decryptAes(seedStr);
        }
        seedStr = seedStr.substring(1,seedStr.length-1);
        List<String> seedStrArr = seedStr.split(',');
        List<int> seedArr = [];
        for(int i=0;i<seedStrArr.length;i++){
          seedArr.add(int.parse(seedStrArr[i]));
        }
        Mnemonic.bip39Seed = Uint8List.fromList(seedArr);
      }
      if(Mnemonic.bip39Seed == null){
//        Tools.showToast('data is initing,please wait',toastLength: Toast.LENGTH_LONG);
        print('seed init begin ${DateTime.now()}');
        Mnemonic.bip39Seed = await getSeed(_mnemonic);
        share.setString('mnemonicSeed',UtilFunction().encryptAes(Mnemonic.bip39Seed.toString()));

        print('seed init finish ${DateTime.now()}');
        callback();
      }
    });
  }
  static getSeed(String mnemonic) async{
    final request = ReceivePort();

    await Isolate.spawn(_isolate ,request.sendPort);
    //获取sendPort来发送数据
    final sendPort = await request.first as SendPort;
    //接收消息的ReceivePort
    final answer = ReceivePort();
    //发送数据
    sendPort.send([mnemonic,answer.sendPort]);
    //获得数据并返回
    return answer.first;
  }

  //创建isolate必须要的参数
  static void _isolate(SendPort initialReplyTo){
    final port = ReceivePort();
    //绑定
    initialReplyTo.send(port.sendPort);
    //监听
    port.listen((message){
      //获取数据并解析
      final data = message[0] as String;
      final send = message[1] as SendPort;
      //返回结果
      var seed = bip39.mnemonicToSeed(data.toString());

      send.send(seed);
    });
  }

}