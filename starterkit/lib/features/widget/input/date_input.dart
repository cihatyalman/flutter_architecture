import 'package:flutter/material.dart';

import '../../../services/toolkit/extensions.dart';
import '../../../widgets/custom/calendar_popup.dart';
import '../../../widgets/custom/custom_button.dart';
import '../../../widgets/project/c_input.dart';
import '../../../widgets/project/c_text.dart';

class DateInput extends StatelessWidget {
  final String title;
  final DateTime? firstDate;
  final DateTime? lastDate;

  DateInput({super.key, required this.title, this.firstDate, this.lastDate});

  final inputCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        CText(title, isBold: true),
        CInput(
          controller: inputCtrl,
          hintText: "Tarih Seç",
          keyboardType: TextInputType.numberWithOptions(signed: true),
          suffixIcon: CustomButton(
            backgroundColor: Colors.transparent,
            padding: 0,
            minWidth: 1,
            onPressed: () async {
              DateTime? date = inputCtrl.text.toDateLocal;

              if (date != null && firstDate != null) {
                final dif = date.difference(firstDate!);
                if (dif.inSeconds < 0) {
                  date = null;
                }
              }
              if (date != null && lastDate != null) {
                final dif = date.difference(lastDate!);
                if (dif.inSeconds > 0) {
                  date = null;
                }
              }

              CalendarPopUp(
                firstDate: firstDate,
                lastDate: lastDate,
                initialDate: date,
                onSave: (datetime) {
                  if (datetime != null) {
                    inputCtrl.text = datetime.toISOStringDate;
                  }
                },
              ).show(context);
            },
            titleWidget: Icon(Icons.date_range_rounded),
          ),
        ),
      ],
    );
  }
}
