import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import 'compenents/components.dart';

class AddTransactionView extends StatelessWidget {
  const AddTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: AddTransactionBody(),
    );
  }
}
