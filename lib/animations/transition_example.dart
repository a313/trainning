import 'package:flutter/material.dart';
import 'package:trainning/utils/base_scaffold.dart';

class TransitionExample extends StatefulWidget {
  const TransitionExample({Key? key}) : super(key: key);

  @override
  State<TransitionExample> createState() => _State();
}

class _State extends State<TransitionExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.5, 0.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  late final Animation<double> _doubleAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final Animation<AlignmentGeometry> _alignmentAnimation =
      Tween<AlignmentGeometry>(
    begin: Alignment.bottomLeft,
    end: Alignment.center,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green,
            child: SlideTransition(
              position: _offsetAnimation,
              child: const FlutterLogo(size: 150.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: SizeTransition(
              sizeFactor: _doubleAnimation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: const FlutterLogo(size: 150.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 204, 72, 219),
            child: FadeTransition(
              opacity: _doubleAnimation,
              child: const FlutterLogo(size: 150.0),
            ),
          ),
          Container(
            color: Colors.grey,
            child: AlignTransition(
              alignment: _alignmentAnimation,
              child: const FlutterLogo(size: 150.0),
            ),
          ),
        ],
      ),
      title: 'Transition',
    );
  }
}
