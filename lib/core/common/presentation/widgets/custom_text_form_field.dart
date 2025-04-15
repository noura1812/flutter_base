import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

typedef StringOrNullTransformer = String? Function(String? input);

enum FormTextFieldType { textField, dropdownField }

class CustomTextFormField extends StatefulWidget {
  final double? width;
  final String? labelText;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final String? hintText;
  final AutovalidateMode? autovalidateMode;
  final String? label;
  final bool? autofocus;
  final int? maxLines, minLines, maxLength;
  final TextStyle? labelStyle;
  final bool filled;
  final bool? isDense;
  final double? radius;
  final bool star;
  final String? icon;
  final VoidCallback? suffixIconTap;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool password;
  final FormTextFieldType type;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor, borderColor;
  final Iterable<String>? autofillHints;
  final StringOrNullTransformer? validator;
  final TextCapitalization? textCapitalization;
  final Color? labelColor;
  const CustomTextFormField({
    super.key,
    this.isDense,
    this.enabled = true,
    this.width,
    this.labelStyle,
    this.autovalidateMode,
    this.autofocus,
    this.padding,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.label,
    this.fillColor = AppColors.lightGray,
    this.star = false,
    this.filled = false,
    this.icon,
    this.suffixIconTap,
    this.controller,
    this.hintStyle,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.password = false,
    this.type = FormTextFieldType.textField,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.textCapitalization,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
    this.style,
    this.borderColor,
    this.radius,
    this.labelColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool get _isDropdown => widget.type == FormTextFieldType.dropdownField;
  late bool obscureText = widget.password;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.only(top: 10.h, bottom: 10.h),
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    widget.label!,
                    style: CustomTextStyle.styleW500S14Black,
                  ),
                ),
                if (widget.star)
                  Text(
                    '*',
                    style: CustomTextStyle.styleW500S14Black.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          // if (widget.label != null)
          //   SizedBox(
          //     height: 5.h,
          //   ),
          TextFormField(
            autofillHints: widget.autofillHints,
            autofocus: widget.autofocus ?? false,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: !_isDropdown,
            autocorrect: true,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            enableSuggestions: true,
            inputFormatters: widget.inputFormatters,
            readOnly: _isDropdown,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            controller: widget.initialValue != null ? null : widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.next,
            validator: widget.validator,
            obscureText: obscureText,
            style: widget.style ?? CustomTextStyle.styleW400S16black,
            decoration: InputDecoration(
              isDense: true,
              filled: widget.filled,
              fillColor: widget.fillColor,
              prefixIcon: widget.prefix,
              prefixIconConstraints: BoxConstraints(minWidth: 15.w),
              suffixIcon:
                  widget.password
                      ? SizedBox(
                        child: InkWell(
                          onTap:
                              () => setState(() {
                                obscureText = !obscureText;
                              }),
                          child:
                              obscureText
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.grey,
                                  ),
                        ),
                      )
                      : widget.suffixIcon != null
                      ? InkWell(
                        onTap: widget.suffixIconTap,
                        child: widget.suffixIcon,
                      )
                      : null,
              suffix: widget.suffix,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 10.w,
              ),
              labelText: widget.labelText,
              labelStyle: CustomTextStyle.styleW400S16black.copyWith(
                color: widget.labelColor ?? Colors.black,
                fontSize: 15.sp,
              ),
              hintText: widget.hintText,
              hintStyle:
                  widget.hintStyle ??
                  CustomTextStyle.styleW400S16black.copyWith(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
              border: formBorder(),
              enabledBorder: formBorder(),
              errorBorder: formBorder().copyWith(
                borderSide: BorderSide(
                  color:
                      widget.borderColor ?? Theme.of(context).colorScheme.error,
                ),
              ),
              //   errorMaxLines: 3,
              errorStyle: CustomTextStyle.styleW400S16black.copyWith(
                color: Colors.red,
                fontSize: 10.sp,
              ),
              focusedBorder: formBorder().copyWith(
                borderSide: BorderSide(
                  color:
                      widget.borderColor ??
                      Theme.of(context).colorScheme.primary,
                ),
              ),
              focusedErrorBorder: formBorder().copyWith(
                borderSide: BorderSide(
                  color:
                      widget.borderColor ?? Theme.of(context).colorScheme.error,
                ),
              ),
              disabledBorder: formBorder().copyWith(
                borderSide: BorderSide(
                  color:
                      widget.borderColor ?? Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder formBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.2.w,
        color: widget.borderColor ?? AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
