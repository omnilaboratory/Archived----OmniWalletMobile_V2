import 'package:omni/object/userInfo.dart';
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
  bool walletIsActive = false;
  UserInfo userInfo = new UserInfo();
  bool isLocked = false;
  bool isNeedLock = true;
  int fromParent = null;
  int sleepTime = 5;
  bool isUnlockSuccessfully = true;
  String dataEncodeString= 'P@ssw)2d!UPRETSCLIENT';

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
  void changeIsLocked(bool type){
    isLocked = type;
    notifyListeners();
  }
  void changeIsNeedLock(bool type){
    isNeedLock = type;
    notifyListeners();
  }
  void changeIsUnlockSuccessfully(bool type){
    isUnlockSuccessfully = type;
    notifyListeners();
  }
}