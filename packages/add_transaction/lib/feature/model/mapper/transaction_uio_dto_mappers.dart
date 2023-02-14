import '../transaction_uio.dart';
import '../../../business/dto/transaction_dto.dart';
import 'package:category/category.dart';

// Months display on add transaction page
List<String> _months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

/// DTO to UIO

extension TransactionDtoMappers on TransactionDTO {
  TransactionUIO toTransactionUIO() {
    return TransactionUIO(
      type: type.toStringType(),
      amount: amount.toString(),
      category: category?.toCategoryUIO(),
      date: date.toStringDate(),
      accountType: accountType,
      repeatingType: repeatingType.toStringRepeating(),
      notes: notes,
    );
  }
}

extension TransactionTypeMappers on TransactionType {
  String toStringType() {
    switch (this) {
      case TransactionType.expenses:
        return "Expenses";
      case TransactionType.income:
        return "Income";
      default:
        return "Unkown value";
    }
  }
}

extension DateTimeMappers on DateTime {
  String toStringDate() {
    List<String> months = _months;
    try {
      // Ex (Date to return) : 23 Jan 2023
      return "${day > 0 ? '$day' : '0$day'} ${months[month - 1]} $year";
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

extension RepeatingTypeMappers on RepeatingType {
  String toStringRepeating() {
    switch (this) {
      case RepeatingType.never:
        return "No";
      case RepeatingType.daily:
        return "Daily";
      case RepeatingType.weekly:
        return "Weekly";
      case RepeatingType.monthly:
        return "Monthly";
      case RepeatingType.yearly:
        return "Yearly";
      default:
        return "Unkown Value";
    }
  }
}

/// UIO to DTO

extension TransactionUIOMappers on TransactionUIO {
  TransactionDTO toTransctionDTO() {
    return TransactionDTO(
      type: type.toTransactionType(),
      amount: amount.toStringAmount(),
      category: category?.toCategoryDto(),
      date: date.toDateTime(),
      accountType: accountType,
      repeatingType: repeatingType.toRepeatingType(),
      notes: notes,
    );
  }
}

extension TransactionStringsMappers on String {
  TransactionType toTransactionType() {
    switch (toUpperCase()) {
      case "EXPENSES":
        return TransactionType.expenses;
      case "INCOME":
        return TransactionType.income;
      default:
        return TransactionType.unkownValue;
    }
  }

  double toStringAmount() {
    double? amount = double.tryParse(this);
    return amount ?? 0.0;
  }

  RepeatingType toRepeatingType() {
    switch (toUpperCase()) {
      case "NO":
        return RepeatingType.never;
      case "DAILY":
        return RepeatingType.daily;
      case "WEEKLY":
        return RepeatingType.weekly;
      case "MONTHLY":
        return RepeatingType.monthly;
      case "YEARLY":
        return RepeatingType.yearly;
      default:
        return RepeatingType.unkownValue;
    }
  }

  DateTime toDateTime() {
    int monthIndex = _months.indexOf(substring(3, 6));
    if (monthIndex != -1) {
      monthIndex++;
    }
    try {
      // Ex (Date to parse) : '23 Jan 2023'
      return DateTime(
        int.parse(substring(6)),
        monthIndex,
        int.parse(substring(0, 2)),
      );
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
