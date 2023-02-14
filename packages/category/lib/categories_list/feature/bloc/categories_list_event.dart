part of 'categories_list_bloc.dart';

abstract class CategoriesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesListStarted extends CategoriesListEvent {}

class CategoriesFetchData extends CategoriesListEvent {}

class CategoriesListFilter extends CategoriesListEvent {
  final String category;

  CategoriesListFilter(this.category);
}
