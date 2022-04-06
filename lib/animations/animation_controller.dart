import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trainning/share_widgets/custom_button.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({Key? key}) : super(key: key);

  @override
  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<Color?> animColor;
  late Animation<double> animSize;
  late Animation<double> animPosition;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animController.addStatusListener((status) {
      log(status.toString());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animColor = ColorTween(begin: Colors.yellow, end: Colors.red).animate(
        CurvedAnimation(parent: animController, curve: Curves.bounceIn));
    animSize = Tween(begin: 50.0, end: 100.0)
        .animate(CurvedAnimation(parent: animController, curve: Curves.linear));
    animPosition = Tween(begin: 10.0, end: 300.0)
        .animate(CurvedAnimation(parent: animController, curve: Curves.linear));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'AnimationController',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animController,
            child: const FlutterLogo(),
            builder: (context, child) => Transform.scale(
              scale: 1 + animController.value * 3,
              child: child,
            ),
          ),
          64.height,
          SizedBox(
            height: 100,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: animController,
              builder: (context, child) => Container(
                margin: EdgeInsets.only(left: animPosition.value),
                child: Icon(
                  Icons.sunny,
                  size: animSize.value,
                  color: animColor.value,
                ),
              ),
            ),
          ),
          64.height,
          CustomButton(
              label: 'forward', onTap: () => animController.forward(from: 0)),
          8.height,
          CustomButton(
              label: 'reverse', onTap: () => animController.reverse(from: 1)),
          8.height,
          CustomButton(
              label: 'repeat - reverse',
              onTap: () => animController.repeat(reverse: false)),
          8.height,
          CustomButton(
              label: 'repeat & reverse',
              onTap: () => animController.repeat(reverse: true)),
          8.height,
          CustomButton(label: 'stop', onTap: () => animController.stop()),
          8.height,
          CustomButton(label: 'reset', onTap: () => animController.reset()),
        ],
      ),
    );
  }
}
