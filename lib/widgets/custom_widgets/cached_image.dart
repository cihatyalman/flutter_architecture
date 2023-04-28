// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radius;
  bool isInfinity;
  BoxFit fit;
  Alignment alignment;

  CachedImage({
    required this.imageUrl,
    this.radius = 8,
    this.isInfinity = false,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: imageUrl == null
          ? _imageWidget(2)
          : CachedNetworkImage(
              alignment: alignment,
              imageUrl: imageUrl!,
              placeholder: (context, url) => _imageWidget(1),
              errorWidget: (context, url, error) => _imageWidget(0),
              fit: fit,
              width: isInfinity ? double.infinity : null,
              height: isInfinity ? double.infinity : null,
              fadeInCurve: Curves.linear,
              fadeInDuration: const Duration(milliseconds: 100),
            ),
    );
  }

  Widget _imageWidget(int type) => Container(
        color: Colors.grey.shade300,
        child: Icon(
          [
            Icons.cancel_presentation_rounded,
            Icons.downloading_rounded,
            Icons.image_outlined
          ][type],
          color: [Colors.red.shade300, Colors.grey, Colors.grey][type],
        ),
      );
}
