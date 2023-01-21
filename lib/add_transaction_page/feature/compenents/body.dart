import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'app_bar.dart';
import 'options_list_transaction.dart';
import 'transaction_type.dart';

class AddTransactionBody extends StatelessWidget {
  const AddTransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AddTransactionAppBar(),
        SizedBox(
          height: 20,
        ),
        TransactionType(),
        SizedBox(
          height: 20,
        ),
        Text(
          "\$0,00",
          style: h1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        OptionsListTransaction(),
      ],
    );
  }
}
