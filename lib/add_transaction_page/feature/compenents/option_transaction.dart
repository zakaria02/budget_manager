import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class OptionTransaction extends StatelessWidget {
  final String title;
  final String data;
  final bool activeData;

  const OptionTransaction({
    super.key,
    required this.title,
    required this.data,
    this.activeData = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: black,
                  ),
                ),
                Text(
                  data,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    color: Colors.grey[activeData ? 800 : 500],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
