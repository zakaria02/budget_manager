import 'package:add_transaction/add_transaction.dart';

CategoryDTO validCategoryDto = CategoryDTO(id: "1", name: "travel");

TransactionDTO validTransactionDto = TransactionDTO(
  type: TransactionType.income,
  amount: 10.0,
  category: validCategoryDto,
  date: DateTime.now(),
  accountType: "Savings",
  repeatingType: RepeatingType.never,
  notes: "",
);

TransactionDTO invalidTransactionDto1 = TransactionDTO(
  type: TransactionType.income,
  amount: 0,
  category: validCategoryDto,
  date: DateTime.now(),
  accountType: "Savings",
  repeatingType: RepeatingType.never,
  notes: "",
);

TransactionDTO invalidTransactionDto2 = TransactionDTO(
  type: TransactionType.unkownValue,
  amount: 0,
  category: validCategoryDto,
  date: DateTime.now(),
  accountType: "Savings",
  repeatingType: RepeatingType.never,
  notes: "",
);

TransactionDTO invalidTransactionDto3 = TransactionDTO(
  type: TransactionType.income,
  amount: 0,
  category: validCategoryDto,
  date: DateTime.now(),
  accountType: "Savings",
  repeatingType: RepeatingType.unkownValue,
  notes: "",
);
