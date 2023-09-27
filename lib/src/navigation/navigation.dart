import 'package:flutter/material.dart';

void navigateToAddPage(BuildContext context) {
  Navigator.of(context).pushNamed('/add');
}

extension NavigationExtensions on BuildContext {
  void toAddPage() {
    navigateToAddPage(this);
    Navigator.of(this).pushNamed('/add');
  }
}
