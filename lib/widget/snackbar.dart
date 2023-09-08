import 'package:flutter/material.dart';
import 'package:mediagram/widget/style.dart';

popSnackbar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: style().copyWith(),
      ),
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      margin: const EdgeInsets.all(8.0),
    ),
  );
}
