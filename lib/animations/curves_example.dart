import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/share_widgets/custom_button.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

class CurvesExample extends StatefulWidget {
  const CurvesExample({Key? key}) : super(key: key);

  @override
  _CurvesExampleState createState() => _CurvesExampleState();
}

class _CurvesExampleState extends State<CurvesExample> {
  var _width = 50.0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Animation Curves',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurveDisplay(
                curveName: 'Curves.linear',
                curve: Curves.linear,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.slowMiddle',
                curve: Curves.slowMiddle,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.fastOutSlowIn',
                curve: Curves.fastOutSlowIn,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.bounceIn',
                curve: Curves.bounceIn,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.bounceOut',
                curve: Curves.bounceOut,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.decelerate',
                curve: Curves.decelerate,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.easeInBack',
                curve: Curves.easeInBack,
                width: _width),
            CurveDisplay(
                curveName: 'Curves.easeInCubic',
                curve: Curves.easeInCubic,
                width: _width),
            CurveDisplay(
                curveName: 'Custom Curve',
                curve: const SineCurve(),
                width: _width),
            20.height,
            CustomButton(
              label: 'Animate',
              onTap: () {
                if (_width == 350) {
                  setState(() {
                    _width = 50;
                  });
                } else if (_width == 50) {
                  setState(() {
                    _width = 350;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CurveDisplay extends StatelessWidget {
  const CurveDisplay({
    Key? key,
    required double width,
    required this.curveName,
    required this.curve,
  })  : _width = width,
        super(key: key);

  final double _width;
  final String curveName;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(curveName),
        AnimatedContainer(
          width: _width,
          height: 10,
          curve: curve,
          duration: const Duration(milliseconds: 1500),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

class SineCurve extends Curve {
  const SineCurve({this.count = 3});

  final double count;

  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val;
  }
}
