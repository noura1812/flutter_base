import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../helpers/dialog_helper.dart';
import '../util/file_size_checker.dart';

Future<List<XFile>> _pickAndCompressMultiImage(
    RootIsolateToken rootToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage(imageQuality: 100);
  List<XFile> compressedImages = [];
  for (var originalImage in images) {
    final XFile? image =
        await PickFilesService.compressAndGetFile(originalImage);
    if (image != null) {
      final isLarge = await checkLargeFile(image.path);
      if (isLarge) {
        continue;
      }
      compressedImages.add(image);
    }
  }
  return compressedImages;
}

Future<XFile?> _compressImage(
    XFile originalImage, RootIsolateToken rootToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
  final XFile? image = await PickFilesService.compressAndGetFile(originalImage);
  return image;
}

Future<XFile?> _pickAndCompressImage({
  required ImageSource source,
  double? maxWidth,
  double? maxHeight,
}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? originalImage = await picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: 100);
  debugPrint('1---->${originalImage?.path}');
  RootIsolateToken rootToken = RootIsolateToken.instance!;
  XFile? image;
  if (originalImage != null) {
    image = await Isolate.run(() => _compressImage(originalImage, rootToken));
    debugPrint('2---->${image?.path}');
  }
  return image;
}

class PickFilesService {
  static Future<XFile?> compressImages(
    XFile images,
  ) async {
    try {
      RootIsolateToken rootToken = RootIsolateToken.instance!;
      return await Isolate.run(() => _compressImage(images, rootToken));
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
    return null;
  }

  static Future<void> getImageFromPhone(
      {required ImageSource source,
      double? maxWidth,
      double? maxHeight,
      required Function(XFile) onPicked}) async {
    try {
      DialogHelper.showLoadingDialog();
      final XFile? image = await _pickAndCompressImage(
          source: source, maxHeight: maxHeight, maxWidth: maxWidth);

      if (image != null) {
        final isLarge = await checkLargeFile(image.path);

        if (isLarge) {
          return;
        }
        onPicked(image);
      }
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        DialogHelper.showErrorDialog(
            message: 'photoPermission',
            localMessage: true,
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      } else if (e.code == 'camera_access_denied') {
        DialogHelper.showErrorDialog(
            message: 'cameraPermission',
            localMessage: true,
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      } else if (e.code == 'no_available_camera') {
        DialogHelper.showErrorDialog(
            message: 'cameraPermission',
            localMessage: true,
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      } else if (e.code == 'picker_error') {
        DialogHelper.showErrorDialog(
            message: 'permission is denied',
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      }
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    } finally {
      DialogHelper.dismissDialog();
    }
  }

  static Future<void> getMultiImageFromPhone(
      {double? maxWidth,
      double? maxHeight,
      required Function(List<XFile>) onPicked}) async {
    try {
      DialogHelper.showLoadingDialog();
      RootIsolateToken rootToken = RootIsolateToken.instance!;
      final List<XFile> compressedImages =
          await Isolate.run(() => _pickAndCompressMultiImage(rootToken));
      onPicked(compressedImages);
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        DialogHelper.showErrorDialog(
            message: 'photoPermission',
            localMessage: true,
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      } else if (e.code == 'camera_access_denied') {
        DialogHelper.showErrorDialog(
            message: 'cameraPermission',
            localMessage: true,
            barrierDismissible: true,
            onPressed: () => AppSettings.openAppSettings());
      }
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    } finally {
      DialogHelper.dismissDialog();
    }
  }

  static Future<XFile?> compressAndGetFile(XFile? file) async {
    XFile? result;
    if (file != null) {
      final Directory tempDir = await getTemporaryDirectory();
      try {
        result = await FlutterImageCompress.compressAndGetFile(file.path,
            "${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}${file.name}",
            quality: 88, minWidth: 1000, minHeight: 1000);
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint("Eroor--$e--$st");
        }
      }
    }
    return result;
  }
}
