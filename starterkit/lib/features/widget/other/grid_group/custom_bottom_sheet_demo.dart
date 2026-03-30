import 'package:flutter/material.dart';

import '../../../../widgets/custom/custom_bottom_sheet.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/project/c_text.dart';

class CustomBottomSheetDemo extends StatelessWidget {
  CustomBottomSheetDemo({super.key});

  final bs = CustomBottomSheet(
    oneWidget: (setState) {
      return Center(child: CText("Bu bir BottomSheet örneğidir."));
    },
  );

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        bs.show(context);
      },
      title: "Aç",
    );
  }
}
