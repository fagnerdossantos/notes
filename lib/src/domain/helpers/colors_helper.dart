import 'dart:core' show Map, int;
import 'dart:ui' show Color;

import '../../core/utils/colors.dart';

final class ColorsHelper {
  static const Map<int, Color> _colorsMap = {
    0: DefaultColors.white,
    1: DefaultColors.amber,
    2: DefaultColors.purple,
    3: DefaultColors.red,
    4: DefaultColors.blue,
  };

  static int colorToInt({required Color color}) {
    for (var entry in _colorsMap.entries) {
      if (entry.value == color) {
        return entry.key;
      }
    }

    return 0;
  }

  static Color intToColor({required int idColor}) {
    return _colorsMap[idColor] ?? DefaultColors.white;
  }
}
