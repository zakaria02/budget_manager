import 'package:add_transaction/add_transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mocks/add_transaction_test.mocks.dart';
import 'mocks/firebase_response_mock.dart';
import 'mocks/transaction_dto_mocks.dart';

@GenerateMocks([AddTransactionService, AddTransactionRepository])
void main() {
  late AddTransactionService addTransactionService;
  late AddTransactionRepository addTransactionRepository;

  setUp(() {
    addTransactionService = MockAddTransactionService();
    addTransactionRepository = MockAddTransactionRepository();
  });
  test(
    "Add Transaction Repository Test",
    (() async {
      when(addTransactionRepository.addTransaction(validTransactionDto))
          .thenAnswer((realInvocation) => Future.value(firebaseSuccess));
      when(addTransactionRepository.addTransaction(invalidTransactionDto1))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
      when(addTransactionRepository.addTransaction(invalidTransactionDto2))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
      when(addTransactionRepository.addTransaction(invalidTransactionDto3))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
    }),
  );

  test(
    "Add Transaction Service Test",
    (() async {
      when(addTransactionService.addTransaction(validTransactionDto))
          .thenAnswer((realInvocation) => Future.value(firebaseSuccess));
      when(addTransactionService.addTransaction(invalidTransactionDto1))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
      when(addTransactionService.addTransaction(invalidTransactionDto2))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
      when(addTransactionService.addTransaction(invalidTransactionDto3))
          .thenAnswer((realInvocation) => Future.value(firebaseFailure));
    }),
  );
}
