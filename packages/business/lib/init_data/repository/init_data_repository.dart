import 'package:common/common.dart';

import '../data_source/init_data_ds.dart';

class InitDataRepositoryImpl implements InitDataRepository {
  InitDataService service = InitDataService();
  @override
  Future<FirebaseResponse> initCategories(String uid) {
    try {
      return service.initCategories(uid);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

abstract class InitDataRepository {
  Future<FirebaseResponse> initCategories(String uid);
}
