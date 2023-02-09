import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'date_picker.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              UniconsLine.bars,
            ),
            color: black,
          ),
          const DatePicker(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              UniconsLine.setting,
            ),
            color: black,
          ),
        ],
      ),
    );
  }
}
