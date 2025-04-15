import 'package:flutter/material.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';

class CustomCircleImageWidget extends StatelessWidget {
  const CustomCircleImageWidget({
    super.key,
    required this.imagePath,
    required this.radios,
    this.onTap,
    this.boxFit = BoxFit.cover,
  });

  final double radios;
  final Function? onTap;
  final BoxFit boxFit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radios,
      child: ClipOval(
        child: CustomImageWidget(
          width: radios * 2,
          height: radios * 2,
          imagePath: imagePath,
          fit: boxFit,
        ),
      ),
    );
  }
}
