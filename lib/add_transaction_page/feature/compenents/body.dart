import 'package:flutter/material.dart';

import '../model/mapper/transaction_uio_dto_mappers.dart';
import '../../business/dtos/dtos.dart';
import '../../../styles/styles.dart';
import '../model/transaction_uio.dart';
import 'app_bar.dart';
import 'options_list_transaction.dart';
import 'transaction_type_ui.dart';

class AddTransactionBody extends StatelessWidget {
  AddTransactionBody({super.key});

  final TransactionUIO transactionUIO = transactionDtoMock.toTransactionUIO();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AddTransactionAppBar(),
        const SizedBox(
          height: 20,
        ),
        const TransactionTypeUI(),
        const SizedBox(
          height: 20,
        ),
        Text(
          "\$${transactionUIO.amount}",
          style: h1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        OptionsListTransaction(),
      ],
    );
  }
}
