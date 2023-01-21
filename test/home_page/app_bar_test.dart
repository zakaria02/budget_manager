import 'package:budget_manager/home_page/feature/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unicons/unicons.dart';

import '../widgets_cover.dart';

homePageAppBarWidgetTest() {
  testWidgets(
    'App bar contains menu icone, setting icone and datePicker',
    (tester) async {
      Widget testWidget = widgetCover(const HomePageAppBar());
      await tester.pumpWidget(
        testWidget,
      );
      final menuIcon = find.byIcon(UniconsLine.bars);
      final decrementMonth = find.byIcon(UniconsLine.angle_left_b);
      final incrementMonth = find.byIcon(UniconsLine.angle_right_b);
      final settingsIcon = find.byIcon(UniconsLine.setting);

      expect(menuIcon, findsOneWidget);
      expect(decrementMonth, findsOneWidget);
      expect(incrementMonth, findsOneWidget);
      expect(settingsIcon, findsOneWidget);
    },
  );
}
