import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'compenent/component.dart';

class AddTransactionView extends StatelessWidget {
  const AddTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: AddTransactionBody(),
    );
  }
}
