import 'package:flutter/material.dart';

class ShowInfoButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final void Function() onPressed;
  const ShowInfoButtonWidget({super.key, required this.text, required this.textStyle, required this.backgroundColor, required this.borderColor, required this.onPressed,});
  @override Widget build(BuildContext context,) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: 288.0, height: 52.0,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor,),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor,),
            ),
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
