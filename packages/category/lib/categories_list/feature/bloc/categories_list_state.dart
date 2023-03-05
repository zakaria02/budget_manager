part of 'categories_list_bloc.dart';

abstract class CategoriesListState extends Equatable {
  final List<CategoryUIO> allCategories;
  final List<CategoryUIO> listedCategories;

  const CategoriesListState(this.allCategories, this.listedCategories);

  @override
  List<Object> get props => [allCategories, listedCategories];
}

class CategoriesListInitial extends CategoriesListState {
  const CategoriesListInitial(super.allCategories, super.listedCategories);
}

class CategoriesListLoading extends CategoriesListState {
  const CategoriesListLoading(super.allCategories, super.listedCategories);
}

class CategoriesListSuccess extends CategoriesListState {
  const CategoriesListSuccess(super.allCategories, super.listedCategories);

  CategoriesListSuccess copyWith({required String filter}) {
    List<CategoryUIO> listedCategories = [];
    if (filter.isNotEmpty) {
      listedCategories = allCategories
          .where((category) => category.name.contains(filter))
          .toList();
    } else {
      listedCategories = allCategories;
    }
    return CategoriesListSuccess(allCategories, listedCategories);
  }
}

class CategoriesListFailure extends CategoriesListState {
  const CategoriesListFailure(super.allCategories, super.listedCategories);
}
