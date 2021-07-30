import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    required this.texth,
    required this.textp,
  });

  final String texth, textp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          textp,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color(0xffa69cb7),
          ),
        ),
        Spacer(flex: 2),
        Text(
          texth,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Color(0xffa69cb7),
          ),
        ),
      ],
    );
  }
}
