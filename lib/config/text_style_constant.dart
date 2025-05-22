import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_apps/config/const.dart';
class TextStyleConstant {
  // static const boldFontWeight = FontWeight.w700;
  // static const demiBoldFontWeight = FontWeight.w600;
  // static const mediumFontWeight = FontWeight.w500;
  // static const regularFontWeight = FontWeight.w400;

  // Heading 1
  // static final heading1FontSize = 31.00;
  static TextStyle heading1Bold(BuildContext context) => TextStyle(
        fontSize: 28.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading1DemiBold(BuildContext context) => TextStyle(
        fontSize: 28.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle heading1Medium(BuildContext context) => TextStyle(
        fontSize: 28.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading1Regular(BuildContext context) => TextStyle(
        fontSize: 28.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading1RegularW500(BuildContext context) => TextStyle(
        fontSize: 28.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Heading 2
  // static final heading1FontSize = 24.00;
  static TextStyle heading2Bold(BuildContext context) => TextStyle(
        fontSize: 24.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading2DemiBold(BuildContext context) => TextStyle(
        fontSize: 24.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle heading2Medium(BuildContext context) => TextStyle(
        fontSize: 24.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading2Regular(BuildContext context) => TextStyle(
        fontSize: 24.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading2RegularW500(BuildContext context) => TextStyle(
        fontSize: 24.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w500,
      );

  // Heading 3
  // static final heading3FontSize = 22.00;
  static TextStyle heading3Bold(BuildContext context) => TextStyle(
        fontSize: 22.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading3DemiBold(BuildContext context) => TextStyle(
        fontSize: 22.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle heading3Medium(BuildContext context) => TextStyle(
        fontSize: 22.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading3Regular(BuildContext context) => TextStyle(
        fontSize: 22.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading3RegularW500(BuildContext context) => TextStyle(
        fontSize: 22.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Heading 4
  // static final heading4FontSize = 18.00;
  static TextStyle heading4Bold(BuildContext context) => TextStyle(
        fontSize: 18.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading4DemiBold(BuildContext context) => TextStyle(
        fontSize: 18.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle heading4Medium(BuildContext context) => TextStyle(
        fontSize: 18.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading4Regular(BuildContext context) => TextStyle(
        fontSize: 18.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading4RegularW500(BuildContext context) => TextStyle(
        fontSize: 18.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Heading 5
  // static final heading5FontSize = 14.00;
  static TextStyle heading5Bold(BuildContext context) => TextStyle(
        fontSize: 14.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading5DemiBold(BuildContext context) => TextStyle(
        fontSize: 14.0.w,
        // fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        fontWeight: FontWeight.w600,
      );
  static TextStyle heading5Medium(BuildContext context) => TextStyle(
        fontSize: 14.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading5Regular(BuildContext context) => TextStyle(
        fontSize: 14.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading5RegularW500(BuildContext context) => TextStyle(
        fontSize: 14.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Heading 6
  // static final heading6FontSize = 12.00;
  static TextStyle heading6Bold(BuildContext context) => TextStyle(
        fontSize: 12.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle heading6DemiBold(BuildContext context) => TextStyle(
        fontSize: 12.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle heading6Medium(BuildContext context) => TextStyle(
        fontSize: 12.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle heading6Regular(BuildContext context) => TextStyle(
        fontSize: 12.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle heading6RegularW500(BuildContext context) => TextStyle(
        fontSize: 12.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Paragraph / Body
  // static final paragraphBodyFontSize = 13.00;
  static TextStyle paragraphBodyBold(BuildContext context) => TextStyle(
        fontSize: 13.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle paragraphBodyDemiBold(BuildContext context) => TextStyle(
        fontSize: 13.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle paragraphBodyMedium(BuildContext context) => TextStyle(
        fontSize: 13.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle paragraphBodyRegular(BuildContext context) => TextStyle(
        fontSize: 13.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle paragraphBodyRegularW500(BuildContext context) => TextStyle(
        fontSize: 13.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );

  // Subtitle
  // static final subtitleFontSize = 11.00;
  static TextStyle subtitleBold(BuildContext context) => TextStyle(
        fontSize: 11.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w800 : FontWeight.w700,
      );
  static TextStyle subtitleDemiBold(BuildContext context) => TextStyle(
        fontSize: 11.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.w600,
        // fontWeight: FontWeight.w600,
      );
  static TextStyle subtitleMedium(BuildContext context) => TextStyle(
        fontSize: 11.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
  static TextStyle subtitleRegular(BuildContext context) => TextStyle(
        fontSize: 11.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.w400,
      );
  static TextStyle subtitleRegularW500(BuildContext context) => TextStyle(
        fontSize: 11.0.w,
        fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w500,
      );
}
