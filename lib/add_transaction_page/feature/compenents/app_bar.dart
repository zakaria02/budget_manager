import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/styles.dart';

class AddTransactionAppBar extends StatelessWidget {
  const AddTransactionAppBar({super.key});

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
          "NEW TRANSACTION",
          style: pageTitle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Save",
            style: appBarButton,
          ),
        ),
      ],
    );
  }
}
