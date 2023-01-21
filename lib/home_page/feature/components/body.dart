import 'package:budget_manager/home_page/feature/components/components.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [HomePageAppBar()],
    );
  }
}
