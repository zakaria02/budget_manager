import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../bloc/add_transaction/add_transaction_bloc.dart';
import 'transaction_outlined_button.dart';

class TransactionTypeUI extends StatelessWidget {
  const TransactionTypeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, addTransactionState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TransactionOutlinedButton(
              icon: UniconsLine.shopping_cart,
              color: expensesColor,
              text: "EXPENSES",
              isSelected:
                  addTransactionState.transactionUIO.type.toUpperCase() ==
                      "EXPENSES",
              onPress: addTransactionState is! AddTransactionLoading
                  ? () => context
                      .read<AddTransactionBloc>()
                      .add(TypeChange(type: "Expenses"))
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            TransactionOutlinedButton(
              icon: UniconsLine.usd_circle,
              color: incomeColor,
              text: "INCOME",
              isSelected:
                  addTransactionState.transactionUIO.type.toUpperCase() ==
                      "INCOME",
              onPress: addTransactionState is! AddTransactionLoading
                  ? () => context
                      .read<AddTransactionBloc>()
                      .add(TypeChange(type: "Income"))
                  : null,
            )
          ],
        );
      },
    );
  }
}
