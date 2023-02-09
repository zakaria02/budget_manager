import 'package:add_transaction/add_transaction.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../auth/di/auth_module.dart';
import 'abstract_module.dart';

class MainModule extends AbstractModule {
  static final MainModule _mainModule = MainModule._internal();

  factory MainModule() {
    return _mainModule;
  }

  MainModule._internal() {
    configure(injector);
  }

  @override
  void configure(Injector injector) {
    AuthModule().configure(injector);
    AddTransactionModule().configure(injector);
  }
}
