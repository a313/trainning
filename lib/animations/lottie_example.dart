import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trainning/share_widgets/custom_button.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({Key? key}) : super(key: key);

  @override
  State<LottieExample> createState() => _State();
}

class _State extends State<LottieExample> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  CustomButton(
                    label: 'Start',
                    onTap: () {
                      _controller.forward();
                    },
                  ),
                  CustomButton(
                    label: 'End',
                    onTap: () {
                      _controller.reverse();
                    },
                  ),
                  CustomButton(
                    label: 'Repeat',
                    onTap: () {
                      _controller.repeat();
                    },
                  ),
                  CustomButton(
                    label: 'Stop',
                    onTap: () {
                      _controller.stop();
                    },
                  ),
                  CustomButton(
                    label: 'Toggle Switch',
                    onTap: () {
                      if (_controller.value >= 1) {
                        _controller.animateTo(0.5);
                      } else {
                        _controller.animateTo(1);
                      }
                    },
                  ),
                ],
              ),
            ),
            Lottie.asset("assets/lotties/17297-fireworks.json",
                height: 300, controller: _controller),
            16.height,
            Lottie.asset("assets/lotties/CheckSwitch.json",
                width: 100, height: 50, controller: _controller),
            Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_rtihieu4.json",
                width: 300,
                height: 300,
                animate: true,
                repeat: true,
                reverse: true),
          ],
        ),
      ),
      title: 'Lotties',
    );
  }
}
