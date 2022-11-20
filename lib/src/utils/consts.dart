import 'package:flutter/widgets.dart';

// Colors
const Color white = Color.fromRGBO(235, 237, 212, 1);
final Color grey = const Color.fromRGBO(164, 180, 203, 1).withOpacity(0.5);
const Color purple = Color.fromRGBO(142, 101, 171, 1);
const Color red = Color.fromRGBO(168, 5, 7, 1);
const Color blue = Color.fromRGBO(14, 29, 84, 1);
const Color deepBlue = Color.fromRGBO(25, 23, 40, 1);
const Color black = Color.fromRGBO(0, 0, 0, 1);

// Padding
EdgeInsets paddingAll = const EdgeInsets.all(8.0);

// Space
SizedBox verticalSpace({required double space}) => SizedBox(height: space);
SizedBox horizontalSpace({required double space}) => SizedBox(width: space);

// TextStyle
TextStyle textStyle(
        {Color color = white, double size = 20, bool customFamily = false}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontFamily: customFamily ? "Anton" : "roboto");

// Radius
BorderRadius radiusTwenty = BorderRadius.circular(20);
BorderRadius radiusFifty = BorderRadius.circular(50);
