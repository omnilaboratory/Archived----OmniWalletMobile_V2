import 'package:flutter/material.dart';

class WalletLocalizations{

  final Locale locale;
  WalletLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {

    'zh': {
      'mainIndexTitle': 'Omni Wallet',
      'backupIndexPromptBtn': '知道了',
      'backupIndexTitle': '备份钱包',
      'backupIndexLaterbackup': '稍后备份',
      'backupIndexBtn': '立即备份',
      'backupIndexTipsTitle': '请立即备份您的钱包!',
      'backupIndexTips': '注意：请备份你的钱包账户，Omniwallet 不会访问你的账户、不能恢复私钥、'
          '重置密码。你自己控制自己的钱包和资产安全。',
      'backupIndexPromptTips': '任何人得到你的助记词将能获得你的资产。\n请抄写在纸上妥善保管。',
      'backupIndexPromptTitle': '不要截屏',
      'backupWordsTitle': '备份助记词',
      'backupWordsNext': '继续',
      'backupWordsContent': '请仔细抄写下方助记词，我们将在\n下一步验证。',
      'backupWordsWarn': "不要和他人分享你的助记词，保护好他们",
      'backupWordsOrderTitle': '确认助记词',
      'backupWordsOrderContent': '请按顺序点击助记词，以确认您\n正确备份。',
      'backupWordsOrderError': '顺序错误，重试一次！',
      'backupWordsOrderFinish': '完成',

      'restoreAccountTitle': '恢复已有帐号',
      'restoreAccountPhraseTitle': '请输入助记词',
      'restoreAccountTips': '注意：使用助记词导入账号后，你可以重置PIN码。',
      'restoreAccountResetPIN': '重置PIN码',
      'restoreAccountTipPIN': '新的PIN码',
      'restoreAccountTipOldPIN': '原有PIN码',
      'restoreAccountTipConfirmPIN': '确认PIN码',
      'restoreAccountBtnRestore': '恢复',
      'restoreAccountTipError': '错误PIN码',
      'restoreAccountTipError2': '旧PIN码错误',
      'restoreAccountTipError3': '两个新PIN码不一致',
      'restoreAccountTipError1': '错误助记词',

      'welcomePageOneTitle' : '欢迎加入 Omni 平台！',
      'welcomePageOneContent' : "为了您的安全，请您抽时间来了解一些重要信息。\n\n"
          "如果您访问了钓鱼网站或丢失备份的助记词，我们无法恢复您的资金或冻结您的帐户。\n\n"
          "如您愿意继续使用我们的平台，您同意接受与您助记词损失相关的所有风险。如果您丢失了助记词，"
          "您同意并承认 Omni 平台不会对此造成的负面后果承担责任。",
      'welcomePageOneButton' : '您需要知道的关于助记词的信息',

      'welcomePageTwoTitle' : '您需要知道的关于助记词的信息',
      'welcomePageTwoContentOne' : "注册您的账户时，您要保存您的助记词并使用助记词来保护您的账户。"
          "在普通的中央服务器上，您特别注意密码, 而且您可以通过电子邮件更改和重置密码。然而，Omni 与众不同 — "
          "该钱包安全地储存在您使用的设备上 ：",
      'welcomePageTwoContentTwo' : "您匿名地使用您的钱包，指的是您的账户未连接到电子邮件账户或任何其他识别数据。",
      'welcomePageTwoContentThree' : "用某个设备或浏览器时，您的助记词可以保护您的账户，"
          "为了确保您的助记词不被保存在存储器中。",
      'welcomePageTwoContentFour' : "如果您忘记了PIN码，可以联系我们的客服人员。"
          "但是，如果遗失了助记词，将无法访问您的帐户。",
      'welcomePageTwoContentFive' : "你不能改变你的助记词。如果您不小心将其发送给某人或怀疑诈骗者已将"
          "其移交给他人，请立即创建一个新的 Omni 钱包并将资金转入其中。",
      'welcomePageTwoButtonBack' : '返回',
      'welcomePageTwoButtonNext' : '保护自己',

      'welcomePageThreeTitle' : '如何防止网络钓鱼攻击',
      'welcomePageThreeContentOne' : "诈骗最常见的攻击方式之一是网络钓鱼，一般钓鱼者在Facebook或其他类"
          "似于真实的网站上创建假社群。",
      'welcomePageThreeContentTwo' : "请总是检查URL: https://www.omnilayer.org",
      'welcomePageThreeContentThree' : "访问您的账户时请不要使用具有扩展程序或插件的浏览器。",
      'welcomePageThreeContentFour' : "请不要打开来自未知发件人的电子邮件或链接。",
      'welcomePageThreeContentFive' : "请您定期更新您的浏览器和操作系统。",
      'welcomePageThreeContentSix' : "请您使用官方安全软件。请不要安装会被黑客攻击的未知软件。",
      'welcomePageThreeContentSeven' : "使用公共Wi-Fi或其他人的设备时请勿访问您的钱包。",
      'welcomePageThreeButtonBack' : '返回',
      'welcomePageThreeButtonNext' : '我了解',

      'startPageAppBarTitle' : 'Omni Wallet',
      'startPageButtonFirst' : '开始使用',
      'startPageButtonSecond' : '恢复钱包',
      'startPageLanguageBarTitle' : '多语言',

      'mainPageTitle' : '钱包',
      'commonBtnSkip' : '跳过',
      'commonBtnCopy' : '复制',
      'commonBtnSave': '保存',
      'commonBtnConfirm': '确定',
      'commonTipsInput': '请输入',
      'commonTipsFinish': '提交成功',
      'commonTipsRefresh': '刷新',

      'marketPageAppBarTitle' : '行情',
      'marketPageFav' : '自选',
      'marketPageAll' : '全部',
      'marketPagePrice' : '价格',
      'marketPageChange' : '涨跌幅',

      'myProfilePageMenu1' : '设置',
      'myProfilePageMenu2' : '常用地址管理',
      'myProfilePageMenu3' : '帮助和反馈',
      'myProfilePageMenu4' : '服务条款',
      'myProfilePageMenu5' : '备份钱包',
      'myProfilePageMenu6' : '关于我们',
      'myProfilePageMenu7' : '钱包地址管理',

      'settingsPageTitle' : '设置',
      'settingsPageItem1Title' : '多语言',
      'settingsPageItem2Title' : '货币单位',
      'settingsPageItem3Title' : '颜色主题',

      'helpPageTitle' : '帮助',
      'helpPageItemTitle' : '常见问题',
      'helpPageFeedback' : '提交反馈',

      'feedbackPageTitle' : '提交反馈',
      'feedbackPageInputTitleTooltip' : '标题',
      'feedbackPageContentTooltip' : '内容',
      'feedbackPageEmailTooltip' : '电子邮件',
      'feedbackPageUploadPicTitle' : '上传图片',
      'feedbackPageSubmitButton' : '提交',

      "createNewAddressTitle":"创建新的地址",
      "createNewAddressHint1":"地址名称",
      "createNewAddressAdd":"添加",
      "createNewAddressCancel":"取消",
      "createNewAddressWrongAddress":"请输入地址名称",
      "addressBookTitle":"地址簿",

      'serviceTermsPageAppBarTitle' : '服务条款',

      'aboutPageAppBarTitle' : '关于我们',
      'aboutPageAppName' : 'Omni 钱包',
      'aboutPageItem_1' : '版本日志',
      'aboutPageItem_2' : '官方网站',
      'aboutPageItem_3' : '推特',
      'aboutPageItem_4' : '微信',
      'aboutPageItem_5' : '电报群',
      'aboutPageButton' : '版本更新',

      'userInfoPageAppBarTitle' : '我的身份',
      'userInfoPageItem1Title' : '头像',
      'userInfoPageItem2Title' : '昵称',
      'userInfoPageItem3Title' : '更新PIN码',
      'userInfoPageButton' : '退出当前身份',
      'userInfoPageDeleteMsg' : '即将移除所有钱包数据，请确保所有数据已经备份！',


      'appVersionTitle' : '新版本',
      'appVersionContent1' : '有新的版本了，更新吧',
      'appVersionBtn1' : '以后再说',
      'appVersionBtn2' : '好的',
      'appVersionNoNewerVersion' : '已经是最新的版本',

      'buttomTab1Name' : '钱包',
      'buttomTab2Name' : '市场',
      'buttomTab3Name' : '闪付',
      'buttomTab4Name' : '我的',

      'walletDetailContentSend' : '转账',
      'walletDetailContentReceive' : '收款',
      'walletReceivePageCopy' : '复制',
      'walletReceivePageShare' : '分享',
      'walletReceivePageTipsCopy' : '复制成功',
      'walletReceivePageTipsShare' : '分享成功',
      'walletSendPageTo' : '转到',
      'walletSendPageInputAddressHint' : '请输入地址',
      'walletSendPageInputAddressError' : '地址为空',

      'walletSendConfirmPageDialogTitle' : "转账结果",
      'walletSendConfirmPageDialogBtnOk' : '知道了',

      'walletSendPageTitleAmount' : '数量',
      'walletSendPageTitleBalance' : '余额',
      'walletSendPageInputAmount' : '请输入数量',
      'walletSendPageInputAmountError' : '数量不对',
      'walletSendPageTitleNote' : '备注',
      'walletSendPageInputNote' : '选填',
      'walletSendPageTitleMinerFee' : '矿工费用',
      'walletSendPageTitleMinerFeeInputTitle' : '自定义',

      'walletTradeInfoDetailTitle' : '交易记录详情',
      'walletTradeInfoDetailTitle2' : '转账',
      'walletTradeInfoDetailFinishState1' : '确认中',
      'walletTradeInfoDetailFinishState2' : '已完成',

      'walletTradeInfoDetailItemTo' : '转到',
      'walletTradeInfoDetailItemFrom' : '来自',
      'walletTradeInfoDetailItemMemo' : '备注',
      'walletTradeInfoDetailItemDate' : '时间',
      'walletTradeInfoDetailItemTxid' : '交易ID',
      'walletTradeInfoDetailItemConfirmIndex' : '确认Block',
      'walletTradeInfoDetailItemConfirmCount' : '确认数',

      'languagePageAppBarTitle' : '多语言',
      'languagePageSaveButton' : '保存',

      'createAccountPageAppBarTitle' : '创建新账号',
      'createAccountPageTooltip_1' : '昵称',
      'createAccountPageTooltip_2' : 'PIN码',
      'createAccountPageTooltip_3' : '确认PIN码',
      'createAccountPageTooltip_4' : '输入6位数字保护资产',
      'createAccountPageButton' : '创建',
      'createAccountPageErrMsgEmpty' : '不能为空',
      'createAccountPageErrMsgLength' : '长度不够',
      'createAccountPageErrMsgInconsistent' : '两个PIN码不一致',

      'imagePickerBottomSheet_1' : '从手机相册选择',
      'imagePickerBottomSheet_2' : '拍照',

      'walletAddressPageAppBarTitle' : '钱包地址',
      'walletAddressPageListTitle' : '修改钱包地址名，显示或隐藏钱包地址和资产。',
      'walletAddressPageHidden' : '已隐藏',

      'addressManagePageAppBarTitle' : '钱包地址管理',
      'addressManagePageEditTips' : '新名字',
      'addressManagePageEditButton' : '编辑',
      'addressManagePageDoneButton' : '完成',
      'addressManagePageAddressNameTitle' : '地址名字',
      'addressManagePageAddressDisplayTitle' : '地址显示 / 隐藏',
      'addressManagePageAddressDisplay' : '地址显示',
      'addressManagePageAssetsDisplay' : '资产显示',

      'displayedAssetsPageAppBarTitle' : '资产显示',
      'displayedAssetsPageTitle_1' : '热门资产',
      'displayedAssetsPageTitle_2' : '其它资产',

      'updateNickNamePageAppBarTitle' : '更新昵称',
      'updateNickNamePageEditTips' : '请输入新昵称',

      'currencyPageAppBarTitle' : '货币单位',

      'themePageAppBarTitle' : '颜色主题',
      'themePageItem_1' : '亮色',
      'themePageItem_2' : '暗色',

      'unlockPageAppBarTitle' : '解锁',
      'unlockPageAppTips' : 'PIN码不正确',

      'meAboutAppUpgradeLogTitle' : '版本日志',

      'flashPayMainPageAppBarTitle' : '快速支付',
      'flashPayMainPageAppBarAction' : '记录',
      'flashPayMainPageBalance' : '余额',
      'flashPayMainPageFrozen' : '冻结',
      'flashPayMainPageScan' : '扫一扫',
      'flashPayMainPageFriends' : '好友',
      'flashPayMainPageDeposit' : '充值',
      'flashPayMainPageWithdrawal' : '提现',
      'flashPayMainPageFlashPay' : '转账',
      'flashPayMainPageFlashReceive' : '收款',

      'flashPayUserRegisterTitle' : '快速支付帐号',
      'flashPayUserRegisterInputTitle1' : '邮箱帐号',
      'flashPayUserRegisterBtnName1' : '创建帐号',

      'flashPayDepositPageInputTitle' : '充值金额',
      'flashPayDepositPageRemark_1' : '矿工费: ',
      'flashPayDepositPageRemark_2' : '预计到账时间: 20 ~ 30 分钟',

      'flashPayPaymentMethodPageAppBarTitle' : '充值方式',
      'flashPayPaymentMethodPageMethod_1' : '钱包地址',
      'flashPayPaymentMethodPageMethod_2' : '交易所、其它钱包',
      'flashPayPaymentMethodPageThirdPart' : '第三方充值',
    },

    'en': {
      'mainIndexTitle': 'Omni Wallet',
      'backupIndexPromptBtn': 'I got it',
      'backupIndexTitle': 'Back Up Wallet',
      'backupIndexLaterbackup': 'Later',
      'backupIndexBtn': 'Back Up Now!',
      'backupIndexTipsTitle': 'Back up your wallet now!',
      'backupIndexTips': 'Notice: please back up your wallet, Omni will never visit your '
          'account, can not restore your private key or reset your password. You will manage '
          'your wallet on your own, and make sure the safety of your asset.',
      'backupIndexPromptTips': 'Anyone who gets access to your Mnemonic Phrase will have '
          'access to your assets. Please copy it onto paper and store securely for safekeeping.',
      'backupIndexPromptTitle': "Do Not Use Screenshots!",
      'backupWordsTitle': 'Back Up Mnemonic Phrase',
      'backupWordsNext': 'Next',
      'backupWordsContent': "Write down or copy these words in the right order and save "
          "them somewhere safe.",
      'backupWordsWarn': "Never share recovery phrase with anyone, store it securely!",

      'backupWordsOrderTitle': 'Confirm mnemonic words',
      'backupWordsOrderContent': 'Click the following 12-word phrase in exact sequence, '
          'to make sure you have a correct backup.',
      'backupWordsOrderError': 'Invalid order. Try again!',
      'backupWordsOrderFinish': 'Finish',

      'restoreAccountTitle': 'Restore Account',
      'restoreAccountTips': 'Notice: after importing account by Mnemonic Phrase, you can '
          'reset PIN for safety concerns.',
      'restoreAccountPhraseTitle': 'Input Mnemonic words',
      'restoreAccountResetPIN': 'Reset PIN',
      'restoreAccountTipPIN': 'New PIN',
      'restoreAccountTipOldPIN': 'Old PIN',
      'restoreAccountTipConfirmPIN': 'Confirm PIN',
      'restoreAccountBtnRestore': 'Restore',
      'restoreAccountTipError': 'Wrong PIN input',
      'restoreAccountTipError1': 'Wrong Mnemonic',
      'restoreAccountTipError2': 'Wrong Old PIN input',
      'restoreAccountTipError3': 'New pin and comfirm pin is not same',



      'welcomePageOneTitle' : 'Welcome to the Omni Platform!',
      'welcomePageOneContent' : "Please take some time to understand some "
          "important things for your own safety. \n\nWe cannot recover your "
          "funds or freeze your account if you visit a phishing site or lose "
          "your backup mnemonic phrase.  \n\nBy continuing to use our "
          "platform, you agree to accept all risks associated with the loss of "
          "your mnemonic phrase, including but not limited to the inability to obtain your "
          "funds and dispose of them. In case you lose your mnemonic phrase, you agree and "
          "acknowledge that the Omni Platform would not be responsible for the "
          "negative consequences of this.",
      'welcomePageOneButton' : 'About Mnemonic Phrase',

      'welcomePageTwoTitle' : 'What you need to know \nabout your Mnemonic Phrase',
      'welcomePageTwoContentOne' : "When registering your account, you will be asked "
          "to save your mnemonic phrase and to protect your account with a PIN code. "
          "On normal centralized servers, special attention is paid to the password, which "
          "can be changed and reset via email, if the need arises. However, on decentralized "
          "platforms such as Omni, everything is arranged differently:",
      'welcomePageTwoContentTwo' : "You use your wallet anonymously, meaning your account "
          "is not connected to an email account or any other identifying data.",
      'welcomePageTwoContentThree' : "Your password protects your account when working on "
          "a certain device or browser. It is needed in order to ensure that your secret "
          "mnemonic phrase is not saved in storage.",
      'welcomePageTwoContentFour' : "If you forget your PIN code, you can contact our customer "
          "service staff. If you lose your mnemonic phrase, however, you will have no way to access "
          "your account.",
      'welcomePageTwoContentFive' : "You cannot change your mnemonic phrase. If you "
          "accidentally sent it to someone or suspect that scammers have taken it over, "
          "then create a new Omniwallet immediately and transfer your funds to it.",
      'welcomePageTwoButtonBack' : 'Go Back',
      'welcomePageTwoButtonNext' : 'Protect Yourself',

      'welcomePageThreeTitle' : 'How To Protect Yourself from Phishers',
      'welcomePageThreeContentOne' : "One of the most common forms of scamming is "
          "phishing, which is when scammers create fake communities on Facebook or "
          "other websites that look similar to the authentic ones.",
      'welcomePageThreeContentTwo' : "Always check the URL: https://www.omnilayer.org",
      'welcomePageThreeContentThree' : "Do not use browsers that have extensions or "
          "plugins to access your account.",
      'welcomePageThreeContentFour' : "Do not open emails or links from unknown senders.",
      'welcomePageThreeContentFive' : "Regularly update your browser and operating system.",
      'welcomePageThreeContentSix' : "Use official security software. Do not install "
          "unknown software which could be hacked.",
      'welcomePageThreeContentSeven' : "Do not access your wallet when using public "
          "Wi-Fi or someone else’s device.",
      'welcomePageThreeButtonBack' : 'Go Back',
      'welcomePageThreeButtonNext' : 'I Understand',

      'startPageAppBarTitle' : 'Omni Wallet',
      'startPageButtonFirst' : 'Get Started',
      'startPageButtonSecond' : 'Restore wallet',
      'startPageLanguageBarTitle' : 'Language',

      'mainPageTitle' : 'My Wallet',
      'commonBtnSkip' : 'Skip',
      'commonBtnCopy' : 'Copy',
      'commonBtnSave' : 'Save',
      'commonBtnConfirm' : 'Confirm',
      'commonTipsInput' : 'please input ',
      'commonTipsFinish' : 'submit succuess ',
      'commonTipsRefresh' : 'Refresh',

      'marketPageAppBarTitle' : 'Quotation',
      'marketPageFav' : 'Favorites',
      'marketPageAll' : 'All',
      'marketPagePrice' : 'Price',
      'marketPageChange' : 'Change',

      'myProfilePageMenu1' : 'Settings',
      'myProfilePageMenu2' : 'Address Book',
      'myProfilePageMenu3' : 'Help and Feedback',
      'myProfilePageMenu4' : 'Service Terms',
      'myProfilePageMenu5' : 'Back Up Wallet',
      'myProfilePageMenu6' : 'About US',
      'myProfilePageMenu7' : 'Wallet Address',

      'settingsPageTitle' : 'Settings',
      'settingsPageItem1Title' : 'Languages',
      'settingsPageItem2Title' : 'Currency Unit',
      'settingsPageItem3Title' : 'Color Theme',

      'helpPageTitle' : 'Help',
      'helpPageItemTitle' : 'FAQ',
      'helpPageFeedback' : 'Feedback',

      'feedbackPageTitle' : 'Submit Feedback',
      'feedbackPageInputTitleTooltip' : 'Title',
      'feedbackPageContentTooltip' : 'Content',
      'feedbackPageEmailTooltip' : 'E-mail',
      'feedbackPageUploadPicTitle' : 'Upload Picture',
      'feedbackPageSubmitButton' : 'Submit',

      "createNewAddressTitle":"Create New Address",
      "createNewAddressHint1":"Address Name",
      "createNewAddressAdd":"Add",
      "createNewAddressCancel":"Cancel",
      "createNewAddressWrongAddress":"Please input address name",
      "addressBookTitle":"Address Book",

      'serviceTermsPageAppBarTitle' : 'Service Terms',

      'aboutPageAppBarTitle' : 'About US',
      'aboutPageAppName' : 'Omni Wallet',
      'aboutPageItem_1' : 'Version History',
      'aboutPageItem_2' : 'Website',
      'aboutPageItem_3' : 'Twitter',
      'aboutPageItem_4' : 'Wechat',
      'aboutPageItem_5' : 'Telegram',
      'aboutPageButton' : 'Version Update',

      'userInfoPageAppBarTitle' : 'My Identity',
      'userInfoPageItem1Title' : 'Avatar',
      'userInfoPageItem2Title' : 'Nick Name',
      'userInfoPageItem3Title' : 'Update PIN Code',
      'userInfoPageButton' : 'Logout Current Identity',

      'userInfoPageDeleteMsg' : "All wallet data will be removed, "
          "make sure all data have been backed up already!",

      'appVersionTitle' : 'New version',
      'appVersionContent1' : 'Has a newer version, you should update.',
      'appVersionBtn1' : 'Later',
      'appVersionBtn2' : 'OK',
      'appVersionNoNewerVersion' : 'The version already is latest.',

      'buttomTab1Name' : 'Wallet',
      'buttomTab2Name' : 'Market',
      'buttomTab3Name' : 'Flash Pay',
      'buttomTab4Name' : 'Me',

      'walletDetailContentSend' : 'Send',
      'walletDetailContentReceive' : 'Receive',
      'walletReceivePageCopy' : 'Copy',
      'walletReceivePageShare' : 'Share',
      'walletReceivePageTipsCopy' : 'copy success',
      'walletReceivePageTipsShare' : 'share success',

      'walletSendPageTo' : 'To',
      'walletSendPageInputAddressHint' : 'please input address',
      'walletSendPageInputAddressError' : 'empty address',

      'walletSendConfirmPageDialogTitle' : 'Send Result',
      'walletSendConfirmPageDialogBtnOk' : 'I Know',

      'walletSendPageTitleAmount' : 'Amount',
      'walletSendPageTitleBalance' : 'Balance',
      'walletSendPageInputAmount' : 'please input amount',
      'walletSendPageInputAmountError' : 'wrong amount',
      'walletSendPageTitleNote' : 'Memo',
      'walletSendPageInputNote' : 'Optional',
      'walletSendPageTitleMinerFee' : 'Miner Fee',
      'walletSendPageTitleMinerFeeInputTitle' : 'Custom',

      'walletTradeInfoDetailTitle' : 'Transaction Details',
      'walletTradeInfoDetailTitle2' : 'Sent',
      'walletTradeInfoDetailFinishState1' : 'Unconfirmed',
      'walletTradeInfoDetailFinishState2' : 'Finish',

      'walletTradeInfoDetailItemTo' : 'To',
      'walletTradeInfoDetailItemFrom' : 'From',
      'walletTradeInfoDetailItemMemo' : 'Memo',
      'walletTradeInfoDetailItemDate' : 'Date',
      'walletTradeInfoDetailItemTxid' : 'Transaction Id',
      'walletTradeInfoDetailItemConfirmIndex' : 'Confirmed In Block',
      'walletTradeInfoDetailItemConfirmCount' : 'Confirmations',

      'languagePageAppBarTitle' : 'Languages',
      'languagePageSaveButton' : 'Save',

      'createAccountPageAppBarTitle' : 'Create New Account',
      'createAccountPageTooltip_1' : 'Nick Name',
      'createAccountPageTooltip_2' : 'PIN Code',
      'createAccountPageTooltip_3' : 'Confirm PIN Code',
      'createAccountPageTooltip_4' : '6 numbers to protect your assets.',
      'createAccountPageButton' : 'Create',
      'createAccountPageErrMsgEmpty' : 'Should not be empty',
      'createAccountPageErrMsgLength' : 'Length is not enough',
      'createAccountPageErrMsgInconsistent' : '2 pin codes are inconsistent',

      'imagePickerBottomSheet_1' : 'Choose from Album',
      'imagePickerBottomSheet_2' : 'Take Photo',

      'walletAddressPageAppBarTitle' : 'Wallet Address',
      'walletAddressPageListTitle' : 'Manage wallet address name, assets display.',
      'walletAddressPageHidden' : 'Hiddened',

      'addressManagePageAppBarTitle' : 'Address Management',
      'addressManagePageEditTips' : 'input new name',
      'addressManagePageEditButton' : 'Edit',
      'addressManagePageDoneButton' : 'Done',
      'addressManagePageAddressNameTitle' : 'Address Name',
      'addressManagePageAddressDisplayTitle' : 'Switch Address Display',
      'addressManagePageAddressDisplay' : 'Address Display',
      'addressManagePageAssetsDisplay' : 'Assets Display',

      'displayedAssetsPageAppBarTitle' : 'Display Assets',
      'displayedAssetsPageTitle_1' : 'Popular Assets',
      'displayedAssetsPageTitle_2' : 'Other Assets',

      'updateNickNamePageAppBarTitle' : 'Update Nick Name',
      'updateNickNamePageEditTips' : 'input new nick name',

      'currencyPageAppBarTitle' : 'Currency Unit',

      'themePageAppBarTitle' : 'Color Theme',
      'themePageItem_1' : 'Light',
      'themePageItem_2' : 'Dark',

      'unlockPageAppBarTitle' : 'Unlock App',
      'unlockPageAppTips' : 'PIN Code is incorrect.',

      'meAboutAppUpgradeLogTitle' : 'Version History',

      'flashPayMainPageAppBarTitle' : 'Flash Payment',
      'flashPayMainPageAppBarAction' : 'Records',
      'flashPayMainPageBalance' : 'Balance',
      'flashPayMainPageFrozen' : 'Frozen',
      'flashPayMainPageScan' : 'Scan',
      'flashPayMainPageFriends' : 'Friends',
      'flashPayMainPageDeposit' : 'Deposit',
      'flashPayMainPageWithdrawal' : 'Withdrawal',
      'flashPayMainPageFlashPay' : 'Transfer',
      'flashPayMainPageFlashReceive' : 'Collect',

      'flashPayUserRegisterTitle' : 'Flash Pay Account',
      'flashPayUserRegisterInputTitle1' : 'Account',
      'flashPayUserRegisterBtnName1' : 'Create Account',

      'flashPayDepositPageInputTitle' : 'Deposit Amount',
      'flashPayDepositPageRemark_1' : 'Miner Fee: ',
      'flashPayDepositPageRemark_2' : 'Expected arrival: 20 ~ 30 mins',

      'flashPayPaymentMethodPageAppBarTitle' : 'Payment Method',
      'flashPayPaymentMethodPageMethod_1' : 'Wallet Address',
      'flashPayPaymentMethodPageMethod_2' : 'From Third-Part. Like Exchanges, Other Wallets.',
      'flashPayPaymentMethodPageThirdPart' : 'Deposit from Third-Part',
    }
  };

