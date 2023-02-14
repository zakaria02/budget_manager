import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/categories_list_bloc.dart';
import 'icon_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListBloc, CategoriesListState>(
      builder: (context, categorisListState) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: mainPadding,
              right: mainPadding,
              top: mainPadding,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
              ),
              itemCount: categorisListState.listedCategories.length,
              itemBuilder: ((context, i) {
                return IconItem(
                    categoryUIO: categorisListState.listedCategories[i]);
              }),
            ),
          ),
        );
      },
    );
  }
}
