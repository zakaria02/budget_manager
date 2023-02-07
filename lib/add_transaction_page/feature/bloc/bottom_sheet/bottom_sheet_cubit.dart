import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit()
      : super(
          const BottomSheetInitial(
            title: "No data found",
            values: [],
            bottomSheetType: BottomSheetType.none,
          ),
        );

  void openAccountBottomSheet(
      String title, List<String> values, BottomSheetType bottomSheetType) {
    emit(
      AccountBottomSheetOpened(
        title: title,
        values: values,
        bottomSheetType: bottomSheetType,
      ),
    );
  }

  void openRepeatingBottomSheet(
    String title,
    List<String> values,
    BottomSheetType bottomSheetType,
  ) {
    emit(RepeatingBottomSheetOpened(
      title: title,
      values: values,
      bottomSheetType: bottomSheetType,
    ));
  }
}