  // flash pay Payment Method page
  get flashPayPaymentMethodPageAppBarTitle => _localizedValues[locale.languageCode]['flashPayPaymentMethodPageAppBarTitle'];
  get flashPayPaymentMethodPageMethod_1 => _localizedValues[locale.languageCode]['flashPayPaymentMethodPageMethod_1'];
  get flashPayPaymentMethodPageMethod_2 => _localizedValues[locale.languageCode]['flashPayPaymentMethodPageMethod_2'];
  get flashPayPaymentMethodPageThirdPart => _localizedValues[locale.languageCode]['flashPayPaymentMethodPageThirdPart'];

  // flash pay deposit page
  get flashPayDepositPageInputTitle => _localizedValues[locale.languageCode]['flashPayDepositPageInputTitle'];
  get flashPayDepositPageRemark_1 => _localizedValues[locale.languageCode]['flashPayDepositPageRemark_1'];
  get flashPayDepositPageRemark_2 => _localizedValues[locale.languageCode]['flashPayDepositPageRemark_2'];

  // flash pay main page
  get flashPayMainPageAppBarTitle => _localizedValues[locale.languageCode]['flashPayMainPageAppBarTitle'];
  get flashPayMainPageAppBarAction => _localizedValues[locale.languageCode]['flashPayMainPageAppBarAction'];
  get flashPayMainPageBalance => _localizedValues[locale.languageCode]['flashPayMainPageBalance'];
  get flashPayMainPageFrozen => _localizedValues[locale.languageCode]['flashPayMainPageFrozen'];
  get flashPayMainPageScan => _localizedValues[locale.languageCode]['flashPayMainPageScan'];
  get flashPayMainPageFriends => _localizedValues[locale.languageCode]['flashPayMainPageFriends'];
  get flashPayMainPageDeposit => _localizedValues[locale.languageCode]['flashPayMainPageDeposit'];
  get flashPayMainPageWithdrawal => _localizedValues[locale.languageCode]['flashPayMainPageWithdrawal'];
  get flashPayMainPageFlashPay => _localizedValues[locale.languageCode]['flashPayMainPageFlashPay'];
  get flashPayMainPageFlashReceive => _localizedValues[locale.languageCode]['flashPayMainPageFlashReceive'];

