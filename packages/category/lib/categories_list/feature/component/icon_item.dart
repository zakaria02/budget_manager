import 'package:add_transaction/add_transaction.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_category/feature/model/category_uio.dart';

class IconItem extends StatelessWidget {
  final CategoryUIO categoryUIO;

  const IconItem({super.key, required this.categoryUIO});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, addTransactionState) {
        return InkWell(
          onTap: () {
            context
                .read<AddTransactionBloc>()
                .add(CategoryChange(category: categoryUIO));
            Navigator.of(context).pop();
          },
          child: Flex(
            direction: Axis.vertical,
            children: [
              Icon(
                categoryUIO.icon,
                size: 32,
                color: categoryUIO.color,
              ),
              const SizedBox(
                height: innerPadding,
              ),
              Text(
                categoryUIO.name,
                style: body,
              )
            ],
          ),
        );
      },
    );
  }
}
