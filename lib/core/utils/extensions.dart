import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension ByteExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}

extension DateTimeExtension on DateTime {
  String get toISOStringUtc => toUtc().toIso8601String();
  String get toISOString {
    final r = toIso8601String();
    return r[r.length - 1] == "Z" ? r : r + "Z";
  }
  String toTimestamp() {
    final timestamp = millisecondsSinceEpoch.toString();
    return timestamp.substring(0, timestamp.length - 3);
  }
}

extension StringExtension on String {
  Uint8List? toBytesFromBase64() {
    try {
      return base64Decode(this);
    } catch (e) {
      return null;
    }
  }

  Uint8List? toBytesFromString() {
    try {
      return Uint8List.fromList(utf8.encode(this));
    } catch (e) {
      return null;
    }
  }
  
  DateTime? get toDateLocal => DateTime.tryParse(this)?.toLocal();
  DateTime? get toDate => DateTime.tryParse(this);

  DateTime? toDateTimeFromTimestamp() {
    try {
      return (length > 10 || int.tryParse(this) == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000);
    } catch (e) {
      return null;
    }
  }
}
