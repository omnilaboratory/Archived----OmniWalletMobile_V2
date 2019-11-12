import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:omni/common/httpConst.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/home/home.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetConfig{
//  static String apiHost='http://192.168.0.103:8080/api/';
//  static String apiHost='http://172.21.100.248:8080/api/';

  static String apiHost= HttpConst.apiHost;

  static String imageHost=HttpConst.imageHost;
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static post(BuildContext context,String url,Map<String, String> data,{Function errorCallback=null,int timeOut=60,bool showToast =true}) async{
    return _sendData(context,"post", url, data,errorCallback: errorCallback,timeOut: timeOut,showToast: showToast);
  }

  static get(BuildContext context,String url,{Function errorCallback,int timeOut=60,bool showToast =true}) async{
    return _sendData(context,"get", url,null,errorCallback: errorCallback,timeOut: timeOut,showToast: showToast);
  }

  static bool checkData(data){
    if(data!=null&&(data!=408&&data!=600&&data!=404)){
      return true;
    }
    return false;
  }

  static _sendData(BuildContext context,String reqType, String url,Map<String, String> data,{Function errorCallback=null,int timeOut=60,bool showToast =true}) async{
    var loginToken = null;
    var dataEncodeString = 'P@ssw)2d!UPRETSCLIENT';
    Map<String, String> header = new Map();
    if(url.startsWith('common')==false){
      if(LocalModel().of(context).userInfo.loginToken==null){
        UtilFunction.showToast('user have not login');
        return null;
      }
      header['authorization']='Bearer '+ loginToken;
    }

    url = apiHost + url;
    print(url);
    print('seed to server data: $data');
//    showToast('begin get data from server ',toastLength:Toast.LENGTH_LONG);
    Response response = null;
    try{
      if(reqType=="get"){
        response = await http.get(url,headers: header).timeout(Duration(seconds: timeOut));
      }else{
        var dataStr = json.encode(data);
        var dataMD5 = UtilFunction.convertMD5Str(dataStr+dataEncodeString);
        data['dataStr']=dataStr;
        data['dataMD5']=dataMD5;
        print(dataStr);
        print(dataMD5);
        response =  await http.post(url,headers: header, body: data).timeout(Duration(seconds: timeOut));
      }
    } on TimeoutException{
      UtilFunction.showToast('timeout, check your network');
      if(errorCallback!=null){
        errorCallback();
      }
      return 408;
    } on Exception {
      UtilFunction.showToast('check your network');
      if(errorCallback!=null){
        errorCallback();
      }
      return 600;
    }

//    Fluttertoast.cancel();
    print(response.statusCode);
    bool isError = true;
    String msg;
    if(response.statusCode==200){
      var result = json.decode(response.body);
      int status = result['status'];
      print(result);
      if(status==1){
        var data = result['data'];
        isError = false;
        return data;
      }
      if(status==0){
        msg = result['msg'];
        if(msg!=null&&msg.length>0&&showToast){
          UtilFunction.showToast(msg,toastLength:Toast.LENGTH_LONG);
        }
      }
      if(status==403){

      }
    }else if(response.statusCode==403){
      LocalModel().of(context).userInfo = new UserInfo();
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      prefs.then((share) {
        share.clear();
        if(context!=null){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()),
                (route) => route == null,
          );
        }
      });
      UtilFunction.showToast('user logout, please login',toastLength: Toast.LENGTH_LONG);

    } else{
      UtilFunction.showToast('server is sleep, please wait');
    }
    if(errorCallback!=null&&isError){
      errorCallback(msg);
    }
    if(response.statusCode==404){
      return response.statusCode;
    }
    return null;
  }

  static uploadImageFunc(File imageFile,{@required Function callback,Function errorCallback}) async{
    String url = apiHost + HttpConst.uploadImage;
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    bool flag = true;

    if(response.statusCode==200){
      await response.stream.transform(utf8.decoder).listen((data){
        var result = json.decode(data);
        print(data);
        callback(result['data']);
        flag = false;
      });
    }
    if(flag==true && errorCallback!=null){
      errorCallback();
    }
  }

  ///更新用户头像
  static changeUserFace(File imageFile,{@required Function callback,Function errorCallback}) async{
    String url = apiHost + HttpConst.updateUserFace;
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    Map<String, String> header = new Map();
    header['authorization']='Bearer '+ LocalModel().of(context).userInfo.loginToken;
    request.headers.addAll(header);
    var multipartFile = new http.MultipartFile('faceFile', stream, length,filename: basename(imageFile.path));
    request.files.add(multipartFile);

    var response = await request.send();

    bool flag = true;
    if(response.statusCode==200){
      await response.stream.transform(utf8.decoder).listen((data){
        var result = json.decode(data);
        callback(result['data']['faceUrl']);
        flag = false;
      });
    }
    if(flag==true && errorCallback!=null){
      errorCallback();
    }
  }
}