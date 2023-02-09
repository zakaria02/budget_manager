import 'category_uio.dart';

class TransactionUIO {
  String type;
  String amount;
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

  TransactionUIO copyWith({
    String? type,
    String? amount,
    CategoryUIO? category,
    String? date,
    String? accountType,
    String? repeatingType,
    String? notes,
  }) {
    return TransactionUIO(
      type: type ?? this.type,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      accountType: accountType ?? this.accountType,
      repeatingType: repeatingType ?? this.repeatingType,
      notes: notes ?? this.notes,
    );
  }

  /*@override
  String toString() {
    return "TranscationUIO (\ntype: $type\namount: $amount\ncategory: $category"
        "\ndate: $date\naccountType: $accountType\nrepeatingType: $repeatingType"
        "\nnotes: $notes)";
  }*/
}
