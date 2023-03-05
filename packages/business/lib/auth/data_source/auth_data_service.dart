import 'package:firebase_auth/firebase_auth.dart';
import '../../init_data/repository/init_data_repository.dart';
import '../dto/user_dto.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  InitDataRepository initDataRepository = InitDataRepositoryImpl();

  Stream<UserDto> retrieveCurrentUser() {
    return auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserDto(uid: user.uid);
      } else {
        return UserDto(uid: "uid");
      }
    });
  }

  Future<UserCredential?> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      if (userCredential.user != null) {
        initDataRepository.initCategories(userCredential.user!.uid);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
