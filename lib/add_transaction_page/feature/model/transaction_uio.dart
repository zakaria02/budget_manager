import 'category_uio.dart';

class TransactionUIO {
  String type;
  double amount;
  CategoryUIO category;
  String date;
  String accountType;
  String repeatingType;
  String notes;

  TransactionUIO({
    required this.type,
    required this.amount,
    required this.category,
    required this.date,
    required this.accountType,
    required this.repeatingType,
    required this.notes,
  });
}
