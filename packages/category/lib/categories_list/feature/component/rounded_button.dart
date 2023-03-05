import 'package:common/common.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final VoidCallback? press;
  const RoundedButton({
    Key? key,
    required this.text,
    this.color = buttonColor,
    this.textColor = Colors.white,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: _newElevatedButton(context),
      ),
    );
  }

  Widget _newElevatedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: mainPadding,
        right: mainPadding,
        bottom: mainPadding,
      ),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            letterSpacing: 2.0,
          ),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
