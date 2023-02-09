import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

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
