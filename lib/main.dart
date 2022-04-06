import 'package:flutter/material.dart';
import 'package:trainning/utils/extentsions.dart';

import 'animations/animations_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Animations'),
            onTap: () => context.push(const AnimationsPage()),
          ),
          // ListTile(
          //   title: const Text('Painter'),
          //   onTap: () => context.push(const AnimationsPage()),
          // ),
        ],
      ),
    );
  }
}
