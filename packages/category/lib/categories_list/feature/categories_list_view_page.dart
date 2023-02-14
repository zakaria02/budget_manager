import 'component/body.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesListBody(),
    );
  }
}
