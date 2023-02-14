part of 'add_transaction_bloc.dart';

class AddTransactionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTransactionStart extends AddTransactionEvent {}

class AddTransactionSave extends AddTransactionEvent {}

class TypeChange extends AddTransactionEvent {
  final String type;
  TypeChange({required this.type});
}

class CategoryChange extends AddTransactionEvent {
  final CategoryUIO category;
  CategoryChange({required this.category});
}

class AmountChange extends AddTransactionEvent {
  final String amount;
  AmountChange({required this.amount});
}

class DateChange extends AddTransactionEvent {
  final String date;
  DateChange({required this.date});
}

class AccountChange extends AddTransactionEvent {
  final String account;
  AccountChange({required this.account});
}

class RepeatingChange extends AddTransactionEvent {
  final String repeating;
  RepeatingChange({required this.repeating});
}

class NotesChange extends AddTransactionEvent {
  final String notes;
  NotesChange({required this.notes});
}
