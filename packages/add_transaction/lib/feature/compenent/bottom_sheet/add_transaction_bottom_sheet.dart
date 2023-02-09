import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/bloc.dart';

void showListModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AddTrnsactionBottomSheet();
      });
}

// ignore: must_be_immutable
class AddTrnsactionBottomSheet extends StatelessWidget {
  const AddTrnsactionBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      buildWhen: (previous, current) {
        return current is AccountBottomSheetOpened ||
            current is RepeatingBottomSheetOpened;
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                AddTransactionBottomSheetTitle(title: state.title),
              ] +
              state.values
                  .map((value) => AddTransactionBottomSheetValue(
                        value: value,
                        bottomSheetType: state.bottomSheetType,
                      ))
                  .toList(),
        );
      },
    );
  }
}

class AddTransactionBottomSheetTitle extends StatelessWidget {
  const AddTransactionBottomSheetTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(innerPadding),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: bottomSheetTitle,
      ),
    );
  }
}

class AddTransactionBottomSheetValue extends StatelessWidget {
  const AddTransactionBottomSheetValue({
    super.key,
    required this.value,
    required this.bottomSheetType,
  });
  final String value;
  final BottomSheetType bottomSheetType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        if (bottomSheetType == BottomSheetType.accountType) {
          context.read<AddTransactionBloc>().add(
                AccountChange(account: value),
              );
        } else if (bottomSheetType == BottomSheetType.repeating) {
          context.read<AddTransactionBloc>().add(
                RepeatingChange(repeating: value),
              );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(innerPadding),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: bottomSheetValue,
          ),
        ),
      ),
    );
  }
}