  get flashPayUserRegisterTitle => _localizedValues[locale.languageCode]['flashPayUserRegisterTitle'];
  get flashPayUserRegisterInputTitle1 => _localizedValues[locale.languageCode]['flashPayUserRegisterInputTitle1'];
  get flashPayUserRegisterBtnName1 => _localizedValues[locale.languageCode]['flashPayUserRegisterBtnName1'];

  // unlock page
  get unlockPageAppBarTitle => _localizedValues[locale.languageCode]['unlockPageAppBarTitle'];
  get unlockPageAppTips => _localizedValues[locale.languageCode]['unlockPageAppTips'];

  // app theme
  get themePageAppBarTitle => _localizedValues[locale.languageCode]['themePageAppBarTitle'];
  get themePageItem_1 => _localizedValues[locale.languageCode]['themePageItem_1'];
  get themePageItem_2 => _localizedValues[locale.languageCode]['themePageItem_2'];

  // currency unit
  get currencyPageAppBarTitle => _localizedValues[locale.languageCode]['currencyPageAppBarTitle'];

  // Update Nick Name
  get updateNickNamePageAppBarTitle => _localizedValues[locale.languageCode]['updateNickNamePageAppBarTitle'];
  get updateNickNamePageEditTips => _localizedValues[locale.languageCode]['updateNickNamePageEditTips'];

