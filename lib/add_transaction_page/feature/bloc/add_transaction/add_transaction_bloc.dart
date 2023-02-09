import '../../../business/di/add_transaction_module.dart';
import '../../../../utils/model/firebase_response.dart';
import '../../../business/repository/add_transaction_repository.dart';
import '../../model/model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

TransactionUIO initTransactionUIO = TransactionUIO(
  type: "income",
  amount: "0",
  category: CategoryUIO(
    id: "1",
    name: "Travel",
  ),
  date: DateTime.now().toStringDate(),
  accountType: "Savings",
  repeatingType: "No",
  notes: "",
);

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  AddTransactionBloc() : super(AddTransactionInitial(initTransactionUIO)) {
    on<TypeChange>(_typeChange);
    on<AmountChange>(_amountChange);
    on<DateChange>(_dateChange);
    on<AccountChange>(_accountChange);
    on<RepeatingChange>(_repeatingChange);
    on<NotesChange>(_notesChange);
    on<AddTransactionSave>((event, emit) async {
      await _saveAddTransaction(event, emit);
    });
    on<AddTransactionStart>(
      (event, emit) {
        emit(AddTransactionInitial(initTransactionUIO));
      },
    );
  }

  void _typeChange(TypeChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial).copyWith(type: event.type));
    }
  }

  void _dateChange(DateChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial).copyWith(date: event.date));
    }
  }

  void _accountChange(AccountChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial)
          .copyWith(accountType: event.account));
    }
  }

  void _repeatingChange(
      RepeatingChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial)
          .copyWith(repeatingType: event.repeating));
    }
  }

  void _notesChange(NotesChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial).copyWith(notes: event.notes));
    }
  }

  void _amountChange(AmountChange event, Emitter<AddTransactionState> emit) {
    if (state is AddTransactionInitial) {
      emit((state as AddTransactionInitial)
          .copyWith(amount: _formatAmount(event.amount)));
    }
  }

  String _formatAmount(String amount) {
    String value = amount.trim().replaceAll('\$', '');
    if (value.isNotEmpty) {
      if (value != "0" && value.substring(0, 1) == "0") {
        return value.substring(1);
      } else {
        return value.replaceAll(',', '.');
      }
    }
    return "0";
  }

  Future _saveAddTransaction(
    AddTransactionSave event,
    Emitter<AddTransactionState> emit,
  ) async {
    AddTransactionRepository addTransactionRepository =
        AddTransactionModule().get<AddTransactionRepository>();
    emit(AddTransactionLoading(state.transactionUIO));
    FirebaseResponse firebaseResponse = await addTransactionRepository
        .addTransaction(state.transactionUIO.toTransctionDTO());
    if (firebaseResponse.success) {
      emit(AddTransactionSuccess(
          state.transactionUIO, firebaseResponse.message));
    } else {
      emit(AddTransactionFailure(
          state.transactionUIO, firebaseResponse.message));
    }
  }
}
