import 'package:flutter_simple_dependency_injection/Injector.dart';

abstract class AbstractModule {
  late Injector injector;
  void configure(Injector injector);

  AbstractModule() {
    injector = Injector();
  }
  T get<T>({String? key, Map<String, dynamic>? additionalParameters}) {
    return injector.get(key: key, additionalParameters: additionalParameters);
  }
}
