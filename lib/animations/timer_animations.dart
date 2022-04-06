import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trainning/utils/base_scaffold.dart';

class TimerAnimationExample extends StatefulWidget {
  const TimerAnimationExample({Key? key}) : super(key: key);

  @override
  _TimerAnimationExampleState createState() => _TimerAnimationExampleState();
}

class _TimerAnimationExampleState extends State<TimerAnimationExample> {
  late double marginTop;
  late Timer timer;

  void changePosition(Timer t) async {
    setState(() {
      marginTop = marginTop == 0 ? 100 : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    marginTop = 0;
    timer = Timer.periodic(const Duration(seconds: 1), changePosition);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Animations using Timer',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: marginTop),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                width: 40.0,
                height: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
