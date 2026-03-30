import 'package:flutter/material.dart';

import '../../../shared/constants/format_constants.dart';
import '../../../widgets/project/c_input.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        CInput(hintText: "Default"),
        CInput(labelText: "Label"),
        CInput(hintText: "Disabled", enabled: false),
        CInput(initialValue: "Read Only", readOnly: true),
        CInput(hintText: "Prefix Icon", prefixIcon: Icon(Icons.lock)),
        CInput(
          hintText: "Suffix Icon",
          suffixIcon: Icon(Icons.visibility_rounded),
        ),
        CInput(
          hintText: "Bilgi mesajı olan input",
          helperText: "Bilgi mesajı..",
        ),
        CInput(hintText: "Hatalı input", errorText: "Hata mesajı.."),
        CInput(hintText: "Max karakter", maxLength: 10),
        CInput(
          hintText: "Maskeleme [+90 (123) 456 78 90]",
          keyboardType: TextInputType.number,
          inputMaskList: [FormatConstants.getPhoneMasked],
        ),
        CInput(hintText: "Textarea", maxLines: 3),
      ],
    );
  }
}
