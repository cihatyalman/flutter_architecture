import '../core/utils/mixins/helper_mixin.dart';

final hf = HelperFunction();

class HelperFunction with HelperMixin {
  Future<bool> login() async {
    return true;
  }

  Future<bool> logout() async {
    return true;
  }

  double changeOrder(List dataList, int index) {
    double newOrderNo = 0;
    if (index == 0) {
      newOrderNo = dataList.first.orderNo! + 100;
    } else if (index == dataList.length) {
      newOrderNo = dataList.last.orderNo! / 2;
    } else {
      newOrderNo =
          (dataList[index - 1].orderNo! + dataList[index].orderNo!) / 2;
    }
    return newOrderNo;
  }

// #region url_launcher ( https://pub.dev/packages/url_launcher )

  // void openUrl(String url) async {
  //   if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
  //     CustomNotify(message: "Url açılamadı !")
  //         .show(navigatorKey.currentContext!);
  //   }
  // }

  // void callPhone(String number) async {
  //   if (!await launchUrlString("tel:$number")) {
  //     CustomNotify(message: "Arama yapılamadı !")
  //         .show(navigatorKey.currentContext!);
  //   }
  // }

  // void sendEmail(String emailAddress, String? subject, String? body) async {
  //   String url = "mailto:$emailAddress";
  //   if (subject != null) {
  //     url += "?subject=${Uri.encodeComponent(subject)}";
  //     if (body != null) {
  //       url += "&body=${Uri.encodeComponent(body)}";
  //     }
  //   }
  //   if (!await launchUrlString(url)) {
  //     CustomNotify(message: "Beklenmedik bir hata oldu.")
  //         .show(navigatorKey.currentContext!);
  //   }
  // }

// #endregion
}
