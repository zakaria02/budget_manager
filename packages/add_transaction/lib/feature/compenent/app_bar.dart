import 'package:common/common.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../bloc/add_transaction/add_transaction_bloc.dart';
import '../model/transaction_uio.dart';

class AddTransactionAppBar extends StatelessWidget {
  const AddTransactionAppBar({super.key});

  bool _validateData(BuildContext context, TransactionUIO transactionUIO) {
    double? amountD = double.tryParse(transactionUIO.amount);
    String? message;

    if (transactionUIO.type.isEmpty) {
      message = "No transaction type selected";
    } else if (transactionUIO.accountType.isEmpty) {
      message = "No account type selected";
    } else if (transactionUIO.amount.isEmpty ||
        amountD == null ||
        amountD <= 0) {
      message = "Selected amount is incorrect";
    } else if (transactionUIO.category.name.isEmpty) {
      message = "No category selected";
    } else if (transactionUIO.date.isEmpty) {
      message = "No date selected";
    } else if (transactionUIO.repeatingType.isEmpty) {
      message = "No repeating type selected";
    }

    if (message != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(ErrorSnackBar(message: message));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, addTransactionState) {
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
              onPressed: addTransactionState is! AddTransactionLoading
                  ? () {
                      if (_validateData(
                          context, addTransactionState.transactionUIO)) {
                        context
                            .read<AddTransactionBloc>()
                            .add(AddTransactionSave());
                      }
                    }
                  : null,
              child: Text(
                "Save",
                style: appBarButton,
              ),
            ),
          ],
        );
      },
    );
  }
}
