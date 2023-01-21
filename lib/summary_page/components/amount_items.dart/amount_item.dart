import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../../styles/styles.dart';
import '../../models/amount.dart';

class AmountItem extends StatelessWidget {
  final Amount amount;
  const AmountItem({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          amount.name,
          style: h2,
        ),
        const SizedBox(
          height: 3,
        ),
        const ItemsDash(),
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: Text(
            "\$ ${amount.value}",
            style: value,
          ),
        ),
      ],
    );
  }
}

class ItemsDash extends StatelessWidget {
  const ItemsDash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dash(
      direction: Axis.horizontal,
      dashLength: 5,
      length: 80,
      dashColor: black,
    );
  }
}
