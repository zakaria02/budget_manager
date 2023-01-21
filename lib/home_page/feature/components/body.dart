import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../details_page/details_page.dart';
import '../bloc/navigation/navigation_cubit.dart';
import '../components/components.dart';
import '../../../summary_page//summary_page.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageNavCubit, HomePageNavState>(
      builder: (context, navigationState) {
        return SafeArea(
          child: Column(
            children: [
              const HomePageAppBar(),
              Expanded(
                child: navigationState.index == 0
                    ? const BudgetSummaryPageView()
                    : const BudgetDetailsPageView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
