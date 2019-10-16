import 'package:scoped_model/scoped_model.dart';

class LocalModel extends Model{
  LocalModel of(context) => ScopedModel.of<LocalModel>(context);
  String language = 'cn';
  String loginType = 'login';
  bool isAddressFull = false;
  int dexfaultOpenWallet = 0;
  int defaultOpenAddress;
  String address = '';
  Map<String,Object> userInfo = {
    'userId':'',
    'mnemonic':'',
    'pinCode':'',
    'nickname':'',
    'loginToken':'',
  };

  void changeLang (String lang){
    language = lang;
    notifyListeners();
  }
  void changeLoginType (String type){
    loginType = type;
    notifyListeners();
  }
  void changeIsAddressFull (bool isFull){
    isAddressFull = isFull;
    notifyListeners();
  }
  void changeOpenWallet (int idx){
    dexfaultOpenWallet = idx;
    notifyListeners();
  }
  void changeOpenAddress (int idx){
    defaultOpenAddress = idx;
    notifyListeners();
  }
  void changeAddress(String addr){
    address = addr;
    notifyListeners();
  }
}