import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: SingleChildScrollView(child: content),
    );
  }
}