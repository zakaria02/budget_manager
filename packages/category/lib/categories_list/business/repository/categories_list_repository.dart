import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../add_category/business/dto/category_dto.dart';
import '../data_source/categories_list_data_srouce.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesDataService service = CategoriesDataService();
  @override
  Future<List<CategoryDTO>?> getCategories() async {
    try {
      QuerySnapshot? categories = await service.getCategories();
      var data = categories?.docs.first.data() as Map<String, dynamic>?;
      if (data != null) {
        return data["categories"]
            .map<CategoryDTO>((category) =>
                CategoryDTO.fromJson(category as Map<String, dynamic>))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

abstract class CategoriesRepository {
  Future<List<CategoryDTO>?> getCategories();
}
