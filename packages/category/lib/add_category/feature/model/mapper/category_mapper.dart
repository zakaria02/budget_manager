import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import '../../../business/dto/category_dto.dart';
import '../category_uio.dart';

extension CategoryDtoMappers on CategoryDTO {
  CategoryUIO toCategoryUIO() {
    return CategoryUIO(
      name: name,
      icon: iconsListJson[icon] as IconData,
      color: randomColor(),
    );
  }
}

extension CategoryUIOMappers on CategoryUIO {
  CategoryDTO toCategoryDto() {
    return CategoryDTO(
      name: name,
      icon: _iconKey(icon),
    );
  }

  String _iconKey(IconData icon) {
    String iconKey = "image_slash";
    iconsListJson.forEach((key, value) {
      if (value == icon) {
        iconKey = key;
      }
    });
    return iconKey;
  }
}

List<Color> _iconsColors = const [
  Color(0xFFE08EAE),
  Color(0xFF89D59C),
  Color(0xFFC3ACF1),
  Color(0xFFEDBC7E),
  Color(0xFFED8278),
  Color(0xFFB09D7E),
];

int _randomInt(int max) {
  return Random().nextInt(max);
}

Color randomColor() {
  return _iconsColors[_randomInt(_iconsColors.length)];
}
