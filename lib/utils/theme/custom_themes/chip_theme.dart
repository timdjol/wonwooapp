import 'package:flutter/material.dart';
import 'package:wonwoo/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightTChipTheme = ChipThemeData(
      disabledColor: TColors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: TColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: TColors.white);

  static ChipThemeData darkTChipTheme = const ChipThemeData(
      disabledColor: TColors.darkerGrey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: TColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: TColors.white);
}
