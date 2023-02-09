import '../../add_transaction_page/business/di/add_transaction_module.dart';
import '../../business/auth/di/auth_module.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

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
