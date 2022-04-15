import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trainning/share_widgets/custom_button.dart';

import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';
import 'package:trainning/utils/math_util.dart';

class TransformExample extends StatefulWidget {
  const TransformExample({Key? key}) : super(key: key);

  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  Offset _offset = Offset.zero;
  Offset _translate = Offset.zero;
  double scaleX = 1, scaleY = 1;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Transform",
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Transform by mouse"),
              Transform(
                transform: Matrix4.identity()
                  ..rotateX(0.01 * _offset.dy)
                  ..rotateY(-0.01 * _offset.dx),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onPanUpdate: (details) =>
                      setState(() => _offset += details.delta),
                  onDoubleTap: () => setState(() => _offset = Offset.zero),
                  child: const FlutterLogo(
                    size: 150,
                  ),
                ),
              ),
              8.height,
              const Text("Transform translate"),
              Transform.translate(
                offset: _translate,
                child: GestureDetector(
                    onPanUpdate: (details) =>
                        setState(() => _translate += details.delta),
                    onPanCancel: () => setState(() => _translate = Offset.zero),
                    child: const FlutterLogo(size: 150)),
              ),
              8.height,
              const Divider(),
              const Text("Scaling in x or y direction"),
              Transform.scale(
                scaleX: scaleX,
                scaleY: scaleY,
                alignment: FractionalOffset.center,
                child: const FlutterLogo(size: 150),
              ),
              CustomButton(
                  label: "scaleX",
                  onTap: () => setState(
                        () => scaleX = MathUtil.randomDouble(3),
                      )),
              8.height,
              CustomButton(
                  label: "scaleY",
                  onTap: () => setState(
                        () => scaleY = MathUtil.randomDouble(3),
                      )),
              20.height,
              const Text("Rotate by Radians"),
              Transform.rotate(
                alignment: FractionalOffset.center,
                angle: angle,
                child: const FlutterLogo(size: 150),
              ),
              CustomButton(
                  label: "Rotate",
                  onTap: () => setState(
                        () => angle = MathUtil.randomDouble(2 * pi),
                      )),
              8.height,
            ],
          ),
        ),
      ),
    );
  }
}