  // Displayed Assets
  get displayedAssetsPageAppBarTitle => _localizedValues[locale.languageCode]['displayedAssetsPageAppBarTitle'];
  get displayedAssetsPageTitle_1 => _localizedValues[locale.languageCode]['displayedAssetsPageTitle_1'];
  get displayedAssetsPageTitle_2 => _localizedValues[locale.languageCode]['displayedAssetsPageTitle_2'];

  // wallet address Page
  get walletAddressPageAppBarTitle => _localizedValues[locale.languageCode]['walletAddressPageAppBarTitle'];
  get walletAddressPageListTitle => _localizedValues[locale.languageCode]['walletAddressPageListTitle'];
  get walletAddressPageHidden => _localizedValues[locale.languageCode]['walletAddressPageHidden'];

  // address management Page
  get addressManagePageAppBarTitle => _localizedValues[locale.languageCode]['addressManagePageAppBarTitle'];
  get addressManagePageEditTips => _localizedValues[locale.languageCode]['addressManagePageEditTips'];
  get addressManagePageEditButton => _localizedValues[locale.languageCode]['addressManagePageEditButton'];
  get addressManagePageDoneButton => _localizedValues[locale.languageCode]['addressManagePageDoneButton'];
  get addressManagePageAddressNameTitle => _localizedValues[locale.languageCode]['addressManagePageAddressNameTitle'];
  get addressManagePageAddressDisplayTitle => _localizedValues[locale.languageCode]['addressManagePageAddressDisplayTitle'];
  get addressManagePageAddressDisplay => _localizedValues[locale.languageCode]['addressManagePageAddressDisplay'];
  get addressManagePageAssetsDisplay => _localizedValues[locale.languageCode]['addressManagePageAssetsDisplay'];

