import 'package:flutter/material.dart';

import '../../widgets/custom/cached_image.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/project/c_text.dart';

class HeaderWidget extends StatelessWidget {
  final String? profileImageUrl;
  const HeaderWidget({super.key, this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ProfileImage, Info
        Row(
          spacing: 8,
          children: [
            imageWidget(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  infoItemWidget("Info1", 10),
                  infoItemWidget("Info2", 20),
                  infoItemWidget("Info3", 30),
                ],
              ),
            ),
          ],
        ),
        spaceWidget,
        CText("İsim", isBold: true, size: 16),
        CText("Hakkında", color: Colors.grey.shade700),
        // Buttons
        buttonWidget(),
      ],
    );
  }

  Widget get spaceWidget => SizedBox(height: 8);

  Widget imageWidget() {
    return SizedBox.square(
      dimension: 100,
      child: CachedImage(imageData: profileImageUrl, radius: 100),
    );
  }

  Column infoItemWidget(String title, int value) => Column(
    children: [CText(value.toString(), size: 18, isBold: true), CText(title)],
  );

  Widget buttonWidget() {
    return Row(
      spacing: 8,
      children: [
        CustomButton(
          onPressed: () {},
          title: "Profili Düzenle",
          height: 36,
          radius: 6,
          isExpanded: true,
        ),
        SizedBox.square(
          dimension: 36,
          child: CustomButton(
            onPressed: () {},
            backgroundColor: Colors.grey.shade200,
            padding: 0,
            titleWidget: Icon(Icons.person_add_rounded, size: 18),
            radius: 6,
          ),
        ),
      ],
    );
  }
}
