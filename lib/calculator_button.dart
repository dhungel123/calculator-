import 'package:flutter/material.dart';

import 'custom_theme.dart';

class CalculatorButton extends StatelessWidget {
  final double width;
  const CalculatorButton({super.key, required this.label,this.textColor = CustomTheme.textColor, this.width=80, this.backgroundColor=CustomTheme.primaryColor, this.onPressed, this.height=80});
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final double height;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: backgroundColor,
            boxShadow:[ BoxShadow(
                color: CustomTheme.shadowColor1,
                offset: Offset(2,4),
                blurRadius: 4,
                spreadRadius: 4
            ),
              BoxShadow(
                  color: CustomTheme.shadowColor2,
                  offset: Offset(-2,-4),
                  blurRadius: 4,
                  spreadRadius: 4
              ),
            ]
        ),

        alignment: Alignment.center,
        child: Text(label,style: TextStyle(
            fontSize: 32,
            color: textColor,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
