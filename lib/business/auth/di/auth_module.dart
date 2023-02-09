import 'package:flutter_simple_dependency_injection/Injector.dart';

import '../../di/abstract_module.dart';
import '../business_auth.dart';

class AuthModule extends AbstractModule {
  static final AuthModule _authModule = AuthModule._internal();

  factory AuthModule() {
    return _authModule;
  }

  AuthModule._internal();

  @override
  void configure(Injector injector) {
    injector.map<AuthenticationService>((i) => AuthenticationService(),
        isSingleton: true);
    injector.map<AuthenticationRepository>(
        (i) => AuthenticationRepositoryImpl(),
        isSingleton: true);
  }
}
