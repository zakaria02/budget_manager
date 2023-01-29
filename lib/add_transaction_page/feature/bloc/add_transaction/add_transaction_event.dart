part of 'add_transaction_bloc.dart';

class AddTransactionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTransactionStart extends AddTransactionEvent {}

class AddTransactionSave extends AddTransactionEvent {}
