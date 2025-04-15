import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

typedef StringOrNullTransformer = String? Function(String? input);

enum FormTextFieldType { textField, dropdownField }

class CustomLoginTextFormField extends StatefulWidget {
  final bool password;
  final double? width, height;
  final String? labelText;
  final String? hintText;
  final String? label;
  final String? icon;
  final bool? filled;
  final Color? fillColor;
  final VoidCallback? suffixIconTap;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final Widget? suffix, choices;
  final int? maxLines, minLines, maxLength;

  final bool star;
  final bool? enabled;
  final Widget? prefix;
  final bool obscureText;
  final FormTextFieldType type;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final String? initialValue;
  final StringOrNullTransformer? validator;
  final Iterable<String>? autofillHints;

  const CustomLoginTextFormField({
    this.password = false,
    super.key,
    this.width,
    this.suffix,
    this.prefix,
    this.star = false,
    this.labelText,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.icon,
    this.suffixIconTap,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.validator,
    this.type = FormTextFieldType.textField,
    this.enabled,
    this.filled,
    this.fillColor,
    this.autofillHints,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.height,
    this.choices,
  });

  @override
  State<CustomLoginTextFormField> createState() =>
      _CustomLoginTextFormFieldState();
}

class _CustomLoginTextFormFieldState extends State<CustomLoginTextFormField> {
  bool get _isDropdown => widget.type == FormTextFieldType.dropdownField;
  late bool obscureText = widget.password;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                  style: context.theme.textTheme.displaySmall,
                ),
                if (widget.star)
                  Text(
                    '*',
                    style: context.theme.textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          if (widget.label != null) SizedBox(height: 5.h),
          if (widget.choices != null) widget.choices!,
          SizedBox(
            height: widget.height ?? 60.h,
            //    color: Colors.red,
            child: TextFormField(
              enabled: widget.enabled,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofillHints: widget.autofillHints,
              showCursor: !_isDropdown,
              autocorrect: !widget.password,
              enableSuggestions: !widget.password,
              inputFormatters: widget.inputFormatters,
              readOnly: _isDropdown,
              onChanged: widget.onChanged,
              initialValue: widget.initialValue,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              controller:
                  widget.initialValue != null ? null : widget.controller,
              keyboardType: widget.keyboardType,
              textInputAction: TextInputAction.next,
              validator: widget.validator,
              obscureText: obscureText,
              style: context.theme.textTheme.titleSmall,
              decoration: InputDecoration(
                prefixIcon:
                    widget.icon != null
                        ? Container(
                          width: 10.h,
                          height: 10.h,
                          margin: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image:
                                widget.icon != null
                                    ? DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(widget.icon!),
                                    )
                                    : null,
                          ),
                        )
                        : widget.prefix,
                suffixIcon:
                    widget.password
                        ? SizedBox(
                          child: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              setState(() {});
                            },
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 25.h,
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
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                labelText: widget.labelText,
                labelStyle: context.theme.textTheme.displaySmall!.copyWith(
                  fontSize: 15.sp,
                ),
                hintText: widget.hintText,
                hintStyle: context.theme.textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                ),
                border: formBorder(),
                enabledBorder: formBorder(),
                errorBorder: formBorder().copyWith(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                errorStyle: context.theme.textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 255, 88, 76),
                  height: .25.h,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
                focusedBorder: formBorder().copyWith(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedErrorBorder: formBorder().copyWith(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                disabledBorder: null,
                fillColor: widget.fillColor,
                filled: widget.filled == true || widget.enabled == false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder formBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.2.w,
        color: Theme.of(context).disabledColor,
      ),
      borderRadius: BorderRadius.circular(13.r),
    );
  }
}
