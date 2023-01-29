import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import 'transaction_outlined_button.dart';
import 'package:unicons/unicons.dart';

class TransactionTypeUI extends StatelessWidget {
  const TransactionTypeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TransactionOutlinedButton(
          icon: UniconsLine.shopping_cart,
          color: expensesColor,
          text: "EXPENSES",
          isSelected: true,
          onPress: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        TransactionOutlinedButton(
          icon: UniconsLine.usd_circle,
          color: incomeColor,
          text: "INCOME",
          isSelected: false,
          onPress: () {},
        )
      ],
    );
  }
}
