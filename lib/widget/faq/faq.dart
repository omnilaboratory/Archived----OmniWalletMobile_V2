import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/menu/footMenu.dart';

class Faq extends StatefulWidget{
  _FaqState createState() => new _FaqState();
}

class _FaqState extends State<Faq>{
  List<Map<String,Object>>faqData=[
    {
      'title':'What is an Address?',
      'content':'A crypto-currency address is like an account at a financial institution. It is a unique identifier that can own digital coins and tokens. People can transfer digital coins and tokens to you by sending them to an address that belongs to you. Everyone is able to see the coins and tokens owned by an address, but you need your address Private Key (see below) in order to send something from that address to another address.'
    },
    {
      'title':'What is a Wallet?',
      'content':'A Wallet is a convenient way for you to organize your crypto-currency addresses. You can think of a Wallet as a portfolio that contains multiple accounts. Each wallet has a Wallet ID. When you create a new wallet we generate a brand new random Wallet ID for you. This ID enables you to login and access your wallet so Please BACKUP/SAVE your Wallet ID and your Wallet Password somewhere safe, but separately. If you lose your Wallet ID or Wallet Password, you could lose the addresses and the funds in them.'
    },
    {
      'title':'What is a Wallet ID?',
      'content':'Your Wallet ID is the way we know which wallet is yours. When you create a new wallet we generate a brand new random Wallet ID for you. You need your Wallet ID to login and access your wallet, so Please BACKUP/SAVE your Wallet ID and your Wallet Password somewhere safe, but separately. If you lose your Wallet ID or Wallet Password, you could lose the addresses and the funds in them.'
    },
    {
      'title':'What is a Multifactor Authentication (MFA)?',
      'content':'Multifactor Authentication (MFA) is a way of adding a 2nd layer of protection to your account login. Using a compatible MFA device, like Google Authenticator, Authy, or similiar, users can scan a QR Code generated from within their wallet to import a preshared private secret. This will allow their MFA device to generate time based tokens that can be used when logging into their account.'
    },
    {
      'title':'What happens if I loose my MFA Device?',
      'content':'When adding a compatible MFA device to your account you are given the option to also record/save the shared secret. Using this secret you can import/restore your MFA credentials on any other compatible MFA device. Note: due to the secure nature of this secret it should be guarded and stored with the same security you would guard your password. If all else fails you can contact the Omniwallet support group for additional options.'
    },
    {
      'title':'Does Omniwallet protect my Wallet?',
      'content':'We take wallet security very seriously. Please see this post on the OmniWallet Wiki for more information.'
    },
    {
      'title':'What are Watch Only Addresses?',
      'content':'An address (in your wallet) which you can track its balances but does not have an associated private key. So your wallet can not create any transactions with it. You only view its balances.'
    },
    {
      'title':'What are Armory Offline Addresses?',
      'content':'An address (in your wallet) which allows you to track your funds and create secure offline transactions. Your offline transaction can then be signed by your offline Armory client providing you the same security of an Armory offline wallet. Take a look at the complete guide on our wiki.'
    },
    {
      'title':'What is a Private Key?',
      'content':"A Private Key is needed to send digital coins or tokens from an address you own. It's used to sign any transaction before it can be broadcast to the network.The private key is the secret key used to generate your Address (Wikipedia).Omniwallet allows you to import your private key in several formats(hex, base64, Wallet Import Format, Wallet Import Format Compressed).The Wallet Import Format(WIF) is probably the most common format and its private key will always start with the number 5. The My Address page displays a little padlock  for addresses with known private keys."
    },
    {
      'title':'How do I Add an Address to my Wallet?',
      'content':"On the 'My Addresses' page of your wallet you can add either a Watch Address or the Private Key for your address. If you add the Private key for your address, you are giving your wallet the ability to manage/create transactions which move your coins that are in that address. If you only add the address as a Watch address, you will have a read-only view of its balances and transaction history."
    },
    {
      'title':'How do I Create a New Address?',
      'content':"Need a new address? On the 'My Addresses' page simply click the 'Create New Address' button and we'll generate a completely new random bitcoin address/private key pair and add it to your wallet. You will be able to use it to send and receive coins immediately. NOTE: Any time you add an address to your wallet you should make sure you backup/export your wallet. If you lose your password/access to your wallet and don't have a backup your funds/coins are GONE and there is nothing we can do to help you retrieve it."
    },
    {
      'title':'How do I Backup My Wallet?',
      'content':"On the 'Overview' page you can export a copy of your wallet from the 'Wallet options' menu. This json file contains every address and private key (if known) for the addresses in your wallet at the time of backup. If you add new addresses to your wallet you should immediately create a new backup, replacing your old backup. See this Knowledge Base article for full details"
    },
    {
      'title':'What is the OmniProtocol Transaction Cost?',
      'content':"All Omni Layer transactions require a service fee in bitcoins in order to be processed and added to the Bitcoin blockchain. At the simplest level an OmniProtocol Transaction is a Bitcoin transaction, just with special data in the output. Omniwallet uses about 0.00002730 BTC (2730 satoshis) for each of these non OP-Return outputs. So in order to send a typical OmniProtocol Transaction, you need 0.00002730 for encoding Omni outputs + a miners fee (Omniwallet currently utilizes a dynamic calculation to determine the most effective mining fee for your transaction based on the current network conditions). In more complex transactions, some of these outputs are part of a multisig output (your sending address is always one of the outputs) part of this cost is recoverable. We are currently working to make redeeming these costs easier for you."
    },
    {
      'title':'How long does it take for an OmniProtocol Transaction to show up in Omniwallet?',
      'content':"When you send an OmniProtocol transaction, it has to be processed on the Bitcoin blockchain and confirmed as a valid transaction. It usually takes about 10 minutes for a transaction to be confirmed once. Omniwallet displays a transaction when it has been confirmed so you can expect to see the transaction in about 5-10 minutes, but that time may vary. The exception to this is if the transaction was sent from Omni. If it was sent from Omni see the Unconfirmed/Pending Transaction Support section below."
    },
    {
      'title':'What is Unconfirmed or Pending Transaction (Tx) Support?',
      'content':"When you broadcast any type of Transaction (Tx) it is received by the Bitcoin network as unconfirmed or pending. Unconfirmed or pending tx are not usable by the reciever until it has recieved at least 1 confirmations (this number varies by software). Typically a wallet or another user will have no knowledge about this tx until it recieves at least one confirmation on the network. Every tx that Omni sends is recorded in our DB so we can display realtime updates about your balances. If you send a tx from Omni you will notice your balance decreases in Omni immediately and a new icon  appears next to the address balance. This icon indicates you have a pending tx that has affected your overall usable balance. On the corresponding side, when an Omni user sends another Omni user something, the reciever will see a new icon  and the unconfirmed amount under their address balance. Once confirmed this will be added to their usable balance and the unconfirmed line will disappear."
    },
    {
      'title':'How do I Receive Coins?',
      'content':"After you sign in to your wallet you may notice only a Bitcoin address displayed. All OmniProtocol Properties (coins) work with any Bitcoin address where you control the private key. So to receive any OmniProtocol Property simply provide a Bitcoin address from your Omniwallet to the remote sender. Once their send transaction has confirmed on the blockchain your updated balance will display within your wallet."
    },
    {
      'title':'How do I Send Coins?',
      'content':"After you sign in to your wallet, click the 'Send' link in the left sidebar to send coins from an address that has a private key in your wallet (see Private Keys above)."
    },
    {
      'title':'(DEx) How do I Sell Coins?',
      'content':"Just like buying coins, you can sell your coins. On the Trade page click 'Start new Sale Offer'. Choose the type of coin to sell and the address you.re selling from. Set a price per coin, payment time frame and buyer.s fee. Confirm the information and create your sale. If your sale is accepted/valid the number of coins you put up for sale will be reserved from your available balance until it is sold."
    },
  ];

