import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../utils/string.dart';
import 'app_text.dart';

class AppTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? label;
  final String? obscuringCharacter;
  final int? lines;
  final Widget? titleWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final TextInputAction? action;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool? password;
  final double? vPadding;
  final EdgeInsetsGeometry? hPadding;
  final bool isExpanded;
  final bool enabled;
  final Color? fillColor;
  final TextStyle? customText;
  final Color? borderSideColor;
  final Color? hintTextColor;
  final Color? backGroundColor;
  final Color? bordarColor;
  final double? sizedBoxWidth;
  final double? borderWidth;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final FontWeight? titleWeight;
  final VoidCallback? onClickSuffix;
  final bool obscureText;
  final globalkey;
  final String? fontFamily;
  final bool? showError;
  final EdgeInsets? onlyPadding;
  final double? height;
  final EdgeInsets? scrollPadding;
  final String? prefixIconPath;
  final Color? prefixIconFocusedColor;
  final Color? prefixIconUnfocusedColor;
  final String? suffixIconPath;
  final Color? suffixIconFocusedColor;
  final Color? suffixIconUnfocusedColor;
  final bool readOnly;
  final bool isRequired;
  final bool isSocialField;

  const AppTextField(
      {super.key,
        this.title,
        this.hint,
        this.label,
        this.obscuringCharacter,
        this.vPadding,
        this.onChanged,
        this.onSubmitted,
        this.lines,
        this.titleWidget,
        this.action,
        this.inputType,
        this.validator,
        this.password,
        this.focusNode,
        this.suffix,
        this.sizedBoxWidth,
        this.borderWidth,
        this.fillColor,
        this.isExpanded = true,
        this.customText,
        this.enabled = true,
        this.hPadding,
        this.borderSideColor,
        this.backGroundColor,
        this.bordarColor,
        this.height,
        this.hintTextColor,
        this.controller,
        this.textCapitalization = TextCapitalization.none,
        this.inputFormatters,
        this.borderRadius,
        this.titleWeight,
        this.prefixIcon,
        this.obscureText = false,
        this.globalkey,
        this.onClickSuffix,
        this.fontFamily,
        this.showError,
        this.scrollPadding,
        this.onlyPadding,
        this.prefixIconPath,
        this.prefixIconFocusedColor,
        this.prefixIconUnfocusedColor,
        this.suffixIconPath,
        this.suffixIconFocusedColor,
        this.suffixIconUnfocusedColor,
        this.isRequired = false,
        this.readOnly = false,
        this.isSocialField = false});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _effectiveFocusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode = widget.focusNode ?? FocusNode();
    _effectiveFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() => _isFocused = _effectiveFocusNode.hasFocus);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) _effectiveFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMultiline = widget.lines != null && widget.lines! > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: isMultiline ? widget.height : (widget.height ?? 56.h),
          decoration: BoxDecoration(
            color: widget.backGroundColor ?? Colors.transparent
          ),
          alignment: isMultiline ? null : Alignment.center,
          child: TextFormField(
            readOnly: widget.readOnly,
            textAlign: TextAlign.left,
            autofocus: false,
            obscuringCharacter: widget.obscuringCharacter ?? "*",
            cursorHeight: isMultiline ? null : 24.h,
            scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
            enabled: widget.enabled,
            controller: widget.controller,
            obscureText: widget.password ?? false,
            validator: widget.validator,
            focusNode: _effectiveFocusNode,
            maxLines: widget.lines ?? 1,
            cursorColor: Colors.black.withOpacity(0.7),
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              contentPadding: widget.hPadding ??
                  (isMultiline
                      ? EdgeInsets.symmetric(
                      horizontal: 20, vertical: widget.vPadding ?? 16)
                      : EdgeInsets.symmetric(
                      horizontal: 20, vertical: widget.vPadding ?? 0)),
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: widget.hintTextColor ?? AppColors.greyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: widget.fontFamily ?? Strings.FONT_FAMILY_Manrope,
              ),
              fillColor: widget.fillColor ?? AppColors.appBackgroundColor,
              filled: true,
              prefixIcon: widget.prefixIconPath == null
                  ? null
                  : Image.asset(
                widget.prefixIconPath!,
                height: 22.h,
                width: 22.w,
              ),
              prefixIconConstraints:
              BoxConstraints(maxWidth: 50.w, minWidth: 50.w),
              suffixIconConstraints:
              BoxConstraints(maxWidth: 50.w, minWidth: 50.w),
              suffixIcon: widget.suffixIconPath == null
                  ? null
                  : widget.isSocialField
                  ? GestureDetector(
                onTap: widget.onClickSuffix,
                child: Image.asset(
                  widget.suffixIconPath!,
                  height: 22.h,
                  width: 22.w,
                ),
              ) : GestureDetector(
                onTap: widget.onClickSuffix,
                child: Image.asset(
                  widget.suffixIconPath!,
                  height: 22.h,
                  width: 22.w,
                ),
              ),
              border: InputBorder.none,
              focusedErrorBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.2.w,
                  color: widget.showError == true
                      ? AppColors.black
                      : AppColors.blackColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.2.w,
                  color: AppColors.themeColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              ),
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.2.w,
                  color: AppColors.greyColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              ),
              disabledBorder: InputBorder.none,
            ),
            style: widget.customText ??
                TextStyle(
                  color: widget.hintTextColor ?? AppColors.blackColor,
                  fontSize: 16,
                  fontFamily: widget.fontFamily ?? Strings.FONT_FAMILY_Manrope,
                  fontWeight: FontWeight.w400,
                ),
            keyboardType: widget.inputType ??
                (isMultiline ? TextInputType.multiline : TextInputType.name),
            textInputAction:
            widget.action ?? (isMultiline ? null : TextInputAction.done),
          ),
        ),
      ],
    );
  }
}
