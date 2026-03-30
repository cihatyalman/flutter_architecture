import 'package:flutter/material.dart';

import '../project/c_text.dart';

class CalendarPopUp {
  DateTime? initialDate;
  DateTime? firstDate;
  DateTime? lastDate;
  final Function(DateTime? datetime) onSave;

  DateTime? _selectedDateTime;

  CalendarPopUp({
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onSave,
  });

  Future<dynamic> show(BuildContext context) async {
    final now = DateTime.now();
    initialDate ??= DateTime(now.year, now.month, now.day);
    firstDate ??= DateTime(1900);
    lastDate ??= DateTime(2100);
    _selectedDateTime = initialDate;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Design
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,

          // Controller
          content: AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CalendarDatePicker(
                          initialDate: initialDate!,
                          firstDate: firstDate!,
                          lastDate: lastDate!,
                          onDateChanged: (value) {
                            _selectedDateTime = value;
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _closeButton(
                            context: context,
                            buttonText: "İptal",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _actionButton(
                            context: context,
                            buttonText: "Kaydet",
                            buttonFunction: () {
                              onSave.call(_selectedDateTime);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _closeButton({
    required BuildContext context,
    required String buttonText,
  }) {
    final theme = Theme.of(context);
    return TextButton(
      child: CText(buttonText, isBold: true, color: theme.primaryColor),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _actionButton({
    required BuildContext context,
    required String buttonText,
    Function()? buttonFunction,
  }) {
    return FilledButton(
      child: CText(buttonText, isBold: true, color: Colors.white),
      onPressed: () {
        buttonFunction?.call();
        Navigator.pop(context);
      },
    );
  }
}
