import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../config/assets.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.onTap,
    this.fit = BoxFit.cover,
  });

  final double? width;
  final double? height;
  final Function? onTap;
  final BoxFit fit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return _buildPlaceholderImage();
    } else if (imagePath.contains('assets') &&
        !imagePath.startsWith('https://')) {
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
      );
    } else if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: imagePath,
        placeholder: (_, __) => _buildLoadingIndicator(),
        errorWidget: (_, __, ___) => _buildErrorIcon(),
      );
    }
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: width == null ? null : width! / 2,
      height: height == null ? null : height! / 2,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorIcon() {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      AppAssets.userDefaultPhoto,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
