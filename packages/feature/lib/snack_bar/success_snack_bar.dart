import 'package:common/common.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SnackBar SuccessSnackBar({required message}) {
  return SnackBar(
    content: Text(
      message,
      style: snackBarBody,
    ),
    backgroundColor: successColor,
  );
}
