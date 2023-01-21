import 'package:firebase_auth/firebase_auth.dart';

import '../dtos/user_dto.dart';
import '../data_source/auth_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // Remember to add DI for this one
  AuthenticationService service = AuthenticationService();

  @override
  Stream<UserDto> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signIn(UserDto user) {
    try {
      return service.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }
}

abstract class AuthenticationRepository {
  Stream<UserDto> getCurrentUser();
  Future<UserCredential?> signIn(UserDto user);
  Future<void> signOut();
}
