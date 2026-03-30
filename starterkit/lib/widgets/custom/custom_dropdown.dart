import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final void Function(T? item) onChanged;
  final DropdownMenuEntry<T> Function(T item)? itemWidget;
  final String? hintText;
  final int startIndex;
  final bool enabled;

  CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.itemWidget,
    this.hintText,
    this.startIndex = -1,
    this.enabled = true,
  }) : assert(items.isNotEmpty || hintText != null);

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.startIndex == -1
        ? null
        : widget.items[widget.startIndex];
  }

  Size get size => MediaQuery.of(context).size;
  final inputCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enabled: widget.enabled,
      expandedInsets: EdgeInsets.zero,
      menuHeight: size.height * .5,

      trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded, size: 24),
      selectedTrailingIcon: const Icon(
        Icons.keyboard_arrow_up_rounded,
        size: 24,
      ),
      hintText: widget.hintText ?? "Bir seçim yapın",
      textStyle: const TextStyle(fontSize: 14),

      controller: inputCtrl,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black.withAlpha(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        constraints: const BoxConstraints(maxHeight: 48),
      ),

      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStatePropertyAll(8),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      requestFocusOnTap: true,
      enableFilter: true,

      initialSelection: selectedItem,
      onSelected: (value) {
        setState(() {
          selectedItem = value;
          widget.onChanged.call(value);
        });
        if (value == null) inputCtrl.clear();
      },
      dropdownMenuEntries: widget.items.map((e) {
        if (widget.itemWidget != null) return widget.itemWidget!.call(e);
        return DropdownMenuEntry<T>(value: e, label: e.toString());
      }).toList(),
    );
  }
}
