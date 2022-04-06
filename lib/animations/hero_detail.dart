import 'package:flutter/material.dart';
import 'package:trainning/utils/base_scaffold.dart';

class HeroDetail extends StatelessWidget {
  const HeroDetail({Key? key, required this.path, required this.heroTag})
      : super(key: key);
  final String path;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Hero Detail",
      body: Column(
        children: [
          Hero(tag: heroTag, child: Image.asset(path)),
        ],
      ),
    );
  }
}
