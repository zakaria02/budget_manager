import 'package:business/business.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';

import '../dto/transaction_dto.dart';

class AddTransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseResponse> addTransaction(TransactionDTO transactionDTO) async {
    AuthenticationRepository authenticationRepository =
        AuthModule().get<AuthenticationRepository>();
    final UserDto currentUser =
        await authenticationRepository.getCurrentUser().first;

    return await _firestore
        .collection("utilisateurs")
        .doc(currentUser.uid)
        .collection(
          transactionDTO.type == TransactionType.expenses
              ? "expenses"
              : "income",
        )
        .add(transactionDTO.toJson())
        .then((value) {
      return FirebaseResponse(
          success: true, message: "Transaction added succefully");
    }).catchError((error) {
      return FirebaseResponse(
        success: false,
        message: error.toString(),
      );
    }).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        return FirebaseResponse(
          success: false,
          message: "Error while adding transaction",
        );
      },
    );
  }
}
