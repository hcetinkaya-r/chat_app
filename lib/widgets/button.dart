import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  final Color inColor;
  final double elevation;
  final Color shadowColor;
  final double radius;
  final Function function;
  final Widget child;

  const Button(
      {this.fontSize,
      this.textColor,
      this.buttonColor,
      this.width,
      this.height,
      this.inColor,
      this.elevation,
      this.shadowColor,
      this.radius,
      this.function,
      this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize, color: textColor),
        primary: buttonColor,
        minimumSize: Size(width, height),
        onPrimary: inColor,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
      onPressed: function,
      child: child,
    );
  }
}
