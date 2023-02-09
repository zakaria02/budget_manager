import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../model/mapper/transaction_uio_dto_mappers.dart';
import 'package:flutter/material.dart';
import '../../business/dto/dto.dart';
import 'bottom_sheet/add_transaction_bottom_sheet.dart';
import 'option_transaction.dart';

class OptionsListTransaction extends StatelessWidget {
  const OptionsListTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, addTransactionState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: mainPadding),
          child: Column(
            children: [
              OptionTransaction(
                title: "Category",
                data: addTransactionState.transactionUIO.category.name,
                activeData: true,
                onPress: () {},
                enabled: addTransactionState is! AddTransactionLoading,
              ),
              OptionTransaction(
                title: "Date",
                data: addTransactionState.transactionUIO.date,
                onPress: () => showMyDatePciker(context).then(
                  (picked) {
                    if (picked != null) {
                      context
                          .read<AddTransactionBloc>()
                          .add(DateChange(date: picked.toStringDate()));
                    }
                  },
                ),
                enabled: addTransactionState is! AddTransactionLoading,
              ),
              OptionTransaction(
                title: "Account",
                data: addTransactionState.transactionUIO.accountType,
                onPress: () {
                  context.read<BottomSheetCubit>().openAccountBottomSheet(
                        "Account",
                        accountTypes,
                        BottomSheetType.accountType,
                      );
                  showListModalBottomSheet(context);
                },
                enabled: addTransactionState is! AddTransactionLoading,
              ),
              OptionTransaction(
                title: "Repeating",
                data: addTransactionState.transactionUIO.repeatingType,
                onPress: () {
                  context.read<BottomSheetCubit>().openRepeatingBottomSheet(
                        "Repeating",
                        repeatingTypes
                            .map((repatingType) =>
                                repatingType.toStringRepeating())
                            .toList(),
                        BottomSheetType.repeating,
                      );
                  showListModalBottomSheet(context);
                },
                enabled: addTransactionState is! AddTransactionLoading,
              ),
              TextFormField(
                initialValue: addTransactionState.transactionUIO.notes,
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
                onChanged: (value) => context
                    .read<AddTransactionBloc>()
                    .add(NotesChange(notes: value)),
                enabled: addTransactionState is! AddTransactionLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}
