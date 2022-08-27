final hf = HelperFunction();

class HelperFunction {
  // Map<String, String> get getHeaders => {
  //       HttpHeaders.authorizationHeader:
  //           "Bearer ${cacheService.box.get('token')}",
  //     };

  String passingTime(DateTime? datetime) {
    if (datetime == null) {
      return " - ";
    }

    final differenceTime = DateTime.now().difference(datetime);
    String result = "";
    if (differenceTime.inMinutes < 60) {
      result = "${differenceTime.inMinutes} dk";
    } else if (differenceTime.inHours < 48) {
      result = "${differenceTime.inHours} saat";
    } else if (differenceTime.inDays < 30) {
      result = "${differenceTime.inDays} gün";
    } else {
      result = "${(differenceTime.inDays / 30).toStringAsFixed(0)} ay";
    }
    return "$result önce";
  }

// #region url_launcher ( https://pub.dev/packages/url_launcher )

  // void openUrl(String url) async {
  //   if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
  //     CNoti(text: "Url açılamadı !").show(navigatorKey.currentContext!);
  //   }
  // }

  // void callPhone(String number) async {
  //   if (!await launchUrlString("tel:$number")) {
  //     CNoti(text: "Arama yapılamadı !").show(navigatorKey.currentContext!);
  //   }
  // }

// #endregion
}
