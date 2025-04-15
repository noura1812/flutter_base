// import 'package:flutter/material.dart';

// class CustomNote extends StatelessWidget {
//   const CustomNote({super.key, required this.text});
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
//       margin: EdgeInsets.symmetric(vertical: 10.h),
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
//           border: Border(
//             right: Directionality.of(context) == TextDirection.rtl
//                 ? BorderSide(
//                     width: 5.w,
//                     color: Theme.of(context).colorScheme.secondary,
//                   )
//                 : BorderSide.none,
//             left: Directionality.of(context) == TextDirection.ltr
//                 ? BorderSide(
//                     width: 5.w,
//                     color: Theme.of(context).colorScheme.secondary,
//                   )
//                 : BorderSide.none,
//           )),
//       child: Text(
//         text,
//         style: context.theme.textTheme.titleMedium!.copyWith(
//           color: Theme.of(context).colorScheme.secondary,
//         ),
//       ),
//     );
//   }
// }
