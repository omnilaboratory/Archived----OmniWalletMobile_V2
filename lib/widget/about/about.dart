import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/menu/footMenu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class About extends StatefulWidget {
  _AboutState createState() => new _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  AnimationController wallletController;
  Animation<double> walletAnimation;

  AnimationController omniController;
  Animation<double> omniAnimation;

  AnimationController contactController;
  Animation<double> contactAnimation;

  double omniHeight = ScreenUtil().setHeight(466);
  double omniContentHeight = ScreenUtil().setHeight(396);

  double contactHeight = ScreenUtil().setHeight(210);
  double contactContentHeight = ScreenUtil().setHeight(140);
  String nowShow = '';
  @override
  void dispose() {
    super.dispose();
    wallletController.dispose();
    omniController.dispose();
    contactController.dispose();
  }

  @override
  void initState() {
    super.initState();
    wallletController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    walletAnimation = new Tween(begin: 0.1, end: 1.0).animate(wallletController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    wallletController.forward();
    omniController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    omniAnimation = new Tween(begin: 0.1, end: 1.0).animate(omniController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    omniController.forward();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return Scaffold(
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
          appBar: MyBaseBar(
            child: AfterLoginAppBar(),
          ),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.02),
            height: ScreenUtil().setHeight(762),
            width: ScreenUtil().setWidth(376),
            child: new Container(
              child: new Stack(
                children: <Widget>[
                  new Positioned(
                    bottom: (wallletController.value - 1) *
                        ScreenUtil().setHeight(702),
                    child: new Container(
                      width: ScreenUtil().setWidth(376),
                      height: ScreenUtil().setHeight(702),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.07),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            height: 68,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(
                                            74, 119, 183, 0.12)))),
                            child: new Container(
                              width: double.infinity,
                              child: new FlatButton(
                                onPressed: () {
                                  contactHeight = 68;
                                  contactContentHeight = 0;
                                  omniHeight = 115;
                                  omniContentHeight = 0;
                                  nowShow = 'wallet';
                                  setState(() {});
                                },
                                padding: EdgeInsets.all(0),
                                splashColor: Color.fromRGBO(242, 244, 248, 1),
                                highlightColor:
                                    Color.fromRGBO(242, 244, 248, 1),
                                child: new Container(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    'about omni wallet'.toUpperCase(),
                                    style: nowShow == 'wallet'
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            height: ScreenUtil().setHeight(500),
                            child: new SingleChildScrollView(
                              child: new Container(
                                child: _buildWalletContent(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    bottom: (omniController.value - 1) * omniHeight,
                    child: new Container(
                      width: ScreenUtil().setWidth(376),
                      height: omniHeight,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.07),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            height: 68,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(
                                            74, 119, 183, 0.12)))),
                            child: new Container(
                              width: double.infinity,
                              child: new FlatButton(
                                onPressed: () {
                                  contactHeight = 68;
                                  contactContentHeight = 0;
                                  omniHeight = ScreenUtil().setHeight(640);
                                  omniContentHeight =
                                      ScreenUtil().setHeight(500);
                                  nowShow = 'omni';
                                  setState(() {});
                                },
                                padding: EdgeInsets.all(0),
                                splashColor: Color.fromRGBO(242, 244, 248, 1),
                                highlightColor:
                                    Color.fromRGBO(242, 244, 248, 1),
                                child: new Container(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    'ABOUT OMNI',
                                    style: nowShow == 'omni'
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            height: omniContentHeight,
                            child: new SingleChildScrollView(
                              child: new Container(
                                child: _buildOmniContent(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    bottom: (wallletController.value - 1) * contactHeight,
                    child: new Container(
                      width: ScreenUtil().setWidth(376),
                      height: contactHeight,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 244, 248, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(70, 116, 182, 0.07),
                                offset: Offset(
                                  ScreenUtil().setSp(0),
                                  ScreenUtil().setSp(-24),
                                ),
                                blurRadius: 48.0,
                                spreadRadius: 2.0),
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            height: 68,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(
                                            74, 119, 183, 0.12)))),
                            child: new Container(
                              width: double.infinity,
                              child: new FlatButton(
                                onPressed: () {
                                  contactHeight = ScreenUtil().setHeight(575);
                                  contactContentHeight =
                                      ScreenUtil().setHeight(500);
                                  omniHeight = ScreenUtil().setHeight(640);
                                  omniContentHeight =
                                      ScreenUtil().setHeight(500);
                                  nowShow = 'contact';
                                  setState(() {});
                                },
                                padding: EdgeInsets.all(0),
                                splashColor: Color.fromRGBO(242, 244, 248, 1),
                                highlightColor:
                                    Color.fromRGBO(242, 244, 248, 1),
                                child: new Container(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    'contact us'.toUpperCase(),
                                    style: nowShow == 'contact'
                                        ? UtilStyle.tagTitleFontActive
                                        : UtilStyle.tagTitleFont,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            height: contactContentHeight,
                            child: new SingleChildScrollView(
                              child: new Container(
                                child: _buildContactContent(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // content for "about omni wallet"
  Widget _buildWalletContent() {
    Widget content;
    content = new Container(
      child: new Column(
        children: <Widget>[
          _buildWalletSecurity(),
          _buildUsability(),
          _buildSupport(),
        ],
      ),
    );
    return content;
  }

  // content for "BEST IN CLASS SECURITY"
  Widget _buildWalletSecurity() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "BEST IN CLASS SECURITY",
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/security.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      '1. Private keys are never sent to the server except in an encrypted form.',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text(
                      '2. Everything is open source from the ground up!',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text(
                      '3. You can deploy the Omniwallet on your own server and host your own instance, or use one of the service providers that will host it for you - your money, your choice',
                      style: UtilStyle.aboutContent),
                )
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for "Baked in usability"
  Widget _buildUsability() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Baked in usability".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/usability.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      '1. No software to download or install, no blockchain to synchronize and verify - it just works, lightning fast',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text(
                      '2. Carefully planned layout, with common operations emphasized',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text('3. Beautiful and intuitive User Interface',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text(
                      '4. Special care is taken to smooth out operational edge cases to prevent mistakes and ensure a painless experience for the user',
                      style: UtilStyle.aboutContent),
                )
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for "Multi-currency support"
  Widget _buildSupport() {
    Widget content;
    content = new Container(
      /* decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(74, 119, 183, 0.12)
          )
        )
      ), */
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Multi-currency support".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/support.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      '1. Omniwallet comes with a pre-built support for Bitcoin, Omni Token and Test Omni Token',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 6),
                  child: new Text(
                      '2. Native support for Smart Property and User-Generated Currencies',
                      style: UtilStyle.aboutContent),
                ),
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for about omni
  Widget _buildOmniContent() {
    Widget content;
    content = new Container(
      child: new Column(
        children: <Widget>[
          _buildOmniFoundation(),
          _buildOmniProtocol(),
          _buildOmnis(),
        ],
      ),
    );
    return content;
  }

  // content for "omni foundation"
  Widget _buildOmniFoundation() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Omni Foundation".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/foundation.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      'In September 2013, the Mastercoin Foundation was formed to temporarily manage the funds in the Exodus Address and the distribution of the development MSC. The board of the Mastercoin Foundation has declared its intention to minimize its temporary central role by transitioning the decision making to Mastercoin owners through proof of stake voting.',
                      style: UtilStyle.aboutContent),
                ),
                new Container(
                    margin: EdgeInsets.only(top: 6),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'In January 2016 the Mastercoin Foundation was rebranded to the Omni Foundation and the primary tokens of the project, MSC, where renamed to Omni Tokens (OMN). The Foundation advocates for the use of the Omni Protocol and tries to build a community of people who develop it. All budget items, board minutes, Dev OMN vesting schedule, and bounties are public record and available to anyone on the ',
                            style: UtilStyle.aboutContent),
                        TextSpan(
                          text: "Foundation's Website",
                          style: UtilStyle.aboutContentLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // _jumpTo('http://UPRETS.io/');
                              print("http://UPRETS.io");
                            },
                        ),
                      ]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for "omni protocol"
  Widget _buildOmniProtocol() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Omni protocol".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/protocol.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(top: 6),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'The Omni Protocol is a communications protocol that uses the Bitcoin block chain to enable features such as smart contracts, user currencies and decentralized peer-to-peer exchanges. A common analogy that is used to describe the relation of the Omni Protocol to Bitcoin is that of HTTP to TCP/IP: HTTP, like the Omni Protocol, is the application layer to the more fundamental transport and internet layer of TCP/IP, like Bitcoin. For more in-depth information and details see the ',
                            style: UtilStyle.aboutContent),
                        TextSpan(
                          text: "Spec",
                          style: UtilStyle.aboutContentLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // _jumpTo('http://UPRETS.io/');
                              print("http://UPRETS.io");
                            },
                        ),
                        TextSpan(
                            text: ' on github', style: UtilStyle.aboutContent),
                      ]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for "omnis"
  Widget _buildOmnis() {
    Widget content;
    content = new Container(
      /* decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(74, 119, 183, 0.12)
          )
        )
      ), */
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Omnis".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/support.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      'Omni Tokens (symbol OMN) are digital tokens that are necessary for the use of some features of the Omni Protocol. The total number of OMNs in existence is 619,478.6 and no more OMN will ever be created. Additionally, OMNs can not be mined into existence. The 619,478.6 OMN were generated as a result of a public fundraiser in the style of Kickstarter.com.',
                      style: UtilStyle.aboutContent),
                ),
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for contact us
  Widget _buildContactContent() {
    Widget content;
    content = new Container(
      child: new Column(
        children: <Widget>[
          _buildGithub(),
          _buildKnowledge(),
          _buildMail(),
        ],
      ),
    );
    return content;
  }

  // content for Github (Bug Reports)
  Widget _buildGithub() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Github (Bug Reports)".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/github.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(top: 6),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Something not working in the wallet properly? Check our 'Open Issues', If you don't see your specific topic open a new issue to let us know. (Please include as many details as possible including ",
                            style: UtilStyle.aboutContent),
                        TextSpan(
                          text: "the output of the developer console",
                          style: UtilStyle.aboutContentLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // _jumpTo('http://UPRETS.io/');
                              print("http://UPRETS.io");
                            },
                        ),
                        TextSpan(text: ")", style: UtilStyle.aboutContent),
                      ]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for Knowledge Base/Support Center
  Widget _buildKnowledge() {
    Widget content;
    content = new Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(74, 119, 183, 0.12)))),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Knowledge Base/Support Center".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/book.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                      'This is a support knowledge base where you can review common topics, questions and answers.',
                      style: UtilStyle.aboutContent),
                ),
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }

  // content for Support Email
  Widget _buildMail() {
    Widget content;
    content = new Container(
      /* decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(74, 119, 183, 0.12)
          )
        )
      ), */
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 32, 18, 32),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "Support Email".toUpperCase(),
              style: UtilStyle.aboutTitle,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new SvgPicture.asset(
              'svg/mail.svg',
              width: 56.3,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 32),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "Not sure how to do something or just need some assistance? Our support team can be reached directly at ",
                        style: UtilStyle.aboutContent),
                    TextSpan(
                      text: "info@omniwallet.org",
                      style: UtilStyle.aboutContentLink,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // _jumpTo('http://UPRETS.io/');
                          print("http://UPRETS.io");
                        },
                    ),
                  ]),
                ))
              ],
            ),
          )
        ],
      ),
    );
    return content;
  }
}
