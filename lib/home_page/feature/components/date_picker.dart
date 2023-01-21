import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/styles.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  void _showDatePciker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      fieldLabelText: "Pick Date",
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null) {
      log(picked.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            UniconsLine.angle_left_b,
          ),
          color: black,
        ),
        TextButton(
          onPressed: () => _showDatePciker(
            context,
          ),
          style: TextButton.styleFrom(
            surfaceTintColor: Colors.grey,
          ),
          child: const Text(
            "",
            style: body,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            UniconsLine.angle_right_b,
          ),
          color: black,
        ),
      ],
    );
  }
}
