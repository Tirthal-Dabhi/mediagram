import 'package:flutter/material.dart';
import 'package:mediagram/widget/style.dart';

class AppsButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback onPressed;
  final Color? color;
  final double? fontSize;

  const AppsButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.borderRadius,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        fixedSize: MaterialStateProperty.all(
          Size(width!, height!),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
      ),
      child: Text(
        title,
        style: style().copyWith(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
