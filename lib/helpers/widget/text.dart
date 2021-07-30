import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//single line text widget
Widget sText(String text, Color color, double size, FontWeight weight) {
  return Text(
    text,
    style:
        GoogleFonts.openSans(color: color, fontWeight: weight, fontSize: size),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

//multilie line text widget
Widget mText(String text, Color color, double size, FontWeight weight) {
  return Text(
    text,
    style:
        GoogleFonts.openSans(color: color, fontWeight: weight, fontSize: size),
  );
}

//limited line text widget
Widget lText(
    String text, Color color, double size, FontWeight weight, int line) {
  return Text(
    text,
    style:
        GoogleFonts.openSans(color: color, fontWeight: weight, fontSize: size),
    maxLines: line,
    overflow: TextOverflow.ellipsis,
  );
}
