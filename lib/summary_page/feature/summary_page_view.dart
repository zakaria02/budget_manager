import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import 'components/body.dart';

class BudgetSummaryPageView extends StatelessWidget {
  const BudgetSummaryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: BudgetSummaryBody(),
    );
  }
}
