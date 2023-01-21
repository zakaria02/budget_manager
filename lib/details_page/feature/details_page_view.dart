import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import 'components/body.dart';

class BudgetDetailsPageView extends StatelessWidget {
  const BudgetDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: BudgetDetailsPageBody(),
    );
  }
}
