import 'package:flutter/material.dart';

import '../bloc/categories_list_bloc.dart';
import 'search_text_field.dart';
import 'categories_grid_view.dart';
import 'rounded_button.dart';
import 'package:common/style/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bar.dart';

class CategoriesListBody extends StatelessWidget {
  const CategoriesListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListBloc, CategoriesListState>(
      builder: (context, categoriesListState) {
        return SafeArea(
          child: Column(
            children: [
              const CategoriesListAppBar(),
              if (categoriesListState is CategoriesListLoading)
                const LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primary),
                ),
              const SizedBox(
                height: innerPadding,
              ),
              const CategoriesSearch(),
              const CategoriesGridView(),
              RoundedButton(text: "CREATE NEW", press: () {})
            ],
          ),
        );
      },
    );
  }
}
