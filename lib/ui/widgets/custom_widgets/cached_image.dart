// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../business/constants/text_constants.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radius;
  bool isInfinity;

  CachedImage({
    required this.imageUrl,
    this.radius = 8,
    this.isInfinity = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? TextConstants.defaultImageUrl,
        errorWidget: (context, _, __) => const Icon(Icons.error),
        fit: BoxFit.cover,
        width: isInfinity ? double.infinity : null,
        height: isInfinity ? double.infinity : null,
      ),
    );
  }
}
