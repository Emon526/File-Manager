import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//single line text widget

class SingleLineText extends StatelessWidget {
  final String text;
  final Color color;
  final bool isTitle;
  const SingleLineText(
      {required this.text,
      this.isTitle = true,
      this.color = AppColor.primaryTextColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Text(
            text,
            style: GoogleFonts.openSans(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            text,
            style: GoogleFonts.openSans(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
  }
}

//multilie line text widget

class MultiLineText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const MultiLineText(
      {required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

//limited line text widget

class LimitedLineText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int lines;
  const LimitedLineText(
      {required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.lines,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
