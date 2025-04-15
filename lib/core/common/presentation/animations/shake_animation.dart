import 'package:flutter/material.dart';

class AutoShakeButton extends StatefulWidget {
  final Widget child;

  const AutoShakeButton({super.key, required this.child});

  @override
  _AutoShakeButtonState createState() => _AutoShakeButtonState();
}

class _AutoShakeButtonState extends State<AutoShakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Snappier shake animation (smaller but quicker movements)
    _shakeAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(begin: Offset.zero, end: Offset(0, -0.05)), weight: 1),
      TweenSequenceItem(
          tween: Tween(
              begin: Offset(
                0,
                -0.05,
              ),
              end: Offset(
                0,
                0.05,
              )),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Offset(0, 0.05), end: Offset.zero), weight: 1),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _startCustomLoop();
  }

  void _startCustomLoop() async {
    while (mounted) {
      await _controller.forward();
      await _controller.reverse();

      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _shakeAnimation,
      child: widget.child,
    );
  }
}
