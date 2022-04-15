import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? fab;

  const BaseScaffold(
      {Key? key, required this.title, required this.body, this.fab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab,
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
