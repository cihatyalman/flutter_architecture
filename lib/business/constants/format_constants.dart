import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatConstants {
  static String dateFormatddMMyyyy(DateTime dateTime) =>
      DateFormat("dd-MM-yyyy").format(dateTime);

  static String dateFormatyMMMd(DateTime dateTime) =>
      DateFormat.yMMMd().format(dateTime);

  static String dateFormatyMMMdHm(DateTime dateTime) =>
      DateFormat.yMMMd().add_Hm().format(dateTime);

  static MaskTextInputFormatter get getPhoneMasked =>
      MaskTextInputFormatter(mask: "+90 (###) ### ## ##");

  static MaskTextInputFormatter get getIbanMasked =>
      MaskTextInputFormatter(mask: "TR## #### #### #### #### #### ##");

  static MaskTextInputFormatter get getCardMasked =>
      MaskTextInputFormatter(mask: "#### #### #### ####");
}
