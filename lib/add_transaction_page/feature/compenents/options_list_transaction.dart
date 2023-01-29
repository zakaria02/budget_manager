import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/functions.dart';
import '../bloc/bloc.dart';
import '../model/mapper/transaction_uio_dto_mappers.dart';
import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import '../../business/dtos/dtos.dart';
import '../model/transaction_uio.dart';
import 'bottomSheet/add_transaction_bottom_sheet.dart';
import 'option_transaction.dart';

class OptionsListTransaction extends StatelessWidget {
  OptionsListTransaction({super.key});

  final TransactionUIO transactionUIO = transactionDtoMock.toTransactionUIO();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: mainPadding),
          child: Column(
            children: [
              OptionTransaction(
                title: "Category",
                data: transactionUIO.category.name,
                activeData: true,
                onPress: () {},
              ),
              OptionTransaction(
                title: "Date",
                data: transactionUIO.date,
                onPress: () => showMyDatePciker(context),
              ),
              OptionTransaction(
                title: "Account",
                data: transactionUIO.accountType,
                onPress: () {
                  context.read<BottomSheetCubit>().openAccountBottomSheet(
                        "Account",
                        accountTypes,
                      );
                  showListModalBottomSheet(context);
                },
              ),
              OptionTransaction(
                title: "Repeating",
                data: transactionUIO.repeatingType,
                onPress: () {
                  context.read<BottomSheetCubit>().openRepeatingBottomSheet(
                        "Repeating",
                        repeatingTypes
                            .map((repatingType) =>
                                repatingType.toStringRepeating())
                            .toList(),
                      );
                  showListModalBottomSheet(context);
                },
              ),
              TextFormField(
                initialValue: transactionUIO.notes,
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
      },
    );
  }
}
