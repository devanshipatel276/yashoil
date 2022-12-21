import 'package:flutter/services.dart';
import 'package:yash_oil/app/core/widgets/custom_input_formatter.dart';
import 'package:yash_oil/util/common_widget.dart';

import '../../../util/exports.dart';

//ignore: camel_case_types, must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String label;
  final double radius;
  final FormFieldValidator? validator;
  final bool autoFocus;
  final TextEditingController controller;
  final ValueChanged<String>? onChange;
  final TextInputType? textInputType;
  final Widget? prefix;
  final String? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final Function()? suffixOnClick;
  final String? hint;
  TextStyle? hintStyle;

  final TextInputAction? input;
  final bool? obscureText;
  final Size? prefixIconSize;
  final Size? suffixIconSize;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Key? key1;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final String? suffixIcon;
  final bool? isEditable;
  final Color borderColor;
  final Color? prefixIconColor;
  final TextStyle? errorStyle;
  final Function(String)? onTextSubmit;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? cursorColor;

  CustomTextFormField({
    required this.controller,
    this.key1,
    this.maxLength,
    this.label = "",
    this.errorStyle,
    this.radius = 40,
    this.validator,
    this.hintStyle,
    this.prefixIconColor,
    this.autoFocus = false,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.prefix,
    this.cursorColor,
    this.input,
    this.isEditable,
    this.prefixIcon,
    this.obscureText = false,
    this.hint,
    this.suffix,
    this.style,
    this.suffixIcon,
    this.borderColor = AppColors.secondaryPurpleColor,
    this.inputFormatters,
    this.maxLines = 1,
    this.onTextSubmit,
    this.prefixIconConstraints = const BoxConstraints(
        minWidth: 25, minHeight: 25, maxWidth: 50, maxHeight: 50),
    this.contentPadding = const EdgeInsets.all(0),
    this.suffixIconConstraints = const BoxConstraints(
        minWidth: 25, minHeight: 25, maxWidth: 50, maxHeight: 50),
    this.prefixIconSize =
        const Size(AppConstant.prefixIconSize, AppConstant.prefixIconSize),
    this.suffixIconSize =
        const Size(AppConstant.suffixIconSize, AppConstant.suffixIconSize),
    this.suffixOnClick,
    this.fillColor = AppColors.orangeBackGroundColor,
  }) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        onChanged: onChange,
        autofocus: autoFocus,
        onFieldSubmitted: (submit) => onTextSubmit != null
            ? onTextSubmit?.call(submit)
            : (input == TextInputAction.next
                ? FocusScope.of(context).nextFocus()
                : null),
        inputFormatters: inputFormatters ??
            ([
              NoLeadingSpaceFormatter(),
              NoLeadingNextLineFormatter(),
              FilteringTextInputFormatter.singleLineFormatter,
              LengthLimitingTextInputFormatter(maxLength)
            ]),
        style: style ?? AppStyles.textRegular,
        maxLines: maxLines,
        enabled: isEditable,
        maxLength: maxLength,
        cursorColor: cursorColor,
        obscureText: obscureText!,
        decoration: InputDecoration(
          // counterText: '',
          suffixIconConstraints: suffixIconConstraints,
          prefixIconConstraints: prefixIconConstraints,
          prefix: prefix,
          errorStyle: errorStyle ?? AppStyles.textRegular,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon.isNotNullOrEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 8),
                  child: loadAsset(
                      path: prefixIcon ?? "",
                      size: prefixIconSize,
                      color: prefixIconColor),
                )
              : const SizedBox(width: 0, height: 0),
          fillColor: fillColor,
          filled: true,
          suffix: suffix,
          suffixIcon: suffixIcon.isNotNullOrEmpty
              ? GestureDetector(
                  onTap: suffixOnClick,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14.0, left: 8),
                    child: loadAsset(
                        path: suffixIcon ?? "",
                        size: prefixIconSize,
                        color: prefixIconColor),
                  ),
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          hintStyle: hintStyle,
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor),
          ),
          errorMaxLines: 3,
        ));
  }
}
