import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/assets.dart';

class SplashThumbnail extends StatelessWidget {
  final void Function()? onEnd;
  const SplashThumbnail({this.onEnd, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.5, end: 1.0),
            duration: const Duration(seconds: 2),
            onEnd: onEnd,
            child: Container(
              width: 200.h,
              height: 200.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AppAssets.logoImage),
              )),
            ),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value * 1.2,
                child: child,
              );
            }));
  }
}
