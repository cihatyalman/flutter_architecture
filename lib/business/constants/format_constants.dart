import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatConstants {
  // y yy yyy yyyy   ->  "8 08 008 2008"   year
  // M MM MMM MMMM   ->  "3 03 Mar March"  month
  // d dd ddd dddd   ->  "9 09 Sun Sunday" day
  // h hh H HH       ->  "4 04 16 16"      hour 12/24
  // m mm            ->  "5 05"            minute
  // s ss            ->  "7 07"            second

  static String dateFormatBase(DateTime dateTime) =>
      DateFormat("dd.MM.yyyy HH:mm:ss").format(dateTime);

  static MaskTextInputFormatter get getPhoneMasked =>
      MaskTextInputFormatter(mask: "+90 (###) ### ## ##");

  static MaskTextInputFormatter get getIbanMasked =>
      MaskTextInputFormatter(mask: "TR## #### #### #### #### #### ##");

  static MaskTextInputFormatter get getCardMasked =>
      MaskTextInputFormatter(mask: "#### #### #### ####");
}
