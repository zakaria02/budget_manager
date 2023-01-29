part of 'bottom_sheet_cubit.dart';

abstract class BottomSheetState extends Equatable {
  final String title;
  final List<String> values;

  const BottomSheetState({required this.title, required this.values});

  @override
  List<Object> get props => [];
}

class BottomSheetInitial extends BottomSheetState {
  const BottomSheetInitial({required super.title, required super.values});
}

class AccountBottomSheetOpened extends BottomSheetState {
  const AccountBottomSheetOpened({required super.title, required super.values});
}

class RepeatingBottomSheetOpened extends BottomSheetState {
  const RepeatingBottomSheetOpened(
      {required super.title, required super.values});
}
