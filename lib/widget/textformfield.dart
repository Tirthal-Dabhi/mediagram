import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediagram/widget/style.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final int? textArea;
  final Widget? search;

  const InputField(
      {Key? key,
      required this.controller,
      this.textArea,
      this.title,
      this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        maxLines: textArea,
        style: style(),
        focusNode: FocusNode(),
        decoration: InputDecoration(
          filled: true,
          hintText: title,
          hintStyle: style().copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
          contentPadding: const EdgeInsets.only(
            left: 15,
            right: 10,
            top: 20,
          ),
          suffixIcon: search,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 5),
          ),
        ),
      ),
    );
  }
}

class InputFieldNumber extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const InputFieldNumber({
    Key? key,
    required this.controller,
    required this.title,}) :
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: style(),
        decoration: InputDecoration(
          filled: true,
          hintText: title,
          hintStyle: style().copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.only(left: 20,),
          fillColor: const Color(0xfff0f0f2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
