import 'package:flutter/material.dart';

extension ScaffoldMessngerContext on BuildContext {
  void showError(String massage) {
    ScaffoldMessenger.of(this)
        .showSnackBar(SnackBar(content: Text(massage)));
  }
}