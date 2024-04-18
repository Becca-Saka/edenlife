import 'package:eden/shared/widget/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppImages extends StatefulWidget {
  final String path;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  const AppImages(
      {required this.path,
      this.height,
      this.width,
      this.radius,
      this.fit,
      super.key});

  @override
  State<AppImages> createState() => _AppImagesState();
}

class _AppImagesState extends State<AppImages> {
  bool get isAsset => widget.path.startsWith('assets');
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        child: Builder(builder: (context) {
          if (widget.path.isEmpty) {
            return _errorWidget();
          }
          if (isAsset) {
            return Container(
              height: widget.height,
              width: widget.width,
              color: Colors.grey.withOpacity(0.2),
              child: Center(
                child: AppIcons(
                  icon: widget.path,
                  size: 12,
                ),
              ),
            );
          }
          return Image.network(
            widget.path,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                );
              }
              return child;
            },
            errorBuilder: (context, error, stackTrace) {
              return _errorWidget();
            },
          );
        }));
  }

  Container _errorWidget() {
    return Container(
      height: widget.height,
      width: widget.width,
      color: Colors.grey.withOpacity(0.2),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.red,
          size: 12,
        ),
      ),
    );
  }
}
