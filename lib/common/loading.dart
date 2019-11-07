import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      color: Colors.white,
      child: new Container(
        child: new AnimatedLogo(),
      ),
    );
  }
  static void stopLoading(context){
    _AnimatedLogoState.stopLoading(context);
  }
}

class AnimatedLogo extends StatefulWidget {
  _AnimatedLogoState createState() => new _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  static AnimationController controller;
  static Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  static void stopLoading(context){
    controller.stop();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new RotationTransition(
          alignment: Alignment.center,
          turns: controller,
          child: new Container(
            child: new Center(
              child: new Image(
                width: ScreenUtil().setWidth(70),
                height: ScreenUtil().setWidth(70),
                image: AssetImage('images/logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