  // create account Page
  get createAccountPageAppBarTitle => _localizedValues[locale.languageCode]['createAccountPageAppBarTitle'];
  get createAccountPageTooltip_1 => _localizedValues[locale.languageCode]['createAccountPageTooltip_1'];
  get createAccountPageTooltip_2 => _localizedValues[locale.languageCode]['createAccountPageTooltip_2'];
  get createAccountPageTooltip_3 => _localizedValues[locale.languageCode]['createAccountPageTooltip_3'];
  get createAccountPageTooltip_4 => _localizedValues[locale.languageCode]['createAccountPageTooltip_4'];
  get createAccountPageButton => _localizedValues[locale.languageCode]['createAccountPageButton'];
  get createAccountPageErrMsgEmpty => _localizedValues[locale.languageCode]['createAccountPageErrMsgEmpty'];
  get createAccountPageErrMsgLength => _localizedValues[locale.languageCode]['createAccountPageErrMsgLength'];
  get createAccountPageErrMsgInconsistent => _localizedValues[locale.languageCode]['createAccountPageErrMsgInconsistent'];

  // Select Language Page
  get languagePageAppBarTitle => _localizedValues[locale.languageCode]['languagePageAppBarTitle'];
  get languagePageSaveButton => _localizedValues[locale.languageCode]['languagePageSaveButton'];

