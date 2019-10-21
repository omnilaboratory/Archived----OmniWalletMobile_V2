import 'package:scoped_model/scoped_model.dart';

class LocalModel extends Model{
  LocalModel of(context) => ScopedModel.of<LocalModel>(context);
  String language = 'en';
  String loginType = 'login';
  bool isAddressFull = false;
  int dexfaultOpenWallet = 0;
  int defaultOpenAddress;
  String address = '';
  int faqOpenIdx = 0;
  Map<String,Object> userInfo = {
    'userId':'',
    'mnemonic':'',
    'pinCode':'',
    'nickname':'',
    'loginToken':'',
  };
  bool walletIsActive = false;

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
  void changeWalletIsActive(bool isActive){
    walletIsActive = isActive;
    notifyListeners();
  }
  void changeFaqOpenIdx(int idx){
    faqOpenIdx = idx;
    notifyListeners();
  }
}