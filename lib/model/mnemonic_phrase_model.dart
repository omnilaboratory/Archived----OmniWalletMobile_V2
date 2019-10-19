import 'dart:async';

import 'package:bip39/bip39.dart' as bip39;
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:omni/model/global_model.dart';
import 'package:omni/tools/Tools.dart';
import 'package:omni/tools/key_config.dart';

class MnemonicPhrase{

  static MnemonicPhrase _instance;

   static MnemonicPhrase getInstance(){
    if(_instance==null){
      _instance = MnemonicPhrase();
    }
    return _instance;
  }

  String createPhrases(){
    return bip39.generateMnemonic();
  }
  void initSeed(String phrases){
    if(GlobalInfo.bip39Seed==null){
      GlobalInfo.initBipSeed(phrases);
    }
  }

  HDWallet hdWallet;
  HDWallet createAddress(String phrases,{int index=0}){
    if(GlobalInfo.bip39Seed==null){
      Tools.showToast('address is creating, please wait',toastLength: Toast.LENGTH_LONG);
      GlobalInfo.bip39Seed = bip39.mnemonicToSeed(phrases);
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      prefs.then((share) {
        share.setString(KeyConfig.userMnemonicSeed,GlobalInfo.bip39Seed.toString());
      });
    }
    if(hdWallet==null){
//      hdWallet = HDWallet.fromSeed(GlobalInfo.bip39Seed,network: testnet);
      hdWallet = HDWallet.fromSeed(GlobalInfo.bip39Seed);
    }
    return hdWallet.derivePath("m/44'/0'/0'/0/"+index.toString());
  }
}