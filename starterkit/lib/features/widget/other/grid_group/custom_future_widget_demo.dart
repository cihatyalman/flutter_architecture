import 'package:flutter/material.dart';

import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_future_widget.dart';
import '../../../../widgets/project/c_text.dart';

class CustomFutureWidgetDemo extends StatelessWidget {
  const CustomFutureWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFutureWidget(
      builder: (isLoading) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CText(
              "İşlem Durumu:\n${isLoading.value ? 'Devam ediyor..' : "Aktif değil"}",
              textAlign: TextAlign.center,
            ),
            CustomButton(
              isEnabled: !isLoading.value,
              onPressed: () async {
                isLoading.value = !isLoading.value;
                Future.delayed(Duration(seconds: 3), () {
                  isLoading.value = !isLoading.value;
                });
              },
              title: isLoading.value ? "İşlem yapılıyor.." : "Başlat (3sn)",
            ),
          ],
        );
      },
    );
  }
}
