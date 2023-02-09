import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../business/auth/di/auth_module.dart';
import '../../../business/auth/business_auth.dart';
import '../../../utils/model/firebase_response.dart';
import '../dtos/transaction_dto.dart';

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
