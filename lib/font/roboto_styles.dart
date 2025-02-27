// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

mixin AppStyleRoboto {

  static TextStyle kFontW3 = GoogleFonts.roboto(
    fontWeight: FontWeight.w300,
    color: AppColors.textColor,
    fontSize: 18,
  );

  static TextStyle kFontW4 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    fontSize: 18,
  );

  static TextStyle kFontW5 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
    fontSize: 18,
  );

  static TextStyle kFontW6 = GoogleFonts.roboto(
    color: AppColors.textColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kFontW7 = GoogleFonts.roboto(
    color: AppColors.textColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
