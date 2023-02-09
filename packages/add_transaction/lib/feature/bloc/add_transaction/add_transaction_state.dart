part of 'add_transaction_bloc.dart';

abstract class AddTransactionState extends Equatable {
  final TransactionUIO transactionUIO;

  const AddTransactionState(this.transactionUIO);

  @override
  List<Object> get props => [transactionUIO];
}

class AddTransactionInitial extends AddTransactionState {
  const AddTransactionInitial(super.transactionUIO);

  AddTransactionInitial copyWith({
    String? type,
    String? amount,
    CategoryUIO? category,
    String? date,
    String? accountType,
    String? repeatingType,
    String? notes,
  }) {
    return AddTransactionInitial(
      transactionUIO.copyWith(
        type: type,
        amount: amount,
        category: category,
        date: date,
        accountType: accountType,
        repeatingType: repeatingType,
        notes: notes,
      ),
    );
  }

  @override
  List<Object> get props => [transactionUIO];
}

class AddTransactionLoading extends AddTransactionState {
  const AddTransactionLoading(super.transactionUIO);
}

class AddTransactionSuccess extends AddTransactionState {
  final String message;
  const AddTransactionSuccess(super.transactionUIO, this.message);
}

class AddTransactionFailure extends AddTransactionState {
  final String errorMessage;
  const AddTransactionFailure(super.transactionUIO, this.errorMessage);
}
