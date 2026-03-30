import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar_popup.dart';
import '../project/c_text.dart';

class CustomDateInput extends StatefulWidget {
  DateTime? initialDate;
  DateTime? firstDate;
  DateTime? lastDate;
  String hintText;
  String? dateFormat;
  void Function(DateTime? date)? callback;

  CustomDateInput({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText = "Tarih Seç",
    this.dateFormat = "dd MMMM yyyy",
    this.callback,
  });

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  DateTime? _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(8),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Expanded(
              child: _currentDate != null
                  ? CText(
                      DateFormat(widget.dateFormat, "tr").format(_currentDate!),
                    )
                  : CText(widget.hintText, color: Colors.black54),
            ),
            Icon(Icons.date_range_rounded),
          ],
        ),
      ),
      onTap: () {
        CalendarPopUp(
          initialDate: _currentDate ?? widget.firstDate ?? widget.lastDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          onSave: (datetime) {
            setState(() {
              if (datetime != null) _currentDate = datetime;
            });
            widget.callback?.call(datetime);
          },
        ).show(context);
      },
    );
  }
}
