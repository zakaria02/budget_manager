import 'package:budget_manager/add_transaction_page/business/business.dart';
import 'package:budget_manager/business/auth/repository/auth_repository.dart';
import 'package:budget_manager/utils/model/firebase_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/firebase_response_mock.dart';

class AuthenticationRepositoryMock extends Mock
    implements AuthenticationRepository {}

class AddTransactionServiceMock extends Mock implements AddTransactionService {}

class AddTransactionRepositoryMock extends Mock
    implements AddTransactionRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late AddTransactionServiceMock addTransactionServiceMock;
  //late AddTransactionRepositoryMock addTransactionRepositoryMock;
  late TransactionDTO transactionDTO;
  late FirebaseResponse? response;

  setUp(() {
    addTransactionServiceMock = AddTransactionServiceMock();
    //addTransactionRepositoryMock = AddTransactionRepositoryMock();
    authenticationRepository = AuthenticationRepositoryMock();
    transactionDTO = transactionDtoMock;
  });

  test(
    "Add Transaction Service",
    (() async {
      response = await addTransactionServiceMock.addTransaction(
          authenticationRepository, transactionDTO);
      expect(response != null, true);
      expect(response?.success == successResponse.success, true);
      expect(response?.message == successResponse.message, true);
    }),
  );
}
