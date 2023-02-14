import '../../business/repository/categories_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_category/feature/model/category_uio.dart';
import '../../../add_category/feature/model/mapper/category_mapper.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc() : super(const CategoriesListInitial([], [])) {
    on<CategoriesListFilter>(_onCategoriesListFilter);
    on<CategoriesFetchData>(((event, emit) async {
      await _onCategoriesFetchData(event, emit);
    }));
  }

  void _onCategoriesListFilter(
      CategoriesListFilter event, Emitter<CategoriesListState> emit) {
    if (state is CategoriesListSuccess) {
      emit((state as CategoriesListSuccess).copyWith(filter: event.category));
    }
  }

  Future<void> _onCategoriesFetchData(
      CategoriesFetchData event, Emitter<CategoriesListState> emit) async {
    CategoriesRepository categoriesRepository = CategoriesRepositoryImpl();
    emit(CategoriesListLoading(state.allCategories, state.listedCategories));
    List<CategoryUIO>? categories = (await categoriesRepository.getCategories())
        ?.map((categoryDto) => categoryDto.toCategoryUIO())
        .toList();
    if (categories != null) {
      emit(CategoriesListSuccess(categories, categories));
    } else {
      emit(const CategoriesListFailure([], []));
    }
  }
}
