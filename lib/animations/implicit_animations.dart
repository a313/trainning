import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/share_widgets/custom_button.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';
import 'package:trainning/utils/math_util.dart';

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsExampleState createState() =>
      _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  var _width = 120.0;
  var _height = 140.0;
  var _opacity = 1.0;
  var _angle = 0.0;
  final _animationDuration = const Duration(milliseconds: 500);
  late Color _color;
  late double _borderRadius;
  late double _margin;
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = false;
    _color = _randomColor();
    _borderRadius = MathUtil.randomDouble();
    _margin = MathUtil.randomDouble();
  }

  Color _randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'implicit Animations',
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            12.height,
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: getShadow(isOn),
                  ),
                ),
              ),
            ),
            8.height,
            AnimatedOpacity(
              opacity: _opacity,
              duration: _animationDuration,
              child: AnimatedContainer(
                duration: _animationDuration,
                width: _width,
                height: _height,
                transform: Matrix4.identity()..rotateZ(_angle),
                transformAlignment: FractionalOffset.center,
                alignment: Alignment.center,
                margin: EdgeInsets.all(_margin),
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(_borderRadius)),
              ),
            ),
            Column(
              children: [
                Text("$_color"),
                Text("BorderRadius: ${_borderRadius.toStringAsFixed(3)}"),
                Text("Margin: ${_margin.toStringAsFixed(3)}"),
                Text(
                    "Size: ${_width.toStringAsFixed(3)}: ${_height.toStringAsFixed(3)}"),
                Text("Angel: ${_angle.toDegrees.toStringAsFixed(3)}°"),
                Text("Opacity: ${_opacity.toStringAsFixed(3)}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                // crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _color = _randomColor();
                      });
                    },
                    label: 'Color',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _borderRadius = MathUtil.randomDouble();
                      });
                    },
                    label: 'Border',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _margin = MathUtil.randomDouble();
                      });
                    },
                    label: 'Margin',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _width = MathUtil.randomDouble(200);
                        _height = MathUtil.randomDouble(300);
                      });
                    },
                    label: 'Size',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _angle = MathUtil.randomDouble(360).toRadians;
                      });
                    },
                    label: ' Rotate',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _opacity = MathUtil.randomDouble(1);
                      });
                    },
                    label: 'Opacity',
                  ),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _opacity = 1;
                        _width = 120.0;
                        _height = 140.0;
                        _opacity = 1.0;
                        _angle = 0.0;
                        _margin = 0.0;
                      });
                    },
                    label: 'Reset',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getShadow(bool isOn) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    return isOn
        ? [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 3),
              blurRadius: 12,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: color,
              offset: const Offset(-2, -2),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ]
        : [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0.2, .2),
              blurRadius: 1,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: color,
              offset: const Offset(-0.5, -.5),
              blurRadius: 1,
              spreadRadius: 0.5,
            ),
          ];
  }
}
