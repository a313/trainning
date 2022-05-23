import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'slide_to_act.dart';

class SlideToActPage extends StatelessWidget {
  const SlideToActPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Builder(
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SlideAction(),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    innerColor: Colors.black,
                    outerColor: Colors.white,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    innerColor: Colors.green,
                    outerColor: Colors.white,
                    sliderRotate: false,
                    acceptSummit: 0.95,
                    alignment: Alignment.centerRight,
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xFF858585),
                      highlightColor: Colors.white,
                      child: const Text(
                        'Trượt để mở khóa',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    sliderButtonIcon: const Icon(Icons.lock),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    height: 100,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    sliderButtonIconSize: 48,
                    sliderButtonYOffset: -20,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    elevation: 24,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    borderRadius: 16,
                    animationDuration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            // Builder(
            //   builder: (context) {
            //     final GlobalKey<SlideActionState> _key = GlobalKey();
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SlideAction(
            //         key: _key,
            //         onSubmit: () {
            //           Future.delayed(
            //             const Duration(seconds: 1),
            //             () => _key.currentState?.reset(),
            //           );
            //         },
            //         reversed: true,
            //       ),
            //     );
            //   },
            // ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                    submittedIcon: const Icon(
                      Icons.done_all,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState?.reset(),
                      );
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SlideAction(
                    sliderRotate: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
