import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/floatButton.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/wallet/address.dart';
import 'package:omni/widget/wallet/wallert.dart';

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
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.1),
            width: ScreenUtil().setWidth(376),
            child: new Container(
              child: Stack(
                children: <Widget>[
                  new Positioned(
                    child: new AfterLoginHead(),
                  ),
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
          floatingActionButton: new FloatButton()
        );
      },
    );
  }
}
