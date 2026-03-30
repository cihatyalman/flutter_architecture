import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/constants/text_constant.dart';
import '../../widgets/custom/cached_image.dart';
import 'image_overlay.dart';

class MasonryWidget extends StatelessWidget {
  MasonryWidget({super.key});

  final imageList = List.generate(20, (_) => TextConstants.randomImageUrl);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 4),
      itemCount: imageList.length,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) => itemWidget(context, index),
    );
  }

  Widget itemWidget(BuildContext context, int index) {
    final imageUrl = imageList[index];

    final overlay = ImageOverlay(imageUrl);

    return GestureDetector(
      onLongPressStart: (_) => overlay.show(context),
      onLongPressEnd: (_) => overlay.hide(),
      child: CachedImage(imageData: imageList[index], radius: 0),
    );
  }
}
