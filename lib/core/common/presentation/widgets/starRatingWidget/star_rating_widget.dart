import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final double? iconSize;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
    this.iconSize,
    this.onRatingChanged,
    this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_rate_rounded,
        color: AppColors.gray300,
        size: iconSize ?? 15.r,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half_rounded,
        size: iconSize ?? 15.r,
        color: color ?? Color(0xffFFC83C),
      );
    } else {
      icon = Icon(
        Icons.star_rate_rounded,
        size: iconSize ?? 15.r,
        color: color ?? Color(0xffFFC83C),
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}
