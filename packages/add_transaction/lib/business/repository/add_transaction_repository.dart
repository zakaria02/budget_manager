import 'package:common/common.dart';

import '../data_source/add_transaction_service.dart';
import '../dto/transaction_dto.dart';

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
