import 'package:budget_manager/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/styles.dart';
import '../../../utils/constantes.dart';
import '../bloc/date_picker/date_picker_cubit.dart';
import '../../../extensions/date_extension.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatePickerCubit, DatePickerState>(
      builder: (context, datePickerState) {
        final DatePickerCubit datePickerCubit = context.read<DatePickerCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed:
                  datePickerState.budgetDate.difference(minDate).inDays > 30
                      ? () {
                          datePickerCubit.subtractMonth();
                        }
                      : null,
              icon: const Icon(
                UniconsLine.angle_left_b,
              ),
              color: black,
            ),
            TextButton(
              onPressed: () async {
                DateTime? selectedDate = await showMyDatePciker(context);
                if (selectedDate != null) {
                  datePickerCubit.setDate(selectedDate);
                }
              },
              style: TextButton.styleFrom(
                surfaceTintColor: Colors.grey,
              ),
              child: Text(
                datePickerState.budgetDate.stringDateTime(),
                style: body,
              ),
            ),
            IconButton(
              onPressed:
                  maxDate.difference(datePickerState.budgetDate).inDays > 30
                      ? () {
                          datePickerCubit.addMonth();
                        }
                      : null,
              icon: const Icon(
                UniconsLine.angle_right_b,
              ),
              color: black,
            ),
          ],
        );
      },
    );
  }
}
