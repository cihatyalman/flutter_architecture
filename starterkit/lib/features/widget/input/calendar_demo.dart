import 'package:flutter/material.dart';

import '../../../widgets/custom/custom_date_input.dart';
import '../../../widgets/project/c_text.dart';
import 'date_input.dart';

class CalendarDemo extends StatelessWidget {
  const CalendarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateInput(title: "Default"),
        spaceWidget,
        DateInput(title: "Gelecek Tarih", firstDate: DateTime.now()),
        spaceWidget,
        DateInput(title: "Geçmiş Tarih", lastDate: DateTime.now()),
        spaceWidget,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [CText("CustomDateInput", isBold: true), CustomDateInput()],
        ),
      ],
    );
  }

  Widget get spaceWidget => SizedBox(height: 8);

  Widget titleWidget(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 2),
    child: CText(title, isBold: true, size: 14),
  );
}