  get walletTradeInfoDetailTitle => _localizedValues[locale.languageCode]['walletTradeInfoDetailTitle'];
  get walletTradeInfoDetailTitle2 => _localizedValues[locale.languageCode]['walletTradeInfoDetailTitle2'];
  get walletTradeInfoDetailFinishState1 => _localizedValues[locale.languageCode]['walletTradeInfoDetailFinishState1'];
  get walletTradeInfoDetailFinishState2 => _localizedValues[locale.languageCode]['walletTradeInfoDetailFinishState2'];

  get walletTradeInfoDetailItemTo => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemTo'];
  get walletTradeInfoDetailItemFrom => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemFrom'];
  get walletTradeInfoDetailItemMemo => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemMemo'];
  get walletTradeInfoDetailItemDate => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemDate'];
  get walletTradeInfoDetailItemTxid => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemTxid'];
  get walletTradeInfoDetailItemConfirmIndex => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemConfirmIndex'];
  get walletTradeInfoDetailItemConfirmCount => _localizedValues[locale.languageCode]['walletTradeInfoDetailItemConfirmCount'];

  get buttomTab1Name => _localizedValues[locale.languageCode]['buttomTab1Name'];
  get buttomTab2Name => _localizedValues[locale.languageCode]['buttomTab2Name'];
  get buttomTab3Name => _localizedValues[locale.languageCode]['buttomTab3Name'];
  get buttomTab4Name => _localizedValues[locale.languageCode]['buttomTab4Name'];

  // User Information page
  get userInfoPageAppBarTitle => _localizedValues[locale.languageCode]['userInfoPageAppBarTitle'];
  get userInfoPageItem1Title => _localizedValues[locale.languageCode]['userInfoPageItem1Title'];
  get userInfoPageItem2Title => _localizedValues[locale.languageCode]['userInfoPageItem2Title'];
  get userInfoPageItem3Title => _localizedValues[locale.languageCode]['userInfoPageItem3Title'];
  get userInfoPageButton => _localizedValues[locale.languageCode]['userInfoPageButton'];
  get userInfoPageDeleteMsg => _localizedValues[locale.languageCode]['userInfoPageDeleteMsg'];


  get appVersionTitle => _localizedValues[locale.languageCode]['appVersionTitle'];
  get appVersionContent1 => _localizedValues[locale.languageCode]['appVersionContent1'];
  get appVersionBtn1 => _localizedValues[locale.languageCode]['appVersionBtn1'];
  get appVersionBtn2 => _localizedValues[locale.languageCode]['appVersionBtn2'];
  get appVersionNoNewerVersion => _localizedValues[locale.languageCode]['appVersionNoNewerVersion'];

  // Service Terms page
  get serviceTermsPageAppBarTitle => _localizedValues[locale.languageCode]['serviceTermsPageAppBarTitle'];

  // About page
  get aboutPageAppBarTitle => _localizedValues[locale.languageCode]['aboutPageAppBarTitle'];
  get aboutPageAppName => _localizedValues[locale.languageCode]['aboutPageAppName'];
  get aboutPageItem_1 => _localizedValues[locale.languageCode]['aboutPageItem_1'];
  get aboutPageItem_2 => _localizedValues[locale.languageCode]['aboutPageItem_2'];
  get aboutPageItem_3 => _localizedValues[locale.languageCode]['aboutPageItem_3'];
  get aboutPageItem_4 => _localizedValues[locale.languageCode]['aboutPageItem_4'];
  get aboutPageItem_5 => _localizedValues[locale.languageCode]['aboutPageItem_5'];
  get aboutPageButton => _localizedValues[locale.languageCode]['aboutPageButton'];

