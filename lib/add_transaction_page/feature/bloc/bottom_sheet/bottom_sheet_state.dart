part of 'bottom_sheet_cubit.dart';

enum BottomSheetType { accountType, repeating, none }

abstract class BottomSheetState extends Equatable {
  final String title;
  final List<String> values;
  final BottomSheetType bottomSheetType;

  const BottomSheetState({
    required this.title,
    required this.values,
    required this.bottomSheetType,
  });

  @override
  List<Object> get props => [];
}

class BottomSheetInitial extends BottomSheetState {
  const BottomSheetInitial({
    required super.title,
    required super.values,
    required super.bottomSheetType,
  });
}

class AccountBottomSheetOpened extends BottomSheetState {
  const AccountBottomSheetOpened({
    required super.title,
    required super.values,
    required super.bottomSheetType,
  });
}

class RepeatingBottomSheetOpened extends BottomSheetState {
  const RepeatingBottomSheetOpened({
    required super.title,
    required super.values,
    required super.bottomSheetType,
  });
}
