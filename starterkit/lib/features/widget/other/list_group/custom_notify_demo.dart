import 'package:flutter/material.dart';

import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_notify.dart';

class CustomNotifyDemo extends StatelessWidget {
  const CustomNotifyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        CustomButton(
          onPressed: () async {
            CustomNotify(message: "Hata bildirimi").show(context);
          },
          title: "Hata",
        ),
        CustomButton(
          onPressed: () async {
            CustomNotify(
              message: "Uyarı bildirimi",
              type: NotifyType.warning,
            ).show(context);
          },
          title: "Uyarı",
        ),
        CustomButton(
          onPressed: () async {
            CustomNotify(
              message: "Başarı bildirimi",
              type: NotifyType.success,
            ).show(context);
          },
          title: "Başarı",
        ),
        CustomButton(
          onPressed: () async {
            CustomNotify(
              message: "Başlığı olan bildirim",
              title: "Başlık",
            ).show(context);
          },
          title: "Başlık",
        ),
        CustomButton(
          onPressed: () async {
            CustomNotify(
              message: "Kapatmak için bildirime tıklayın!",
              title: "Tıklanabilir Bildirim",
              durationSeconds: 10,
              onPressed: () => Navigator.pop(context),
            ).show(context);
          },
          title: "Tıklanabilir",
        ),
      ],
    );
  }
}
