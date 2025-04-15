// import 'package:zewail/core/helpers/dialog_helper.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class LaunchUrlHelper {
//   static Future<void> launchFile(String url) async {
//     try {
//       await launchUrl(Uri.parse(url),
//           mode: LaunchMode.externalNonBrowserApplication);
//     } catch (e) {
//       DialogHelper.showErrorDialog(
//           message: 'somethingWentWrong', localMessage: true);
//     }
//   }

//   static Future<void> launchWhatsAppChat(String phone) async {
//     String url = "https://wa.me/$phone";
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       DialogHelper.showErrorDialog(
//           message: 'somethingWentWrong', localMessage: true);
//     }
//   }

//   static Future<void> launchPath(String url) async {
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       DialogHelper.showErrorDialog(
//           message: 'somethingWentWrong', localMessage: true);
//     }
//   }

//   static Future<void> launchphone(String phone) async {
//     String url = 'tel:$phone';

//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       DialogHelper.showErrorDialog(
//           message: 'somethingWentWrong', localMessage: true);
//     }
//   }

//   static Future<void> launchEmail(String email) async {
//     String url = 'mailto:$email';

//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       DialogHelper.showErrorDialog(
//           message: 'somethingWentWrong', localMessage: true);
//     }
//   }
// }
