import 'package:flutter/material.dart';
import 'package:omni/model/localModel.dart';
import 'package:omni/model/state_lib.dart';
import 'package:omni/widget/compnent/myAppBar.dart';

class Setting extends StatefulWidget{
  _SettingState createState() => new _SettingState();
}

class _SettingState extends State<Setting>{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocalModel>(
      builder: (context,child,model){
        return Scaffold(
          appBar: new MyBaseBar(
            child: AfterLoginAppBar(),
          ),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.07),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                  child: new Container(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}