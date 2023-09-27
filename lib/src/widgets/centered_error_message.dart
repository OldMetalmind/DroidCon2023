import 'package:flutter/material.dart';

class CenteredErrorMessage extends StatelessWidget {
  final String errorMessage;
  const CenteredErrorMessage({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: $errorMessage'),
        ],
      ),
    );
  }
}
