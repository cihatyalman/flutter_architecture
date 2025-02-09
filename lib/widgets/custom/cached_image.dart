// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../project/widget_helper.dart';
import '../../core/utils/extensions.dart';

class CachedImage extends StatelessWidget {
  dynamic imageData;
  double radius;
  bool isInfinity;
  BoxFit fit;
  Alignment alignment;
  String? heroKey;

  CachedImage({
    this.imageData,
    this.radius = 8,
    this.isInfinity = false,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.heroKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: SizedBox(
        width: isInfinity ? double.infinity : null,
        height: isInfinity ? double.infinity : null,
        child: imageData == null
            ? _imageWidget(2)
            : imageData is String
                ? (heroKey != null
                    ? Hero(
                        tag: "${heroKey ?? ""}-$imageData",
                        child: _networkImageWidget(),
                      )
                    : _networkImageWidget())
                : imageData is File
                    ? _fileImageWidget(imageData)
                    : _imageWidget(2),
      ),
    );
  }

  Widget _networkImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        alignment: alignment,
        imageUrl: imageData,
        placeholder: (context, url) => _imageWidget(1),
        errorWidget: (context, url, error) => _imageWidget(0),
        fit: fit,
        fadeInCurve: Curves.linear,
        fadeInDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  Widget _fileImageWidget(File imageData) {
    return ClipRRect(
      borderRadius: hw.radius(radius),
      child: FutureBuilder<Uint8List>(
        future: imageData.readAsBytes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return hw.circleLoading();
          } else if (snapshot.data == null) {
            return _imageWidget(2);
          }
          return Image(
            image: snapshot.data!.toImageFromBytes.image,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _imageWidget(int type) => Container(
        color: Colors.grey.shade300,
        width: 48,
        height: 48,
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
