// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar_popup.dart';
import '../project/c_text.dart';

class CustomDateInput extends StatefulWidget {
  DateTime? initialDate;
  DateTime? firstDate;
  DateTime? lastDate;
  String hintText;
  void Function(DateTime? date)? callback;

  CustomDateInput({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText = "Tarih Seç",
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.black12),
        ),
        child: _currentDate != null
            ? CText(DateFormat("dd MMMM yyyy", "tr").format(_currentDate!))
            : CText(widget.hintText, color: Colors.black54),
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
