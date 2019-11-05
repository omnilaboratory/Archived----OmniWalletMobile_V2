import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';


class UtilFunction {
  UtilFunction._();
  static UtilFunction instance;
  static UtilFunction getInstance() {
    if (instance == null) {
      instance = new UtilFunction();
    }
    return instance;
  }
  UtilFunction(){
    UtilFunction._();
  }
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  // format numbers
  static formatCount(c, d) {
    if (c == 0 || c == null) {
      return '0';
    } else {
      String returnStr;
      String str = double.parse(c.toString()).toString();
      // split String by "."
      List<String> sub = str.split('.');
      // deal num
      List val = List.from(sub[0].split(''));
      // deal point
      List<String> ds = List.from(sub[1].split(''));
      
      for (int index = 0, i = val.length - 1;
          index < val.length;
          index++, i--) {
        // deal num by ","
        if (index % 3 == 0 && index != 0) {
          val[i] = val[i] + ',';
        }
      }
      // deal demic
      for (int i = 0; i <= d - ds.length; i++) {
        ds.add('0');
      }
      // if longer than length 
      if (ds.length > d) {
        // sub to array
        ds = ds.sublist(0, d);
      }
      // to know has length
      if (ds.length > 0) {
        returnStr = '${val.join('')}.${ds.join('')}';
      } else {
        returnStr = val.join('');
      }
      if (c < 1) {
        returnStr = returnStr.substring(1);
      }
      return returnStr;
    }
  }
  // Encrypt item in the MD5
  static String convertMD5Str(String data){
    return md5.convert(Utf8Encoder().convert(md5.convert(Utf8Encoder().convert(data)).toString())).toString();
  }
  static showToast(String msg,{Toast toastLength = Toast.LENGTH_SHORT}){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
    );
  }
  encryptAes(String content) {
    prefs.then((share){
      final key = encrypt.Key.fromUtf8(share.get('userInfo').pinCode);
      final iv = encrypt.IV.fromUtf8(share.get('userInfo').userId.substring(0,16));
      final encrypter = encrypt.Encrypter(encrypt.AES(key,mode:encrypt.AESMode.cbc));
      final encrypted = encrypter.encrypt(content, iv: iv);
      return encrypted.base64;
    });
  }

  decryptAes(String encryptedString) {
    prefs.then((share){
      final key = encrypt.Key.fromUtf8(share.get('userInfo').pinCode);
      final iv = encrypt.IV.fromUtf8(share.get('userInfo').userId.substring(0,16));
      final encrypter = encrypt.Encrypter(encrypt.AES(key,mode:encrypt.AESMode.cbc));
      final decrypted = encrypter.decrypt64(encryptedString, iv: iv);
      return decrypted;
    });
  }
}
