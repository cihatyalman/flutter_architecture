// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final List<TextInputFormatter>? inputMaskList;
  final TextEditingController? controller;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final Color color;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? iconWidget;
  final bool suffixActive;
  final TextInputType keyboardType;
  final int? maxLength;
  final Size size;
  final TextAlign align;
  final double radius;
  final TextStyle? style;
  final List<BoxShadow>? shadows;
  final FocusNode? focus;
  final bool readOnly;

  CustomInputField({
    this.inputMaskList,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.color = Colors.white,
    this.errorText,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.iconWidget,
    this.suffixActive = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.size = const Size(double.infinity, 48),
    this.align = TextAlign.start,
    this.radius = 12,
    this.style,
    this.shadows,
    this.focus,
    this.readOnly = false,
  });

  TextStyle? _style;
  final hideNotifier = _HideNotifier(false);

  @override
  Widget build(BuildContext context) {
    _style = style;
    hideNotifier.value = suffixActive;
    return Container(
      // design
      alignment: Alignment.center,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: shadows == null
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, 8),
                  blurRadius: 8,
                )
              ]
            : shadows!.isEmpty
                ? null
                : shadows,
      ),
      child: _textFormField(context),
    );
  }

  Widget _textFormField(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: hideNotifier,
      builder: (_, value, __) {
        return TextFormField(
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
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            counterText: "",
            hintText: hintText,
            errorText: errorText,
            label: labelText != null ? Text(labelText!) : null,
            hintStyle: _style,
            labelStyle: _style,
            floatingLabelStyle: _style,
          ),
          textInputAction: TextInputAction.next,
          style: _style,
          obscureText: value,
          keyboardType: keyboardType,
          maxLength: maxLength,
          focusNode: focus,
          readOnly: readOnly,
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
        );
      },
    );
  }
}

class _HideNotifier<bool> extends ValueNotifier<bool> {
  _HideNotifier(bool value) : super(value);

  @override
  bool get value => super.value;

  @override
  set value(bool newValue) {
    super.value = newValue;
    notifyListeners();
  }
}
