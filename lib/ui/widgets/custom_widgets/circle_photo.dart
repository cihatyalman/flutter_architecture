// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../core/utils/extensions.dart';

import '../project_widgets/widget_helper.dart';
import 'cached_image.dart';

class CirclePhoto extends StatelessWidget {
  dynamic imageData;
  double size;
  bool isBorder;
  double borderWidth;
  Color borderColor;
  Color backgroundColor;

  CirclePhoto({
    this.imageData,
    this.size = 44,
    this.isBorder = false,
    this.borderWidth = 4,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: isBorder ? borderWidth : 0,
          style: BorderStyle.values[isBorder ? 1 : 0],
        ),
        shape: BoxShape.circle,
      ),
      child: imageData is String?
          ? CachedImage(imageUrl: imageData, radius: 200)
          : ClipRRect(
              borderRadius: hw.radius(200),
              child: imageData is File
                  ? FutureBuilder<Uint8List>(
                      future: (imageData as File).readAsBytes(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return hw.circleLoading();
                        } else if (snapshot.data == null) {
                          return _defaultImageWidget();
                        }
                        return Image(
                          image: snapshot.data!.toImageFromBytes.image,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : _defaultImageWidget(),
            ),
    );
  }

  Widget _defaultImageWidget() => Container(
        color: Colors.grey.shade300,
        child: const Icon(Icons.image_outlined, color: Colors.grey),
      );
}
