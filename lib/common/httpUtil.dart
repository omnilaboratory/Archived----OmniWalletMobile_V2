
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omni/common/httpConst.dart';
import 'package:omni/common/utilFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpUtil{
  static HttpUtil instance;
  static HttpUtil getInstance() {
    if (instance == null) {
      instance = new HttpUtil();
    }
    return instance;
  }
  Dio dio;
  BaseOptions options;
  BuildContext contextTemp;
  String url;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  HttpUtil(){
    options = BaseOptions(
      baseUrl: HttpConst.baseUrl,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 10000,
      headers: {
        'Authorization':'Bearer '
      },
    );
    dio = new Dio(options);
    _addInterceptors();
  }
  _addInterceptors(){
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options){
          if(!url.startsWith('/common')){
            prefs.then((share)async{
              var token = share.getString('token');
              if(token == null){
                UtilFunction.showToast('Please login first');
                return null;
              }
              options.headers['Authorization'] = options.headers['Authorization'] + token;
            });
          }
        },
        onResponse: (Response response){
          if(response.statusCode == 200){
            var result = json.decode(response.data);
            int status = result['status'];
            if(status == 1){
              var data = result['data'];
              return data;
            }else if(status == 0){
              var msg = result['msg'];
              if(msg !=null&&msg.length>0){
                UtilFunction.showToast(msg);
              }
            }
          }
        },
        onError: (DioError e){
          if(e.type == DioErrorType.RECEIVE_TIMEOUT){
            UtilFunction.showToast('timeout, check your network');
          }else if(e.response.statusCode == 403){
            _removeInfos();
          }else {
            UtilFunction.showToast('Server is sleeping, please wait amount and try again!');
          }
          return e.response;
        },
      )
    );
  }
  void _removeInfos(){
    prefs.then((share){
      share.remove('token');
      share.remove('userInfo');
      UtilFunction.showToast('User logout,please login!');
    });
  }

  get(url, {data, options, cancelToken,context}) async {
    contextTemp = context;
    Response response;
    try {
      response = await dio.get(
        url,
        queryParameters: data,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('cancel get request! ' + e.message);
      }
      print('get request error：$e');
    }
    return response.data;
  }

  post(url, {data, options, cancelToken,context}) async {
    print(url);
    contextTemp = context;
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('cancel post request! ' + e.message);
      }
      print('post request error：$e');
    }
    return response.data;
  }
}