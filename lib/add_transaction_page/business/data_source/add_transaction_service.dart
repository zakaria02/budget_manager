import '../../feature/model/transaction_uio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../dtos/transaction_dto.dart';

class AddTransactionService {
  Future<TransactionDTO?> addTransaction(TransactionUIO transaction) async {
    try {
      return null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
