import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:omni/common/mnemonic.dart';
import 'package:omni/model/state_lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo{
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String userId;
  String _mnemonic;
  Uint8List _mnemonicSeed;
  String pinCode;
  String loginToken;
  String faceUrl;
  String nickname;
  UserInfo({
    this.userId,
    this.faceUrl,
    this.nickname
  });

  String get mnemonic{
    return this._mnemonic;
  }

  set mnemonic(String val) {
    this._mnemonic=val;
  }
  Uint8List get mnemonicSeed{
    return this._mnemonicSeed;
  }

  set mnemonicSeed(Uint8List val) {
    this._mnemonicSeed=val;
  }

  void initUserInfo(BuildContext context,Function callback) async{
    prefs.then((share){
      if(share.get('bip39seed') == null){
        Mnemonic().initBipSeed(this._mnemonic,callback: callback);
      }
    });
  }


}
