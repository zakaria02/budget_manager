part of 'date_picker_cubit.dart';

class DatePickerState extends Equatable {
  final DateTime budgetDate;

  const DatePickerState(this.budgetDate);

  @override
  List<Object> get props => [budgetDate];
}
