import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerState(DateTime.now()));

  void setDate(DateTime date) {
    emit(DatePickerState(date));
  }

  void addMonth() {
    DateTime newDate = DateTime(state.budgetDate.year,
        state.budgetDate.month + 1, state.budgetDate.day);

    emit(DatePickerState(newDate));
  }

  void subtractMonth() {
    DateTime newDate = DateTime(state.budgetDate.year,
        state.budgetDate.month - 1, state.budgetDate.day);
    emit(DatePickerState(newDate));
  }
}
