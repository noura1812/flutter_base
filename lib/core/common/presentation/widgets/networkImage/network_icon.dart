import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomNetworkIcon extends StatefulWidget {
  const CustomNetworkIcon({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.onTap,
    this.boxFit = BoxFit.cover,
  });

  final double? width;
  final double? height;
  final Function? onTap;
  final BoxFit boxFit;
  final String? iconPath;

  @override
  State<CustomNetworkIcon> createState() => _CustomNetworkIconState();
}

class _CustomNetworkIconState extends State<CustomNetworkIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.iconPath == null
        ? Container()
        : CachedNetworkImage(
            width: widget.width,
            height: widget.height,
            fit: widget.boxFit,
            imageUrl: "${widget.iconPath}",
            placeholder: (context, url) => Container(),
            errorWidget: (context, url, error) => Container(),
          );
  }
}
