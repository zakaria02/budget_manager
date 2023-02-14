import 'package:category/category.dart';

import '../../../feature/model/mapper/transaction_uio_dto_mappers.dart';

class TransactionDTO {
  TransactionType type;
  double amount;
  CategoryDTO? category;
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

  Map<String, dynamic> toJson() => {
        "transaction_type": type.toStringType(),
        "amount": amount,
        "category": category!.toJson(),
        "date": date,
        "account_type": accountType,
        "repeating_type": repeatingType.toStringRepeating(),
        "notes": notes,
      };

  TransactionDTO.fromJson(Map<String, dynamic> json)
      : type = json["transaction_type"].toString().toTransactionType(),
        amount = json["amount"],
        category = CategoryDTO.fromJson(json),
        date = json["date"].toDate(),
        accountType = json["account_type"],
        repeatingType = json["repeating_type"].toString().toRepeatingType(),
        notes = json["notes"];
}

enum TransactionType { income, expenses, unkownValue }

enum RepeatingType { never, daily, weekly, monthly, yearly, unkownValue }
