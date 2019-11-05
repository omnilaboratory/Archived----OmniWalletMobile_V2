class HttpConst{
  HttpConst._();
  // api base url
  // api基础url
  static const baseUrl = "http://62.234.169.68:8080/walletClient/api";
  // image base url
  // 图片基础URL
  static const imageBaseUrl = "http://62.234.169.68:8080";
  // 创建用户
  // create account
  static const createAccount = "/common/createUser";
  // 恢复用户
  // restore account
  static const restoreAccount = "/common/createUser";
  // 获取默认资产列表
  // get defaykt assetList
  static const getDefautAssetList='/common/getDefautAssetList';
  // 比特币、Usdt和欧元的对美元的实时汇率
  // Real-time exchange rate of Bitcoin, Usdt and Euro against the US dollar
  static String btcAndUsdtExchangeRate='/common/btcAndUsdtExchangeRate';
}