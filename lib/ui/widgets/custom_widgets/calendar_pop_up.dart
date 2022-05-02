// colorScheme: _baseTheme.colorScheme.copyWith(primary: Colors.green),


import 'package:flutter/material.dart';

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

  show(BuildContext context) async {
    initialDate ??= DateTime.now();
    firstDate ??= DateTime(1970);
    lastDate ??= DateTime(2070);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Design
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,

        // Controller
        content: AspectRatio(
          aspectRatio: 3 / 4,
          child: Container(
            decoration: const BoxDecoration(
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
                        child: _buildActionButton(
                          context: context,
                          accept: false,
                          buttonText: "İptal",
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildActionButton(
                          context: context,
                          accept: true,
                          buttonText: "Kaydet",
                          buttonFunction: () {
                            onSave.call(_selectedDateTime);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required bool accept,
    required String buttonText,
    Function()? buttonFunction,
  }) {
    final _color = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        color: accept ? _color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        child: Text(
          buttonText,
          style: TextStyle(
            color: accept ? Colors.white : _color,
          ),
        ),
        onPressed: () {
          buttonFunction?.call();
          Navigator.pop(context);
        },
      ),
    );
  }
}
