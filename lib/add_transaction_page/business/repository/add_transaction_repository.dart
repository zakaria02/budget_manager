import '../../../business/auth/business_auth.dart';

import '../data_source/add_transaction_service.dart';
import '../../../utils/model/firebase_response.dart';
import '../dtos/transaction_dto.dart';

class AddTransactionRepositoryImpl implements AddTransactionRepository {
  AddTransactionService addTransactionService = AddTransactionService();
  @override
  Future<FirebaseResponse> addTransaction(
      AuthenticationRepository authenticationRepository,
      TransactionDTO transactionDTO) async {
    return addTransactionService.addTransaction(
        authenticationRepository, transactionDTO);
  }
}

abstract class AddTransactionRepository {
  Future<FirebaseResponse> addTransaction(
      AuthenticationRepository authenticationRepository,
      TransactionDTO transactionDTO);
}
