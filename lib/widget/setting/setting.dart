import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/menu/footMenu.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class Setting extends StatefulWidget {
  _SettingState createState() => new _SettingState();
}

class _SettingState extends State<Setting> with TickerProviderStateMixin {
  AnimationController profileController;
  Animation<double> profileAnimation;

  AnimationController securityController;
  Animation<double> securityAnimation;

  AnimationController preferencesController;
  Animation<double> preferencesAnimation;

  double securityHeight = 400;
  double securityContentHeight = 290;

  double preferencesHeight = 200;
  double preferencesContentHeight = 140;

  bool securityContentIsShow = true;
  bool preferencesContentIsShow = true;

  String nowShow = '';

  @override
  void initState() {
    super.initState();
    profileController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    profileAnimation =
        new Tween(begin: 0.1, end: 1.0).animate(profileController)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    profileController.forward();

    securityController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    securityAnimation =
        new Tween(begin: 0.1, end: 1.0).animate(securityController)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    securityController.forward();

    preferencesController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    preferencesAnimation =
        new Tween(begin: 0.1, end: 1.0).animate(preferencesController)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    preferencesController.forward();
    setState(() {});
  }

  void dispose() {
    super.dispose();
    profileController.dispose();
    securityController.dispose();
    preferencesController.dispose();
  }

  void _showTab(String tab) {
    nowShow = tab;
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
          appBar: new MyBaseBar(
            child: new AfterLoginAppBar(),
          ),
          body: Container(
            color: Color.fromRGBO(70, 116, 182, 0.1),
            width: ScreenUtil().setWidth(376),
            // height: ScreenUtil().setHeight(712),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                  bottom: (profileController.value - 1) * 620,
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44)),
                        color: Color(0XFFF2F4F8),
                        // color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.1),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                            child: new FlatButton(
                              splashColor: Color(0xffF2F4F8),
                              highlightColor: Color(0xffF2F4F8),
                              onPressed: () {
                                this._showTab('profile');
                                securityHeight = 134;
                                securityContentIsShow = false;

                                preferencesHeight = 68;
                                preferencesContentIsShow = false;
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                child: new Text(
                                  'PROFILE',
                                  style: nowShow == 'profile'
                                      ? UtilStyle.tagTitleFontActive
                                      : UtilStyle.tagTitleFont,
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding:
                                EdgeInsets.only(left: 18, right: 18, top: 8),
                            child: new ProfileContent(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new Positioned(
                  bottom: (securityController.value - 1) * securityHeight,
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: securityHeight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44)),
                        color: Color(0XFFF2F4F8),
                        // color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.1),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                            child: new FlatButton(
                              onPressed: () {
                                this._showTab('security');
                                securityHeight = 538;
                                securityContentIsShow = false;

                                preferencesHeight = 68;
                                preferencesContentIsShow = false;
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                child: new Text(
                                  'SECURITY',
                                  style: nowShow == 'security'
                                      ? UtilStyle.tagTitleFontActive
                                      : UtilStyle.tagTitleFont,
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(18, 8, 18, 0),
                            child: Security(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Positioned(
                  bottom: (preferencesController.value - 1) * preferencesHeight,
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: preferencesHeight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44)),
                        color: Color(0XFFF2F4F8),
                        // color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.1),
                              offset: Offset(0, -24),
                              blurRadius: 48)
                        ]),
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                            child: new FlatButton(
                              onPressed: () {
                                this._showTab('preferences');
                                securityHeight = 538;
                                securityContentIsShow = false;

                                preferencesHeight = 470;
                                preferencesContentIsShow = false;
                                setState(() {});
                              },
                              padding: EdgeInsets.all(0),
                              child: new Container(
                                alignment: Alignment.bottomLeft,
                                child: new Text(
                                  'PREFERENCES',
                                  style: nowShow == 'preferences'
                                      ? UtilStyle.tagTitleFontActive
                                      : UtilStyle.tagTitleFont,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileContent extends StatefulWidget {
  _ProfileContentState createState() => new _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  bool emailEnabled = false;
  bool showAlert = false;
  File imageFile;
  int verifiedState = 0;
  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future<Null> _cropImage() async {
    print(imageFile);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      print(imageFile);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: imageFile == null
                              ? AssetImage('images/defaultAvatar.png')
                              : AssetImage(imageFile.path),
                        )),
                    width: 64,
                    height: 64,
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 114,
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(4)),
                    child: new FlatButton(
                      splashColor: Color(0xffF2F4F8),
                      highlightColor: Color(0xffF2F4F8),
                      onPressed: () async {
                        await _pickImage();
                        await _cropImage();
                      },
                      padding: EdgeInsets.all(0),
                      child: new Text(
                        'UPLOAD NEW',
                        style: new TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 28),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      'WALLET ID',
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 12),
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      '43021736-625b-42f3-9b79-21fd0216f00',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 12,
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 28),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: new Container(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'EMAIL ID',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          verifiedState == 0
                              ? new Container(
                                  margin: EdgeInsets.only(left: 6),
                                  width: 60,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1)),
                                  child: Center(
                                    child: new Text(
                                      'VERIFIED',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : (verifiedState == 1
                                  ? new Container(
                                      margin: EdgeInsets.only(left: 6),
                                      width: 72,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xffFF0000))),
                                      child: Center(
                                        child: new Text(
                                          'UNVERIFIED',
                                          style: TextStyle(
                                              color: Color(0xffff0000),
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  : new Container(
                                      margin: EdgeInsets.only(left: 6),
                                      width: 60,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(width: 1)),
                                      child: Center(
                                        child: new Text(
                                          'VERIFIED',
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ))
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    margin: EdgeInsets.only(top: 12),
                    alignment: Alignment.centerLeft,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                  hintText: 'NATE@EXAMPLE.COM',
                                  hintStyle:
                                      TextStyle(color: Color(0xff000000)),
                                  enabled: emailEnabled),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        showAlert
                            ? new Container()
                            : new Container(
                                height: 12,
                                padding: EdgeInsets.all(0),
                                child: new FlatButton(
                                  onPressed: () {
                                    if (!emailEnabled) {
                                      emailEnabled = true;
                                      setState(() {});
                                    } else {
                                      this._updateEmail();
                                    }
                                  },
                                  padding: EdgeInsets.all(0),
                                  child: new Container(
                                    padding: EdgeInsets.all(0),
                                    child: new Text(
                                      emailEnabled ? 'UPDATE' : 'CHANGE',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  showAlert
                      ? new Container(
                          padding: EdgeInsets.all(8),
                          color: Color(0xffffefd8),
                          child: new Text(
                            'WE’VE SENT YOU AN EMAIL TO CONFIRM YOUR NEW ADDRESS: RAE@EXAMPLE.COM. MAKE SURE YOU CLICK THE LINK IN IT!',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                height: 1.4,
                                color: Color.fromRGBO(0, 0, 0, 0.75)),
                          ),
                        )
                      : new Container()
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // update user email address
  void _updateEmail() {
    emailEnabled = false;
    showAlert = true;
    verifiedState = 1;
    setState(() {});
  }
}

class Security extends StatefulWidget {
  _SecurityState createState() => new _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'MULTIFACTOR AUTHENTICATION (MFA)',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Container(
                            width: 24,
                            child: Image.asset('images/alertInfo.png'),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      width: 82,
                      height: 32,
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: new Container(
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                            child: new Text(
                              'ENABLE',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 24),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'CHANGE PASSWORD',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: 150,
                      height: 32,
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: new Container(
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0),
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                            child: new Text(
                              'CHANGE PASSWORD',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
