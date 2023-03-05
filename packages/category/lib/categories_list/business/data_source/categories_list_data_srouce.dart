import 'package:business/business.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot?> getCategories() async {
    AuthenticationRepository authenticationRepository =
        AuthModule().get<AuthenticationRepository>();
    UserDto currentUser = await authenticationRepository.getCurrentUser().first;

    return await _firestore
        .collection("utilisateurs")
        .doc(currentUser.uid)
        .collection("categories")
        .get()
        .catchError((error) {})
        .timeout(const Duration(seconds: 15));
  }
}
