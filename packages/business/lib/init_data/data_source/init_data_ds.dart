import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';

class InitDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseResponse> initCategories(String uid) async {
    return await _firestore
        .collection("utilisateurs")
        .doc(uid)
        .collection(
          "categories",
        )
        .add({
      "categories":
          categoriesInitList.map((category) => category.toJson()).toList(),
    }).then((value) {
      return FirebaseResponse(success: true, message: "");
    }).catchError((error) {
      return FirebaseResponse(
        success: false,
        message: "",
      );
    }).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        return FirebaseResponse(
          success: false,
          message: "",
        );
      },
    );
  }
}
