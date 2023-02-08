import 'package:budget_manager/summary_page/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unicons/unicons.dart';

import '../widgets_cover.dart';

summaryWidgetTest() {
  testWidgets(
    'MyWidget contains a title, an incomes/expenses table and incomes/expenses details',
    (tester) async {
      Widget testWidget = scaffoldCover(const BudgetSummaryPageView());
      await tester.pumpWidget(
        testWidget,
      );
      final titleFinder = find.text("Summary");
      final incomeFinder = find.text("INCOME");
      final expensesFinder = find.text("EXPENSES");
      final balanceFinder = find.text("BALANCE");
      final noIncomeFinder = find
          .text("You don't have any income for this month. Tap to add one.");
      final noExpensesFinder = find
          .text("You don't have any expenses for this month. Tap to add one.");
      final plusIcon = find.byIcon(UniconsLine.plus);

      expect(titleFinder, findsOneWidget);
      expect(incomeFinder, findsWidgets);
      expect(expensesFinder, findsWidgets);
      expect(balanceFinder, findsOneWidget);
      expect(noIncomeFinder, findsOneWidget);
      expect(noExpensesFinder, findsOneWidget);
      expect(plusIcon, findsWidgets);
    },
  );
}
