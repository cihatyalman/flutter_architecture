// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../exports/export_business.dart';
import '../../../exports/export_widgets.dart';

class CustomInputField extends StatelessWidget {
  TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final String? initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputMaskList;
  final Color color;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final Widget? iconWidget;
  final bool suffixActive;
  final int? maxLength;
  final Size size;
  final TextAlign align;
  final double radius;
  final TextStyle? style;
  FocusNode? focus;
  final bool readOnly;
  final int maxLines;
  final int styleType;

  CustomInputField({
    this.controller,
    this.onChanged,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.inputMaskList,
    this.color = Colors.white,
    this.errorText,
    this.labelText,
    this.hintText,
    this.iconWidget,
    this.suffixActive = false,
    this.maxLength,
    this.size = const Size(double.infinity, 56),
    this.align = TextAlign.start,
    this.radius = 8,
    this.style,
    this.focus,
    this.readOnly = false,
    this.maxLines = 1,
    this.styleType = 0,
  });

  TextStyle? _style;
  final hideNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    controller ??= TextEditingController(text: initialValue);
    hideNotifier.value = suffixActive;
    focus ??= FocusNode();
    _style = style ?? hd.textStyle();
    return _textFormField(context);
  }

  Widget _textFormField(BuildContext context) {
    return Focus(
      onFocusChange: (value) => hideNotifier.notifyListeners(),
      child: ValueListenableBuilder<bool>(
        valueListenable: hideNotifier,
        builder: (_, value, __) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: TextFormField(
              inputFormatters: inputMaskList,
              textAlign: align,
              textAlignVertical: suffixActive
                  ? (errorText == null || errorText!.isEmpty)
                      ? TextAlignVertical.center
                      : TextAlignVertical.bottom
                  : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                icon: iconWidget,
                suffixIcon: suffixActive
                    ? Padding(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          icon: value
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                          onPressed: () => hideNotifier.value = !value,
                        ),
                      )
                    : null,
                border: [1, 2].contains(styleType)
                    ? _border(styleType, controller!.text.isNotEmpty ? 1 : 0)
                    : InputBorder.none,
                focusedBorder: [1, 2].contains(styleType)
                    ? _border(styleType, 1)
                    : InputBorder.none,
                enabledBorder: [1, 2].contains(styleType)
                    ? _border(styleType, controller!.text.isNotEmpty ? 1 : 0)
                    : InputBorder.none,
                // errorBorder: InputBorder.none,
                // disabledBorder: InputBorder.none,
                counterText: "",
                hintText: hintText,
                errorText: errorText,
                label: labelText != null
                    ? CText(
                        labelText,
                        color: focus!.hasFocus || controller!.text.isNotEmpty
                            ? Colors.black
                            : Colors.black.withOpacity(.5),
                      )
                    : null,
                labelStyle: _style,
                floatingLabelStyle: _style,
              ),
              textInputAction: TextInputAction.next,
              style: _style,
              obscureText: value,
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: maxLines,
              focusNode: focus,
              readOnly: readOnly,
              controller: controller,
              onChanged: onChanged,
            ),
          );
        },
      ),
    );
  }

  InputBorder _border(int styleType, [int colorType = 0]) => styleType == 1
      ? OutlineInputBorder(
          borderSide: BorderSide(
            color: colorType == 1 ? Colors.black : Colors.black.withOpacity(.5),
          ),
        )
      : UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorType == 1 ? Colors.black : Colors.black.withOpacity(.5),
          ),
        );
}
