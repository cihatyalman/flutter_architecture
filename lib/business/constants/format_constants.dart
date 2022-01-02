import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatConstants {
  static String dateFormatddMMyyyy(DateTime dateTime) =>
      DateFormat("dd-MM-yyyy").format(dateTime);

  static MaskTextInputFormatter get getPhoneMasked =>
      MaskTextInputFormatter(mask: "+90 (###) ### ## ##");

  static MaskTextInputFormatter get getIbanMasked =>
      MaskTextInputFormatter(mask: "TR## #### #### #### #### #### ##");

  static MaskTextInputFormatter get getCardMasked =>
      MaskTextInputFormatter(mask: "#### #### #### ####");
}
