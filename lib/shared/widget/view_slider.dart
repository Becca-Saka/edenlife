import 'package:flutter/material.dart';

class ViewSlidingWidget extends StatefulWidget {
  final Widget child;
  final int wait;
  const ViewSlidingWidget({super.key, required this.child, required this.wait});

  @override
  State<StatefulWidget> createState() => ViewSlidingWidgetState();
}

class ViewSlidingWidgetState extends State<ViewSlidingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(controller);

    Future.delayed(Duration(milliseconds: widget.wait * 100), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInFadeOut,
      child: widget.child,
    );
  }
}
