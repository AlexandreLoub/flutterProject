import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/RegisterViewController.dart';
import 'package:project_flutter/Components/AppBarManager.dart';
import 'package:project_flutter/Components/Animations/PushAnimationManager.dart';

class AnimatedLoginProcess extends StatefulWidget {
  @override
  _AnimatedLoginProcessState createState() => _AnimatedLoginProcessState();
}

class _AnimatedLoginProcessState extends State<AnimatedLoginProcess> {
  @override
  void initState() {
    super.initState();
    Future<dynamic>.delayed(const Duration(seconds: 6), () {
      pushThisViewWithoutAnimate(context, AppBarManager());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent,
        child: const FlareActor(
          'assets/loader.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'Demo',
        ));
  }
}
