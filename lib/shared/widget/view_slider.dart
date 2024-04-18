import 'package:flutter/material.dart';

class ViewSlidingWidget extends StatefulWidget {
  final Widget child;
  const ViewSlidingWidget({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => ViewSlidingWidgetState();
}

class ViewSlidingWidgetState extends State<ViewSlidingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset,
      child: widget.child,
    );
  }
}
