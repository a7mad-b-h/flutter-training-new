import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({super.key,
  required this.text,
  required this.textColor,
  required this.bgColor,
  });
  final String text;
  final Color textColor;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(16),
      child: Text(this.text,
      style: TextStyle(
        color: textColor,
        fontSize: 30
      )
      ,),
    );
  }
}
