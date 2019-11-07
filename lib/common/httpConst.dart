class HttpConst{
  HttpConst._();
  static const apiHost='http://62.234.169.68:8080/walletClient/api/';

  static const imageHost='http://62.234.169.68:8080';
  /// 创建新用户
  static const createUser='common/createUser';
  /// 根据助记词恢复用户
  static const restoreUser= 'common/restoreUser';
  /// 图片上传
  static const uploadImage='common/uploadImage';
  /// 获取最新的版本信息
  static const getNewestVersion='common/getNewestVersion';
  /// 获取默认资产列表
  static const getDefautAssetList='common/getDefautAssetList';

  /// user/updateUserFace   更新用户头像
  static const updateUserFace='user/updateUserFace';
  /// 比特币、Usdt和欧元的对美元的实时汇率
  static const btcAndUsdtExchangeRate='common/btcAndUsdtExchangeRate';


  /// 获取用户信息
  static const getUserInfo='user/getUserInfo';

  /// 更新用户pin
  static const updateUserPassword= 'user/updateUserPassword';


  /// wallet/address/getNewestAddressIndex  获取最新的地址索引
  static const getNewestAddressIndex='wallet/address/getNewestAddressIndex';
  /// wallet/address/create  创建新地址
  static const createAddress='wallet/address/create';
  /// wallet/address/list  地址列表
  static const addressList ='wallet/address/list';

  /**
   * wallet/address/getTransactionsByAddress 根据address获取交易记录
   * wallet/address/getTransactionsByAddress?address=1JiSZQDAZ16Qm8BDmNRBWa6AVsJWWeLC2U
  */
  static const getTransactionsByAddress ='wallet/address/getTransactionsByAddress';

  /// wallet/address/getOmniTransactionsByAddress 根据address获取omni交易记录
  static const getOmniTransactionsByAddress ='wallet/address/getOmniTransactionsByAddress';

  /// user/transferAddress/create  创建新的常用转账地址
  static const createTransferAddress='user/transferAddress/edit';
  /// user/transferAddress/list  转账地址列表
  static const transferAddressList ='user/transferAddress/list';
  /// user/transferAddress/delAddress  删除常用转账地址
  static const delAddress ='user/transferAddress/delAddress';

  /// blockChain/sendCmd  发送omni命令
  static const sendCmd ='blockChain/sendCmd';

  /// 获取用户公钥
  static const getUserRSAEncrypt ='user/getUserRSAEncrypt';

  /// Get Popular Asset List
  static const getPopularAssetList ='wallet/asset/getPopularAssetList';

  /// blockChain/btcSend  btc转账
  static const btcSend ='blockChain/btcSend';

  /// blockChain/omniRawTransaction omni原生转账
  static const omniRawTransaction ='blockChain/omniRawTransaction';

  ///
  static const setAddressVisible ='wallet/address/setVisible';

  ///
  static const setAssetVisible ='wallet/asset/setAssetVisible';

  ///
  static const changeAddressName ='wallet/address/changeAddressName';

  ///
  static const updateUserNickname ='user/updateUserNickname';

  /// Add a asset to a wallet address.
  static const addAsset = 'wallet/address/addAsset';

  /// feedback/submit 用户反馈
  static const feedback ='feedback/submit';
  /// common/getVersionList app版本历史
  static const appVersionList ='common/getVersionList';
}