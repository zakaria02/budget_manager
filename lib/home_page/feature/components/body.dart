import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../../summary_page//summary_page.dart';

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
