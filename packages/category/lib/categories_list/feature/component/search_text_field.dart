import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../bloc/categories_list_bloc.dart';

class CategoriesSearch extends StatelessWidget {
  const CategoriesSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListBloc, CategoriesListState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(innerPadding),
          child: CupertinoSearchTextField(
            onChanged: (category) {
              if (category.isEmpty) {
                FocusScope.of(context).unfocus();
              }
              context
                  .read<CategoriesListBloc>()
                  .add(CategoriesListFilter(category));
            },
            autocorrect: true,
            prefixIcon: const Icon(UniconsLine.search),
            suffixIcon: const Icon(UniconsLine.times_circle),
          ),
        );
      },
    );
  }
}