  List<Widget> buildFaqList(){
    List<Widget> listUI = [];
    for (var i =0;i<faqData.length;i++){
      listUI.add(FaqItem(data:faqData[i],idx:i));
    }
    return listUI;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return new Scaffold(
          floatingActionButton: new Container(
            width: ScreenUtil().setSp(45),
            height: ScreenUtil().setSp(45),
            child: new FlatButton(
              onPressed: () {
                showDialog<Null>(
                    context: context, 
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new FootMenu();
                    });
              },
              padding: EdgeInsets.all(0),
              child: new Container(
                child: new Image.asset('images/logo.png'),
              ),
            ),
          ),
          appBar: new MyBaseBar(
            child: new AfterLoginFaqAppBar(),
          ),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.07),
            child: new Container(
              // padding: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                color: Color(0xf2f4f8),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(70, 116, 182, 0.01),
                    offset: Offset(0,-24),
                    blurRadius: 48
                  )
                ]
              ),
              child :new SingleChildScrollView(
              child: new Container(
                // color: Color.fromRGBO(70, 116, 182, 0.1),
                child: new Column(
                children: buildFaqList(),
              ),
            ),
              )
            )
              
          )
        );
      },
    );
  }
}

class FaqItem extends StatefulWidget{
  FaqItem({Key key,this.data,this.idx}):super(key:key);

  final Map<String,Object> data;
  final int idx;

  _FaqItemState createState() => new _FaqItemState();
}

class _FaqItemState extends State<FaqItem>{
  Map<String,Object> data;
  int idx;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    idx = widget.idx;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return Container(
          width: ScreenUtil().setWidth(376),
          padding: EdgeInsets.only(top: 16,bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF2F4F8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44),
              topRight: Radius.circular(44),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(70, 116, 182, 0.03),
                              offset: Offset(0, -24),
                              blurRadius: 48)
            ]
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new FlatButton(
                  onPressed: (){
                    model.changeFaqOpenIdx(idx);
                  },
                  padding: EdgeInsets.all(0),
                  child: new Container(
                    padding: EdgeInsets.only(left: 18,right: 18),
                    width: ScreenUtil().setWidth(376),
                child: new Text(
                  data['title'],
                  textAlign: TextAlign.left,
                  style:model.faqOpenIdx==idx?UtilStyle.tagTitleFontActive:UtilStyle.tagTitleFont
                ),
              ),
                ),
              ),
              model.faqOpenIdx==idx?new Container(
                padding: EdgeInsets.only(top: 0,left: 18,right: 18),
                child: new Text(
                  data['content'],
                  style: UtilStyle.faqContentFontActive,
                ),
              ):Container()
            ],
          ),
        );
      },
    );
  }
}