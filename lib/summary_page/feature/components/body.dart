import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'amount_items.dart/amount_items_list.dart';
import 'no_data.dart';

class BudgetSummaryBody extends StatelessWidget {
  const BudgetSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: ListView(
        shrinkWrap: true,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            "Summary",
            style: h1,
          ),
          SizedBox(
            height: 30,
          ),
          AmountItemsList(),
          SizedBox(
            height: 30,
          ),
          Text("INCOME", style: h1),
          SizedBox(
            height: 30,
          ),
          NoData(
            isIncome: true,
          ),
          SizedBox(
            height: 30,
          ),
          Text("EXPENSES", style: h1),
          SizedBox(
            height: 30,
          ),
          NoData(
            isIncome: false,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
