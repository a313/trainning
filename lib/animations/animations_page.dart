import 'package:flutter/material.dart';
import 'package:trainning/animations/curves_example.dart';
import 'package:trainning/animations/hero_animation.dart';
import 'package:trainning/animations/implicit_animations.dart';
import 'package:trainning/animations/lottie_example.dart';
import 'package:trainning/animations/transform.dart';
import 'package:trainning/animations/animation_controller.dart';
import 'package:trainning/animations/transition_example.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

import 'timer_animations.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: "Animations",
        body: ListView(
          children: [
            ListTile(
              onTap: () => context.push(const ImplicitAnimationsExample()),
              title: const Text('ImplicitlyAnimatedWidget'),
              subtitle: const Text(
                  "Là một bộ widget có sẵn của Flutter giúp tạo ra các animation một cách nhanh chóng, các widgets này thường được bắt đầu bằng Animated... .\nChỉ cần thay đổi các giá trị của widget chúng sẽ tự động animate từ giá trị cũ đến giá trị mới giúp bạn."),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const CurvesExample()),
              title: const Text('Curves'),
              subtitle: const Text(
                  "Là một class được sử dụng để điều chỉnh tốc độ thay đổi của animation theo thời gian, cho phép chúng tăng tốc và giảm tốc độ, thay vì di chuyển với tốc độ không đổi.\nXem chi tiết tại https://api.flutter.dev/flutter/animation/Curves-class.html"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const HeroExample()),
              title: const Text('Hero'),
              subtitle: const Text(
                  "Tạo hiệu ứng chuyển cảnh giữa các scene, bao gồm cả chuyển đổi hình dạng"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const TransformExample()),
              title: const Text('Transform'),
              subtitle: const Text(
                  "Là một widget giúp thay đổi cách render widget con"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const TimerAnimationExample()),
              title: const Text('Animation using Timer'),
              subtitle: const Text("Tạo animation bằng Timer"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const AnimationControllerExample()),
              title: const Text('Animation using controller'),
              subtitle: const Text(
                  "Animation Controller tạo ra các giá trị từ 0.0 đến 1.0 trong khoảng thời gian nhất định. Controller tạo ra một giá trị mới bất cứ khi nào device render 1 frame mới.\nAnimationController cần khai báo ở initState và giải phóng ở dispose để tránh việc tràn bộ nhớ"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const TransitionExample()),
              title: const Text('Transition'),
              subtitle: const Text(
                  "Là một bộ widget có sẵn của Flutter giúp tạo ra các animation nhanh chóng, các widget này thường có format dạng xxxTransition.\nKết hợp giữa AnimationController và Tween"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const LottieExample()),
              title: const Text('Lottie'),
              subtitle: const Text(
                  "Tạo animation từ package Lottie. Là package hỗ trợ hiển thị các animation được tạo từ Adobe After Effect. Trang web share files https://lottiefiles.com/"),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.push(const TransitionExample()),
              title: const Text('Rive'),
              subtitle: const Text(
                  "Tạo animation từ package Rive. Hiển thị các animation được tạo bằng Rive"),
            ),
            const Divider(),
          ],
        ));
  }
}
