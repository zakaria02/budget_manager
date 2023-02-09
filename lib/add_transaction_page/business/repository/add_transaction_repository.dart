import '../data_source/add_transaction_service.dart';
import '../../../utils/model/firebase_response.dart';
import '../dtos/transaction_dto.dart';

class AddTransactionRepositoryImpl implements AddTransactionRepository {
  AddTransactionService addTransactionService = AddTransactionService();
  @override
  Future<FirebaseResponse> addTransaction(TransactionDTO transactionDTO) async {
    return addTransactionService.addTransaction(transactionDTO);
  }
}

abstract class AddTransactionRepository {
  Future<FirebaseResponse> addTransaction(TransactionDTO transactionDTO);
}
