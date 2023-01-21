import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/styles.dart';
import '../../../utils/constantes.dart';
import '../bloc/date_picker/date_picker_cubit.dart';
import '../../../extensions/date_extension.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  void _showDatePciker(
      BuildContext context, DatePickerCubit datePickerCubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: minDate,
      lastDate: maxDate,
      fieldLabelText: "Pick Date",
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null) {
      datePickerCubit.setDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatePickerCubit, DatePickerState>(
      builder: (context, datePickerState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: datePickerState.budgetDate.difference(minDate).inDays >
                      30
                  ? () {
                      BlocProvider.of<DatePickerCubit>(context).subtractMonth();
                    }
                  : null,
              icon: const Icon(
                UniconsLine.angle_left_b,
              ),
              color: black,
            ),
            TextButton(
              onPressed: () => _showDatePciker(
                context,
                BlocProvider.of<DatePickerCubit>(context),
              ),
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
                          BlocProvider.of<DatePickerCubit>(context).addMonth();
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
