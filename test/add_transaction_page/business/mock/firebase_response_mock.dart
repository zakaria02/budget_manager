import 'package:budget_manager/utils/model/firebase_response.dart';

FirebaseResponse successResponse =
    FirebaseResponse(success: true, message: "Transaction added succefully");

FirebaseResponse errorResponse =
    FirebaseResponse(success: false, message: "Error while adding transaction");
