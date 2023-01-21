import 'package:budget_manager/home_page/feature/components/components.dart';
import 'package:budget_manager/summary_page/feature/summary_page_view.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          HomePageAppBar(),
          Expanded(
            child: BudgetSummaryPageView(),
          ),
        ],
      ),
    );
  }
}
