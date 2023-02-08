import 'package:flutter/material.dart';

class CustomTextController extends TextEditingController {
  CustomTextController({required String text}) {
    this.text = text;
  }

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }
}
