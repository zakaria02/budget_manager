import 'package:feature/feature.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_transaction/add_transaction_bloc.dart';
import 'app_bar.dart';
import 'options_list_transaction.dart';
import 'transaction_type_ui.dart';

class AddTransactionBody extends StatelessWidget {
  const AddTransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTransactionBloc, AddTransactionState>(
      listener: (context, addTransactionState) {
        if (addTransactionState is AddTransactionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              ErrorSnackBar(message: addTransactionState.errorMessage));
        } else if (addTransactionState is AddTransactionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              SuccessSnackBar(message: addTransactionState.message));
          context.read<AddTransactionBloc>().add(AddTransactionStart());
          Navigator.of(context).pop();
        }
      },
      builder: (context, addTransactionState) {
        return ListView(
          children: [
            const AddTransactionAppBar(),
            if (addTransactionState is AddTransactionLoading)
              const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primary),
              ),
            const SizedBox(
              height: 20,
            ),
            const TransactionTypeUI(),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: h1,
              textAlign: TextAlign.center,
              showCursor: false,
              enableInteractiveSelection: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              controller: CustomTextController(
                  text: "\$${addTransactionState.transactionUIO.amount}"),
              onChanged: (value) {
                context
                    .read<AddTransactionBloc>()
                    .add(AmountChange(amount: value));
              },
              enabled: addTransactionState is! AddTransactionLoading,
            ),
            const SizedBox(
              height: 20,
            ),
            const OptionsListTransaction(),
          ],
        );
      },
    );
  }
}
