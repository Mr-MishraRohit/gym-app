import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_apps/config/color_constant.dart';
import 'package:gym_apps/config/text_style_constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    this.radius = 5,
    this.keyboardType,
    this.borderColor = ColorConstant.black45,
    this.fillColor = Colors.white,
    this.boderWidth = 1,
    this.outPadding = 0,
    this.fontSize,
    this.contentPadding,
    this.maxLength,
    this.counter = false,
    this.hint = '',
    this.hintStyle,
    this.obscureText = false,
    this.textAlign,
    this.enabled,
    this.onChange,
    this.validator,
    this.displayError = false,
    this.height,
    this.errorTextStyle,
    this.border,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.isDense = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.textAlignment,
    this.inputFormatter
  });

  final TextEditingController controller;
  double radius;
  Color borderColor;
  bool displayError;
  Color fillColor;
  double boderWidth;
  bool? enabled;
  double? height;
  double? fontSize;
  double outPadding;
  EdgeInsets? contentPadding;
  int? maxLength;
  bool counter;
  bool obscureText;
  String hint;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextAlign? textAlign;
  TextStyle? errorTextStyle;
  List<TextInputFormatter>? inputFormatter;
  int? maxLines;
  Function(String)? onChange;
  String? Function(String?)? validator;
  InputBorder? border;
  bool filled;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? style;
  bool isDense;
  bool readOnly;
  Alignment? textAlignment;
  TextInputAction? textInputAction;
  VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(outPadding),
      child: SizedBox(
        height: height,
        child: TextFormField(
          style: style ?? TextStyleConstant.heading6RegularW500(context),
          controller: controller,
          expands: false,
          cursorColor: ColorConstant.greenGradient7,
          inputFormatters: inputFormatter,
          maxLines: maxLines,
          onChanged: onChange,
          enabled: enabled,
          keyboardType: keyboardType,
          readOnly: readOnly,
          textInputAction: textInputAction,
          autofocus: false,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validator,
          maxLength: maxLength,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
              filled: filled,
              counterText:  counter ? null : '',
              contentPadding: contentPadding,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              suffixIconConstraints: BoxConstraints(
                maxWidth: 110
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 110
              ),
              suffixIcon: suffixIcon,
              enabledBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor,
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              disabledBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor.withOpacity(0.2),
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              focusedBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorConstant.greenGradient7,
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              border: border ?? OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstant.black45),
                  borderRadius: BorderRadius.circular(radius)),
              // errorText: '',
              errorStyle:  displayError ? errorTextStyle ?? TextStyleConstant.heading6RegularW500(context) : TextStyle(fontSize: 0),
              hintText: hint,
              isDense: isDense,
              hintStyle: hintStyle
          ),
        ),
      ),
    );
  }
}
