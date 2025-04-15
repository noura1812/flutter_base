import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

class CustomFormDropDown<T> extends StatefulWidget {
  final String? icon;
  final String? label;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final bool border;
  final OutlineInputBorder? outLineBorder;
  final bool filled, star;
  final TextStyle? labelStyle;
  final bool isExpanded;
  final Color? borderColor;
  final double? height;
  final String? Function(T?)? validator;
  final Widget? hint;
  const CustomFormDropDown({
    super.key,
    this.border = true,
    this.icon,
    this.filled = false,
    this.label,
    this.onChanged,
    this.value,
    this.isExpanded = false,
    required this.items,
    this.height,
    this.validator,
    this.star = false,
    this.hint,
    this.borderColor,
    this.labelStyle,
    this.outLineBorder,
  });

  @override
  State<CustomFormDropDown<T>> createState() => _CustomFormDropDownState<T>();
}

class _CustomFormDropDownState<T> extends State<CustomFormDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.border ? 10.h : 0,
        top: widget.border ? 10.h : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.label!, style: CustomTextStyle.styleW500S14Black),
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
          if (widget.label != null) SizedBox(height: 5.h),
          SizedBox(
            height: widget.height,
            child: DropdownButtonFormField<T>(
              hint: widget.hint,
              validator: widget.validator,
              iconSize: 30.h,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: widget.onChanged,
              value: widget.value,
              isExpanded: widget.isExpanded,
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
                                      image: AssetImage(widget.icon!),
                                    )
                                    : null,
                          ),
                        )
                        : null,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                border: widget.outLineBorder ?? formBorder(),
                enabledBorder: widget.outLineBorder ?? formBorder(),
                errorBorder:
                    widget.border
                        ? (widget.outLineBorder ?? formBorder()).copyWith(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        )
                        : InputBorder.none,
                errorStyle: context.theme.textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 255, 88, 76),
                  height: .25.h,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
                focusedBorder: widget.outLineBorder ?? formBorder(),
                focusedErrorBorder: widget.outLineBorder ?? formBorder(),
                disabledBorder: InputBorder.none,
                fillColor:
                    widget.onChanged == null
                        ? Theme.of(context).disabledColor.withOpacity(.2)
                        : null,
                filled: widget.filled || widget.onChanged == null,
              ),
              items: widget.items,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder formBorder() {
    return !widget.border
        ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 0.w, color: Colors.transparent),
        )
        : OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1.2.w,
            color: widget.borderColor ?? Theme.of(context).secondaryHeaderColor,
          ),
        );
  }
}
