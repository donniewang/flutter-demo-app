class Api {
  // static const String HOST = 'https://dev.api.zidepai.com';
  // static const String IMG_HOST = 'https://dev.images.zidepai.com';

  static const String HOST = 'https://api.zidepai.com';
  static const String IMG_HOST = 'https://images.zidepai.com';

  //登录
  static const String LOGIN_URL = HOST + '/pass/xcxLogin';
  // 发送验证码
  static const String SEND_CODE_URL = HOST + '/pass/sendSms';
  // 登录验证账号是否存在
  static const String VALIDATE_ACCOUNT_URL = HOST + '/pass/validateAccount';

  // 首页拍卖推荐--资产包
  static const String RECOMMEND_INDEX_URL = HOST + '/pass/hotAuctionPack';
  // 首页拍卖推荐--单车
  static const String S_RECOMMENDINDEXURL = HOST + '/pass/hotAuctionCar';
  // 拍卖大厅--单车-未登录
  static const String SINGLECARURL = HOST + '/pass/hallAuctionCar';
  // 单车详情--未登录
  static const String SINGLECARDETAILURL = HOST + '/pass/carAuctionDetail';

  static const String HOME_CARURL = HOST + '/pass/preAuctionCar';
}
