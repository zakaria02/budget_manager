import 'package:flutter/material.dart';

class HomePageFAB extends StatelessWidget {
  const HomePageFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.pink,
      child: const Icon(
        Icons.add,
        size: 25,
      ),
    );
  }
}
