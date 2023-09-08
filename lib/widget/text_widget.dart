import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final double fontSize;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double? height;
  final double? wordSpacing;

  const TextWidget({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
    required this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.textDecoration,
    this.textAlign,
    this.textOverflow,
    this.height,
    this.backgroundColor,
    this.wordSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        backgroundColor: backgroundColor,
        height: height,
        wordSpacing: wordSpacing,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        overflow: textOverflow,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
