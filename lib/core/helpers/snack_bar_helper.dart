import 'package:flutter/material.dart';
import 'package:zewail/app/router.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';

class SnackBarHelper {
  static void showErrorSnackBar({
    required String message,
    bool localMessage = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      _showSnackBar(
        message:
            localMessage
                ? context.localization.errorResponse(message)
                : message,
        backgroundColor: Colors.red.withValues(alpha: .8),
        icon: Icons.error,
        duration: duration,
      );
    }
  }

  static void showSuccessSnackBar({
    required String message,
    bool localMessage = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      _showSnackBar(
        message:
            localMessage
                ? context.localization.successResponse(message)
                : message,
        backgroundColor: Colors.green.withValues(alpha: .8),
        icon: Icons.check_circle,
        duration: duration,
      );
    }
  }

  static void showCustomSnackBar({
    required String message,
    Color? backgroundColor,
    bool localMessage = false,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    if (context != null) {
      _showSnackBar(
        message: message,
        backgroundColor: backgroundColor ?? Colors.blue,
        icon: icon ?? Icons.info,
        duration: duration,
      );
    }
  }

  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final navigator = navigatorKey;
    final context = navigator.currentContext;
    {
      final snackBar = SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
      );

      ScaffoldMessenger.of(
        context!,
      ).clearSnackBars(); // Clear any existing SnackBars
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
