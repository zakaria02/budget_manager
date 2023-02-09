import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_details/transaction_details.dart';
import 'package:transaction_summary/transaction_summary.dart';

import '../bloc/navigation/navigation_cubit.dart';
import 'app_bar.dart';

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
