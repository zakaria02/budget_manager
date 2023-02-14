import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CategoriesListAppBar extends StatelessWidget {
  const CategoriesListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            UniconsLine.times,
          ),
          color: black,
        ),
        const Text(
          "CATEGORY",
          style: pageTitle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Add",
            style: appBarButton,
          ),
        ),
      ],
    );
  }
}