  //wallet page createNewAddress dialog
  get createNewAddressTitle => _localizedValues[locale.languageCode]['createNewAddressTitle'];
  get createNewAddressHint1 => _localizedValues[locale.languageCode]['createNewAddressHint1'];
  get createNewAddressAdd => _localizedValues[locale.languageCode]['createNewAddressAdd'];
  get createNewAddressCancel => _localizedValues[locale.languageCode]['createNewAddressCancel'];
  get createNewAddressWrongAddress => _localizedValues[locale.languageCode]['createNewAddressWrongAddress'];
  get addressBookTitle => _localizedValues[locale.languageCode]['addressBookTitle'];

  // Submit Feedback page
  get feedbackPageTitle => _localizedValues[locale.languageCode]['feedbackPageTitle'];
  get feedbackPageInputTitleTooltip => _localizedValues[locale.languageCode]['feedbackPageInputTitleTooltip'];
  get feedbackPageContentTooltip => _localizedValues[locale.languageCode]['feedbackPageContentTooltip'];
  get feedbackPageEmailTooltip => _localizedValues[locale.languageCode]['feedbackPageEmailTooltip'];
  get feedbackPageUploadPicTitle => _localizedValues[locale.languageCode]['feedbackPageUploadPicTitle'];
  get feedbackPageSubmitButton => _localizedValues[locale.languageCode]['feedbackPageSubmitButton'];
  get imagePickerBottomSheet_1 => _localizedValues[locale.languageCode]['imagePickerBottomSheet_1'];
  get imagePickerBottomSheet_2 => _localizedValues[locale.languageCode]['imagePickerBottomSheet_2'];


  // Help and Feedback page
  get helpPageTitle => _localizedValues[locale.languageCode]['helpPageTitle'];
  get helpPageItemTitle => _localizedValues[locale.languageCode]['helpPageItemTitle'];
  get helpPageFeedback => _localizedValues[locale.languageCode]['helpPageFeedback'];

  // Setting page
  get settingsPageTitle => _localizedValues[locale.languageCode]['settingsPageTitle'];
  get settingsPageItem1Title => _localizedValues[locale.languageCode]['settingsPageItem1Title'];
  get settingsPageItem2Title => _localizedValues[locale.languageCode]['settingsPageItem2Title'];
  get settingsPageItem3Title => _localizedValues[locale.languageCode]['settingsPageItem3Title'];

  // My profile page
  get myProfilePageMenu1 => _localizedValues[locale.languageCode]['myProfilePageMenu1'];
  get myProfilePageMenu2 => _localizedValues[locale.languageCode]['myProfilePageMenu2'];
  get myProfilePageMenu3 => _localizedValues[locale.languageCode]['myProfilePageMenu3'];
  get myProfilePageMenu4 => _localizedValues[locale.languageCode]['myProfilePageMenu4'];
  get myProfilePageMenu5 => _localizedValues[locale.languageCode]['myProfilePageMenu5'];
  get myProfilePageMenu6 => _localizedValues[locale.languageCode]['myProfilePageMenu6'];
  get myProfilePageMenu7 => _localizedValues[locale.languageCode]['myProfilePageMenu7'];

  // Market Page
  get marketPageAppBarTitle => _localizedValues[locale.languageCode]['marketPageAppBarTitle'];
  get marketPageFav => _localizedValues[locale.languageCode]['marketPageFav'];
  get marketPageAll => _localizedValues[locale.languageCode]['marketPageAll'];
  get marketPagePrice => _localizedValues[locale.languageCode]['marketPagePrice'];
  get marketPageChange => _localizedValues[locale.languageCode]['marketPageChange'];

  // Start Page.
  get startPageAppBarTitle => _localizedValues[locale.languageCode]['startPageAppBarTitle'];
  get startPageButtonFirst => _localizedValues[locale.languageCode]['startPageButtonFirst'];
  get startPageButtonSecond => _localizedValues[locale.languageCode]['startPageButtonSecond'];
  get startPageLanguageBarTitle => _localizedValues[locale.languageCode]['startPageLanguageBarTitle'];

  // Welcome Page One.
  get welcomePageOneTitle => _localizedValues[locale.languageCode]['welcomePageOneTitle'];
  get welcomePageOneContent => _localizedValues[locale.languageCode]['welcomePageOneContent'];
  get welcomePageOneButton => _localizedValues[locale.languageCode]['welcomePageOneButton'];

  // Welcome Page Two.
  get welcomePageTwoTitle => _localizedValues[locale.languageCode]['welcomePageTwoTitle'];
  get welcomePageTwoContentOne => _localizedValues[locale.languageCode]['welcomePageTwoContentOne'];
  get welcomePageTwoContentTwo => _localizedValues[locale.languageCode]['welcomePageTwoContentTwo'];
  get welcomePageTwoContentThree => _localizedValues[locale.languageCode]['welcomePageTwoContentThree'];
  get welcomePageTwoContentFour => _localizedValues[locale.languageCode]['welcomePageTwoContentFour'];
  get welcomePageTwoContentFive => _localizedValues[locale.languageCode]['welcomePageTwoContentFive'];
  get welcomePageTwoButtonBack => _localizedValues[locale.languageCode]['welcomePageTwoButtonBack'];
  get welcomePageTwoButtonNext => _localizedValues[locale.languageCode]['welcomePageTwoButtonNext'];

  // Welcome Page Three.
  get welcomePageThreeTitle => _localizedValues[locale.languageCode]['welcomePageThreeTitle'];
  get welcomePageThreeContentOne => _localizedValues[locale.languageCode]['welcomePageThreeContentOne'];
  get welcomePageThreeContentTwo => _localizedValues[locale.languageCode]['welcomePageThreeContentTwo'];
  get welcomePageThreeContentThree => _localizedValues[locale.languageCode]['welcomePageThreeContentThree'];
  get welcomePageThreeContentFour => _localizedValues[locale.languageCode]['welcomePageThreeContentFour'];
  get welcomePageThreeContentFive => _localizedValues[locale.languageCode]['welcomePageThreeContentFive'];
  get welcomePageThreeContentSix => _localizedValues[locale.languageCode]['welcomePageThreeContentSix'];
  get welcomePageThreeContentSeven => _localizedValues[locale.languageCode]['welcomePageThreeContentSeven'];
  get welcomePageThreeButtonBack => _localizedValues[locale.languageCode]['welcomePageThreeButtonBack'];
  get welcomePageThreeButtonNext => _localizedValues[locale.languageCode]['welcomePageThreeButtonNext'];

