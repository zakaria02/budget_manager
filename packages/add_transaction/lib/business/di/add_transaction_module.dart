import 'package:business/business.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

import '../../business/business.dart';

class AddTransactionModule extends AbstractModule {
  static final AddTransactionModule _addTransactionModule =
      AddTransactionModule._internal();

  factory AddTransactionModule() {
    return _addTransactionModule;
  }

  AddTransactionModule._internal();

  @override
  void configure(Injector injector) {
    injector.map<AddTransactionService>((i) => AddTransactionService(),
        isSingleton: true);
    injector.map<AddTransactionRepository>(
        (i) => AddTransactionRepositoryImpl(),
        isSingleton: true);
  }
}
