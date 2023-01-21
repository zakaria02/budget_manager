import 'package:flutter/material.dart';

Widget scaffoldCover(Widget child) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: MediaQuery(
      data: const MediaQueryData(),
      child: child,
    ),
  );
}

Widget widgetCover(Widget child) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Material(
      child: child,
    ),
  );
}
