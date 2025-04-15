import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

import '../../../../services/pick_files_service.dart';

class ImagePickerWidget extends StatelessWidget {
  final String image;
  final Function(XFile)? onPicked;
  final Function(List<XFile>)? onMultiPicked;
  final bool multiselect, showButton;
  final Widget child;
  const ImagePickerWidget({
    required this.image,
    required this.onPicked,
    super.key,
    required this.child,
    this.multiselect = false,
    this.showButton = true,
    this.onMultiPicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onPicked == null && onMultiPicked == null
              ? null
              : () {
                showAdaptiveDialog(
                  context: context,
                  barrierDismissible: true,
                  builder:
                      (context) => AlertDialog.adaptive(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await PickFilesService.getImageFromPhone(
                                      source: ImageSource.camera,
                                      onPicked: onPicked!,
                                    );
                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  context.localization.camera,
                                  style: context.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    if (multiselect) {
                                      await PickFilesService.getMultiImageFromPhone(
                                        onPicked: onMultiPicked!,
                                      );
                                    } else {
                                      await PickFilesService.getImageFromPhone(
                                        source: ImageSource.gallery,
                                        onPicked: onPicked!,
                                      );
                                    }
                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.image_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  context.localization.gallery,
                                  style: context.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                );
              },
      child: Center(
        child: Stack(
          children: [
            child,
            if (showButton)
              IconButton.filled(onPressed: null, icon: Icon(Icons.camera_alt)),
          ],
        ),
      ),
    );
  }
}
