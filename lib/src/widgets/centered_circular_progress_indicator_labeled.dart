import 'package:flutter/material.dart';

class CenteredCircularProgressIndicatorLabeled extends StatelessWidget {
  final String text;
  const CenteredCircularProgressIndicatorLabeled({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
