import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import 'option_transaction.dart';

class OptionsListTransaction extends StatelessWidget {
  const OptionsListTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mainPadding),
      child: Column(
        children: [
          const OptionTransaction(
            title: "Category",
            data: "CHOOSE >",
            activeData: false,
          ),
          const OptionTransaction(
            title: "Date",
            data: "14 Jan 2023",
          ),
          const OptionTransaction(
            title: "Account",
            data: "Savings",
          ),
          const OptionTransaction(
            title: "Repeating",
            data: "No",
          ),
          TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
                fontFamily: "Quicksand",
              ),
              hintText: "Notes",
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
