import 'package:flutter/material.dart';

import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/project/c_popup.dart';
import '../../../../widgets/project/c_text.dart';

class CustomPopupDemo extends StatelessWidget {
  CustomPopupDemo({super.key});

  final popup = CPopup(
    title: "Başlık",
    falseButtonText: "Kapat",
    trueButtonText: "Onayla",
    children: [
      SizedBox(height: 12),
      CText("Bu bir popup örneğidir."),
      SizedBox(height: 12),
    ],
    callback: (value) async {
      debugPrint("[C_value]: $value");
      await Future.delayed(Duration(seconds: 3));
      return false;
    },
  );

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        popup.show(context).then((result) {
          debugPrint("[C_result]: $result");
        });
      },
      title: "Aç",
    );
  }
}
