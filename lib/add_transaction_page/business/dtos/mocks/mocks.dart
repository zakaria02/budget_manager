import '../category_dto.dart';
import '../transaction_dto.dart';

TransactionDTO transactionDtoMock = TransactionDTO(
  type: TransactionType.income,
  amount: 100.0,
  category: CategoryDTO(
    id: "123",
    name: "Travel",
    icon: null,
  ),
  date: DateTime.now(),
  accountType: accountTypes[0],
  repeatingType: repeatingTypes[3],
  notes: "This is just a mock",
);

List<String> accountTypes = [
  "Savings",
  "Account 1",
];

List<RepeatingType> repeatingTypes = [
  RepeatingType.never,
  RepeatingType.daily,
  RepeatingType.weekly,
  RepeatingType.monthly,
  RepeatingType.yearly,
];
