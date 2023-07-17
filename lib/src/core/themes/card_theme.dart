import 'package:flutter/material.dart' show CardTheme, RoundedRectangleBorder;

import '../utils/utils.dart';

final class AppCardTheme {
  // Static Instance
  static final instance = AppCardTheme._();
  AppCardTheme._();

  final CardTheme theme = CardTheme(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: RoundedShape.medium,
    ),
  );
}
