import 'dart:async';

import 'package:omni/widget/home/unlock.dart';
import 'package:omni/widget/login/backupWallet.dart';

import 'model/state_lib.dart';
import 'package:flutter/services.dart';

import 'package:omni/widget/faq/faq.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/setting/mfaEnable.dart';
import 'package:omni/widget/token/tokenHome.dart';
import 'package:omni/widget/setting/setting.dart';
import 'package:omni/widget/wallet/importAddress.dart';
import 'package:omni/widget/wallet/signMessage.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:omni/widget/wallet/walletBackup.dart';
import 'package:omni/widget/wallet/walletImport.dart';
import 'package:omni/widget/home/home.dart';
import 'package:omni/widget/login/LoginAndCreate.dart';
import 'package:omni/widget/exchange/exchange.dart';
import 'package:omni/widget/explorer/explorer.dart';
import 'package:omni/widget/about/about.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget{
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  
  final LocalModel localModel = LocalModel();
  Timer _timer;
  @override
  void initState() {
    prefs.then((share){
      var userInfo = share.get('userInfo');
      if(userInfo!=null){
        LocalModel().of(context).userInfo = userInfo;
      }
      WidgetsBinding.instance.addObserver(this);
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Enter background.
    if (state == AppLifecycleState.paused) {
      
      prefs.then((share){
        print("==> paused -> loginToken = ${share.getString('loginToken')}");
        var loginToken = share.getString('loginToken');
        var isNeedLock = share.getBool('isNeedLock');
        if(isNeedLock==null){
          share.setBool('isNeedLock', true);
        }
        if(loginToken!=null&&isNeedLock==true){
          share.setBool('isLocked', false);
          _timer = Timer(
          Duration(minutes: 5), // Default is 5 mins.
          () {
            print('locked');
            share.setBool('isLocked', true); // will be locked.
            _timer.cancel();
          }
        );
        }
      });
    }

    // Back from background.
    if (state == AppLifecycleState.resumed) {
      // print("==> resumed -> loginToken = ${GlobalInfo.userInfo.loginToken}");
      prefs.then((share){
        var loginToken = share.getString('loginToken');
        var isLocked = share.getBool('isLocked');
        var isUnlockSuccessfully = share.getBool('isUnlockSuccessfully');
        if(loginToken!=null){
          if(isLocked){
            if(isUnlockSuccessfully!=null&&isUnlockSuccessfully!=false){
              routeObserver.navigator.push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Unlock();
                  }
                ),
              );
            }else{// from Back up page or Send page.
              // routeObserver.navigator.pop();
              routeObserver.navigator.push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Unlock();
                  }
                ),
              );
            
            }
          }
        }
      });
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<LocalModel>(
      model: localModel,
      child: new MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'GothamRnd'),
        home: new MyHomePage(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginAndCreate(),
          '/walletAndAddress': (BuildContext context) => new WalletAndAddress(),
          '/walletImport': (BuildContext context) => new WalletImport(),
          '/walletBackup': (BuildContext context) => new WalletBackup(),
          '/importAddress': (BuildContext context) => new ImportAddress(),
          '/signMessage': (BuildContext context) => new SignMessage(),
          '/exchange': (BuildContext context) => new Exchange(),
          '/explorer': (BuildContext context) => new Explorer(),
          '/setting': (BuildContext context) => new Setting(),
          '/faq': (BuildContext context) => new Faq(),
          '/about': (BuildContext context) => new About(),
          '/tokenHome': (BuildContext context) => new TokenHome(),
          '/mfa': (BuildContext context) => new MFAEnable(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future <SharedPreferences> prefs = SharedPreferences.getInstance();
  bool isCreate = false;
  bool isBackup = false;
  @override
  void initState() {
    prefs.then((share){
      var loginToken = share.getString('loginToken');
      print(loginToken);
      if(loginToken!=null){
        isCreate = true;
      }
      bool shareIsBackup = share.getBool('isBuckup');
      if(shareIsBackup!=null){
        isBackup = shareIsBackup;
      }
      print(shareIsBackup);
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 376, height: 812, allowFontScaling: true)
          ..init(context);
    // return new Splash();
    return new ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return isCreate?(isBackup?new Unlock():new BackupWalletHome()):new Home();
      },
    );
  }
}
