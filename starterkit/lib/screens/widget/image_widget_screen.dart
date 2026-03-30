import 'package:flutter/material.dart';

import '../../features/widget/exports.dart';
import '../../widgets/custom/cached_image.dart';
import '../../widgets/project/c_appbar.dart';

class ImageWidgetScreen extends StatelessWidget {
  static const route = 'ImageWidgetScreen';

  ImageWidgetScreen({super.key});

  final images = [
    "https://images.pexels.com/photos/418831/pexels-photo-418831.jpeg",
    "https://images.pexels.com/photos/9754/mountains-clouds-forest-fog.jpg",
    "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg",
    "https://images.pexels.com/photos/345522/pexels-photo-345522.jpeg",
    "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg",
    "https://images.pexels.com/photos/131723/pexels-photo-131723.jpeg",
    "https://images.pexels.com/photos/757292/pexels-photo-757292.jpeg",
    "https://images.pexels.com/photos/247600/pexels-photo-247600.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: "Image").build(context),
      body: GridView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(12).copyWith(bottom: 56),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        children: [
          ImageWidget(
            title: "Default",
            child: CachedImage(imageData: images.first),
          ),
          ImageWidget(
            title: "Fit - Contain",
            child: CachedImage(imageData: images.first, fit: BoxFit.contain),
          ),
          ImageWidget(
            title: "Align - Left",
            child: CachedImage(
              imageData: images.first,
              alignment: Alignment.centerLeft,
            ),
          ),
          ImageWidget(
            title: "Align - Right",
            child: CachedImage(
              imageData: images.first,
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
