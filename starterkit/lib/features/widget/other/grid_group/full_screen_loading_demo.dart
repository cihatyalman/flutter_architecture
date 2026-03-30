import 'package:flutter/material.dart';

import '../../../../utils/helpers/widget_helper.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/full_screen_loading.dart';
import '../../../../widgets/project/c_text.dart';

class FullScreenLoadingDemo extends StatelessWidget {
  FullScreenLoadingDemo({super.key});

  final fullLoading = FullScreenLoading(
    autoClose: Duration(seconds: 3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        hw.circleLoading(size: 40),
        CText(
          "3 saniye sonra otomatik olarak kapanacaktır.",
          color: Colors.white,
          size: 24,
          isBold: true,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        fullLoading.show(context);
        return;
      },
      title: "Başlat",
    );
  }
}
