import 'package:zewail/app/router.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/core/extensions/responsive_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:zewail/app/di.dart' as di;
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';

import '../config/assets.dart';

class DialogHelper {
  static showLoadingDialog({
    bool dismissible = true,
    void Function()? onCancel,
  }) => di.getIt<DialogManager>().showLoadingDialog(
    onCancel: onCancel,
    dismissDialog: dismissible,
  );

  static customDialog({void Function()? onCancel, required Widget child}) => di
      .getIt<DialogManager>()
      .showCustomDialog(onCancel: onCancel, child: child);

  static dismissDialog() => di.getIt<DialogManager>().dismissDialog();

  static showSuccessDialog({
    String? message,
    void Function()? onPressed,
    bool barrierDismissible = false,
    Duration? duration,
    bool localMessage = false,
  }) => di.getIt<DialogManager>().showSuccessDialog(
    message: message,
    onPressed: onPressed,
    barrierDismissible: barrierDismissible,
    duration: duration,
    localMessage: localMessage,
  );

  static showErrorDialog({
    String? message,
    String? subMessage,
    void Function()? onPressed,
    bool barrierDismissible = false,
    bool localMessage = false,
    int? count,
    Duration? duration,
  }) => di.getIt<DialogManager>().showErrorDialog(
    message: message,
    subMessage: subMessage,
    onPressed: onPressed,
    barrierDismissible: barrierDismissible,
    localMessage: localMessage,
    count: count,
    duration: duration,
  );

  static showWarningDialog({
    String? message,
    void Function()? onPressed,
    bool barrierDismissible = false,
    Duration? duration,
  }) => di.getIt<DialogManager>().showWarningDialog(
    message: message,
    onPressed: onPressed,
    barrierDismissible: barrierDismissible,
    duration: duration,
  );

  static showPendingDialog({
    String? message,
    void Function()? onPressed,
    bool localMessage = false,
    bool barrierDismissible = false,
    bool hasAction = true,
    Duration? duration,
  }) => di.getIt<DialogManager>().showPendingDialog(
    message: message,
    onPressed: onPressed,
    localMessage: localMessage,
    barrierDismissible: barrierDismissible,
    hasAction: hasAction,
    duration: duration,
  );
}

@lazySingleton
class DialogManager {
  DialogManager();

  void showCustomDialog({
    required Widget child,
    bool barrierDismissible = true,
    Color? backgroundColor,
    EdgeInsets? insetPadding,
    void Function()? onCancel,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      WidgetsBinding.instance.scheduleTask(
        () => showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          routeSettings: const RouteSettings(name: 'dialog'),
          builder:
              (context) => PopScope(
                canPop: barrierDismissible,
                onPopInvoked:
                    onCancel != null
                        ? (v) {
                          onCancel();
                        }
                        : null,
                child: Dialog(
                  backgroundColor: backgroundColor,
                  insetPadding: insetPadding,
                  child: child,
                ),
              ),
        ).whenComplete(dismissDialog),
        Priority.animation,
      );
    }
  }

  void showErrorDialog({
    String? message,
    String? subMessage,
    void Function()? onPressed,
    bool barrierDismissible = false,
    bool localMessage = false,
    Duration? duration,
    int? count,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      WidgetsBinding.instance.scheduleTask(
        () => showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          routeSettings: const RouteSettings(name: 'dialog'),
          builder:
              (_) => PopScope(
                canPop: barrierDismissible,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(AppAssets.cross, height: 180, width: 180),
                      const SizedBox(height: 10),
                      Text(
                        localMessage || message == null
                            ? context.localization.errorResponse(message ?? '')
                            : message,
                        textAlign: TextAlign.center,
                      ),
                      Text(subMessage ?? ''),
                    ],
                  ),
                  actions: [
                    if (!barrierDismissible)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              dismissDialog();
                              onPressed?.call();
                            },
                            child: const Text('ok'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
        ).whenComplete(dismissDialog),
        Priority.animation,
      );
      if (duration != null) {
        Future.delayed(duration).whenComplete(dismissDialog);
      }
    }
  }

  void showWarningDialog({
    String? message,
    void Function()? onPressed,
    bool barrierDismissible = false,
    Duration? duration,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      WidgetsBinding.instance.scheduleTask(
        () => showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          routeSettings: const RouteSettings(name: 'dialog'),
          builder:
              (_) => PopScope(
                canPop: barrierDismissible,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(AppAssets.alert, height: 180, width: 180),
                      const SizedBox(height: 10),
                      Text(message ?? '', textAlign: TextAlign.center),
                    ],
                  ),
                  actions: [
                    if (!barrierDismissible)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              dismissDialog();
                              onPressed?.call();
                            },
                            child: const Text('ok'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
        ).whenComplete(dismissDialog),
        Priority.animation,
      );
      if (duration != null) {
        Future.delayed(duration).whenComplete(dismissDialog);
      }
    }
  }

  void showPendingDialog({
    String? message,
    void Function()? onPressed,
    required bool localMessage,
    required bool barrierDismissible,
    required bool hasAction,
    Duration? duration,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      WidgetsBinding.instance.scheduleTask(
        () => showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          routeSettings: const RouteSettings(name: 'dialog'),
          builder:
              (_) => PopScope(
                canPop: barrierDismissible,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(AppAssets.pending, height: 180, width: 180),
                      const SizedBox(height: 10),
                      Text(
                        localMessage || message == null
                            ? context.localization.pendingResponse(
                              message ?? '',
                            )
                            : message,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    if (!barrierDismissible && hasAction)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              dismissDialog();
                              onPressed?.call();
                            },
                            child: const Text('ok'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
        ).whenComplete(dismissDialog),
        Priority.animation,
      );
      if (duration != null) {
        Future.delayed(duration).whenComplete(dismissDialog);
      }
    }
  }

  void showSuccessDialog({
    String? message,
    void Function()? onPressed,
    bool barrierDismissible = false,
    Duration? duration,
    bool localMessage = false,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      WidgetsBinding.instance.scheduleTask(
        () => showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          routeSettings: const RouteSettings(name: 'dialog'),
          builder:
              (_) => PopScope(
                canPop: barrierDismissible,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        AppAssets.checkMark,
                        height: 180,
                        width: 180,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        localMessage
                            ? context.localization.successResponse(
                              message ?? '',
                            )
                            : message ?? '',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    if (!barrierDismissible)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              dismissDialog();
                              onPressed?.call();
                            },
                            child: const Text('ok'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
        ).whenComplete(dismissDialog),
        Priority.animation,
      );
      if (duration != null) {
        Future.delayed(duration).whenComplete(dismissDialog);
      }
    }
  }

  void showLoadingDialog({
    bool dismissDialog = true,
    void Function()? onCancel,
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      showCustomDialog(
        barrierDismissible: dismissDialog,
        onCancel: onCancel,
        child: Builder(
          builder: (context) {
            return SizedBox(
              height: context.width * 0.3,
              width: context.width * 0.3,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ),
        backgroundColor: Colors.grey.shade300.withOpacity(0.8),
        insetPadding: EdgeInsets.symmetric(horizontal: context.width * 0.3),
      );
    }
  }

  void dismissDialog() {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      Navigator.of(context).popUntil((route) {
        return route.settings.name != 'dialog';
      });
    }
  }
}
