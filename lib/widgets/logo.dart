import 'package:flutter/material.dart';

class UnisexStyleWidget extends StatelessWidget {
  final Color textColor;

  const UnisexStyleWidget({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'UnisexStyle',
          style: TextStyle(
            fontSize: 48,
            fontFamily: 'DancingScript',
            color: textColor,
          ),
        ),
        Text(
          'Fashion for all',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'DancingScript',
            color: textColor,
          ),
        ),
      ],
    );
  }
}
