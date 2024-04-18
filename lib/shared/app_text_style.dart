import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const String fontFamily = 'CerebriSans';

  /// Base text style
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: AppFontWeight.regular,
    letterSpacing: -0.3,
    color: Colors.black,
  );

  ///CerebriSans 10
  static TextStyle get regular10 => _baseTextStyle.copyWith(fontSize: 10);

  ///CerebriSans medium 10
  static TextStyle get medium10 =>
      regular10.copyWith(fontWeight: AppFontWeight.medium);

  ///CerebriSans 12
  static TextStyle get regular12 => _baseTextStyle.copyWith(fontSize: 12);

  ///CerebriSans bold 12
  static TextStyle get bold12 =>
      regular12.copyWith(fontWeight: AppFontWeight.bold);

  ///CerebriSans medium 14
  static TextStyle get medium14 => regular10.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 14,
      );

  ///CerebriSans medium 16
  static TextStyle get medium16 => regular10.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 16,
      );

  ///CerebriSans 14
  static TextStyle get regular14 => _baseTextStyle.copyWith(fontSize: 14);

  ///CerebriSans light 14
  static TextStyle get light14 =>
      regular14.copyWith(fontWeight: AppFontWeight.light);

  ///CerebriSans semibold 14
  static TextStyle get semibold14 =>
      regular14.copyWith(fontWeight: AppFontWeight.semiBold);

  ///CerebriSans bold 14
  static TextStyle get bold14 =>
      regular14.copyWith(fontWeight: AppFontWeight.bold);

  ///CerebriSans 16
  static TextStyle get regular16 => _baseTextStyle.copyWith(fontSize: 16);

  ///CerebriSans bold 16
  static TextStyle get bold16 =>
      regular16.copyWith(fontWeight: AppFontWeight.bold);

  ///CerebriSans 18
  static TextStyle get regular18 => _baseTextStyle.copyWith(fontSize: 18);

  ///CerebriSans semibold 18
  static TextStyle get semibold18 =>
      regular18.copyWith(fontWeight: AppFontWeight.semiBold);

  ///CerebriSans bold 18
  static TextStyle get bold18 =>
      regular18.copyWith(fontWeight: AppFontWeight.bold);

  ///CerebriSans 20
  static TextStyle get regular20 => _baseTextStyle.copyWith(fontSize: 20);

  ///CerebriSans semibold 20
  static TextStyle get semibold20 =>
      regular20.copyWith(fontWeight: AppFontWeight.semiBold);

  ///CerebriSans bold 20
  static TextStyle get bold20 =>
      regular20.copyWith(fontWeight: AppFontWeight.bold);

  ///CerebriSans bold 24
  static TextStyle get semibold24 => regular20.copyWith(
        fontWeight: AppFontWeight.semiBold,
        fontSize: 24,
      );
}

abstract class AppFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