  get mainIndexTitle => _localizedValues[locale.languageCode]['mainIndexTitle'];

  get backupIndexTitle => _localizedValues[locale.languageCode]['backupIndexTitle'];
  get backupIndexLaterbackup => _localizedValues[locale.languageCode]['backupIndexLaterbackup'];
  get backupIndexTipsTitle => _localizedValues[locale.languageCode]['backupIndexTipsTitle'];
  get backupIndexTips => _localizedValues[locale.languageCode]['backupIndexTips'];
  get backupIndexBtn => _localizedValues[locale.languageCode]['backupIndexBtn'];
  get backupIndexPromptTitle => _localizedValues[locale.languageCode]['backupIndexPromptTitle'];
  get backupIndexPromptTips => _localizedValues[locale.languageCode]['backupIndexPromptTips'];
  get backupIndexPromptBtn => _localizedValues[locale.languageCode]['backupIndexPromptBtn'];

  get restoreAccountTitle => _localizedValues[locale.languageCode]['restoreAccountTitle'];
  get restoreAccountTips => _localizedValues[locale.languageCode]['restoreAccountTips'];
  get restoreAccountPhraseTitle => _localizedValues[locale.languageCode]['restoreAccountPhraseTitle'];
  get restoreAccountResetPIN => _localizedValues[locale.languageCode]['restoreAccountResetPIN'];
  get restoreAccountTipPIN => _localizedValues[locale.languageCode]['restoreAccountTipPIN'];
  get restoreAccountTipOldPIN => _localizedValues[locale.languageCode]['restoreAccountTipOldPIN'];
  get restoreAccountTipConfirmPIN => _localizedValues[locale.languageCode]['restoreAccountTipConfirmPIN'];
  get restoreAccountBtnRestore => _localizedValues[locale.languageCode]['restoreAccountBtnRestore'];
  get restoreAccountTipError => _localizedValues[locale.languageCode]['restoreAccountTipError'];
  get restoreAccountTipError1 => _localizedValues[locale.languageCode]['restoreAccountTipError1'];
  get restoreAccountTipError2 => _localizedValues[locale.languageCode]['restoreAccountTipError2'];
  get restoreAccountTipError3 => _localizedValues[locale.languageCode]['restoreAccountTipError3'];



  get backupWordsTitle => _localizedValues[locale.languageCode]['backupWordsTitle'];
  get backupWordsContent => _localizedValues[locale.languageCode]['backupWordsContent'];
  get backupWordsNext => _localizedValues[locale.languageCode]['backupWordsNext'];
  get backupWordsWarn => _localizedValues[locale.languageCode]['backupWordsWarn'];

  get backupWordsOrderTitle => _localizedValues[locale.languageCode]['backupWordsOrderTitle'];
  get backupWordsOrderContent => _localizedValues[locale.languageCode]['backupWordsOrderContent'];
  get backupWordsOrderError => _localizedValues[locale.languageCode]['backupWordsOrderError'];
  get backupWordsOrderFinish => _localizedValues[locale.languageCode]['backupWordsOrderFinish'];

  String get mainPageTitle => _localizedValues[locale.languageCode]['mainPageTitle'];

  String get commonBtnSkip => _localizedValues[locale.languageCode]['commonBtnSkip'];
  String get commonBtnCopy => _localizedValues[locale.languageCode]['commonBtnCopy'];
  String get commonBtnSave => _localizedValues[locale.languageCode]['commonBtnSave'];
  String get commonBtnConfirm => _localizedValues[locale.languageCode]['commonBtnConfirm'];
  String get commonTipsInput => _localizedValues[locale.languageCode]['commonTipsInput'];
  String get commonTipsFinish => _localizedValues[locale.languageCode]['commonTipsFinish'];
  String get commonTipsRefresh => _localizedValues[locale.languageCode]['commonTipsRefresh'];


  String get walletDetailContentSend => _localizedValues[locale.languageCode]['walletDetailContentSend'];
  String get walletDetailContentReceive => _localizedValues[locale.languageCode]['walletDetailContentReceive'];
  String get walletReceivePageCopy => _localizedValues[locale.languageCode]['walletReceivePageCopy'];
  String get walletReceivePageShare => _localizedValues[locale.languageCode]['walletReceivePageShare'];
  String get walletReceivePageTipsCopy => _localizedValues[locale.languageCode]['walletReceivePageTipsCopy'];
  String get walletReceivePageTipsShare => _localizedValues[locale.languageCode]['walletReceivePageTipsShare'];
  String get walletSendPageTo => _localizedValues[locale.languageCode]['walletSendPageTo'];
  String get walletSendPageInputAddressHint => _localizedValues[locale.languageCode]['walletSendPageInputAddressHint'];
  String get walletSendPageInputAddressError => _localizedValues[locale.languageCode]['walletSendPageInputAddressError'];
  String get walletSendPageTitleAmount => _localizedValues[locale.languageCode]['walletSendPageTitleAmount'];

  String get walletSendConfirmPageDialogTitle => _localizedValues[locale.languageCode]['walletSendConfirmPageDialogTitle'];
  String get walletSendConfirmPageDialogBtnOk => _localizedValues[locale.languageCode]['walletSendConfirmPageDialogBtnOk'];

  String get walletSendPageTitleBalance => _localizedValues[locale.languageCode]['walletSendPageTitleBalance'];
  String get walletSendPageInputAmount => _localizedValues[locale.languageCode]['walletSendPageInputAmount'];
  String get walletSendPageInputAmountError => _localizedValues[locale.languageCode]['walletSendPageInputAmountError'];
  String get walletSendPageTitleNote => _localizedValues[locale.languageCode]['walletSendPageTitleNote'];
  String get walletSendPageInputNote => _localizedValues[locale.languageCode]['walletSendPageInputNote'];
  String get walletSendPageTitleMinerFee => _localizedValues[locale.languageCode]['walletSendPageTitleMinerFee'];
  String get walletSendPageTitleMinerFeeInputTitle => _localizedValues[locale.languageCode]['walletSendPageTitleMinerFeeInputTitle'];

  String get meAboutAppUpgradeLogTitle => _localizedValues[locale.languageCode]['meAboutAppUpgradeLogTitle'];

  static WalletLocalizations of (BuildContext context){
    return Localizations.of(context, WalletLocalizations);
  }
}