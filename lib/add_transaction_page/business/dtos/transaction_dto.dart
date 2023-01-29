import 'category_dto.dart';

class TransactionDTO {
  TransactionType type;
  double amount;
  CategoryDTO category;
  DateTime date;
  String accountType;
  RepeatingType repeatingType;
  String notes;

  TransactionDTO({
    required this.type,
    required this.amount,
    required this.category,
    required this.date,
    required this.accountType,
    required this.repeatingType,
    required this.notes,
  });
}

enum TransactionType { income, expenses, unkownValue }

enum RepeatingType { never, daily, weekly, monthly, yearly, unkownValue }
