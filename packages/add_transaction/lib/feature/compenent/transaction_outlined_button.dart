import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TransactionOutlinedButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final bool isSelected;
  final VoidCallback? onPress;

  const TransactionOutlinedButton({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.isSelected,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        backgroundColor: white,
        side: BorderSide(color: isSelected ? color : white, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: textButton,
          ),
        ],
      ),
    );
  }
}
