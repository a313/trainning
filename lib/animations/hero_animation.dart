import 'package:flutter/material.dart';
import 'package:trainning/animations/hero_detail.dart';
import 'package:trainning/utils/base_scaffold.dart';
import 'package:trainning/utils/extentsions.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Hero Widget",
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          final path = 'assets/images/${index + 1}.jpg';
          final heroTag = 'hero_$index';
          return GestureDetector(
            onTap: () => context.push(HeroDetail(path: path, heroTag: heroTag)),
            child: Hero(tag: heroTag, child: Image.asset(path)),
          );
        },
      ),
    );
  }
}
