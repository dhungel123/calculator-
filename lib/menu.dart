import 'dart:ui';
import 'package:calculator_app/custom_theme.dart';
import 'package:flutter/material.dart';
class Menu {
  final String  label;
  final Color color;
  final VoidCallback? onPressed;
  Menu( {required this.label,this.onPressed,this.color=CustomTheme.textColor });

}