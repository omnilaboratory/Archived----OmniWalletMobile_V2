import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/widget/compnent/myAppBar.dart';
import 'package:omni/widget/menu/footMenu.dart';
import 'package:omni/widget/wallet/address.dart';
import 'package:omni/widget/wallet/wallert.dart';
import 'package:scoped_model/scoped_model.dart';

import 'addressFull.dart';

class WalletAndAddress extends StatefulWidget {
  @override
  _WalletAndAddressState createState() => new _WalletAndAddressState();
}

class _WalletAndAddressState extends State<WalletAndAddress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context, child, model) {
        return new Scaffold(
          appBar: MyBaseBar(
            child: AfterLoginAppBar(),
          ),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.05),
            width: ScreenUtil().setWidth(376),
            child: new Container(
              child: Stack(
                children: <Widget>[
                  new Positioned(
                    bottom: 0,
                    child: new Container(
                      width: ScreenUtil().setWidth(376),
                      height: ScreenUtil().setHeight(702),
                    ),
                  ),
                  new Wallet(),
                  model.isAddressFull ? new AddressFull() : new Address()
                ],
              ),
            ),
          ),
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
        );
      },
    );
  }
}
