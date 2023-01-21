import 'package:flutter/material.dart';
import 'components/components.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePageBody(),
      bottomNavigationBar: HomePageBottomBar(),
      floatingActionButton: const HomePageFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
