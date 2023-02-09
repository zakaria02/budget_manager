import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OptionTransaction extends StatelessWidget {
  final String title;
  final String data;
  final bool activeData;
  final VoidCallback onPress;
  final bool enabled;

  const OptionTransaction({
    super.key,
    required this.title,
    required this.data,
    this.activeData = true,
    required this.onPress,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPress : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 17),
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
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
