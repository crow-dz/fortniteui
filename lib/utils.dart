import 'dart:ui';

Color convertHexToInt(String hexColor) {
  return Color(int.parse(hexColor.replaceFirst('0x', ''), radix: 16));
}
