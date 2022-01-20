class TextConstants {
  static const baseUrl = "BaseUrl";

  static String? getMonthName(int value) {
    String? result;
    switch (value) {
      case 1:
        result = "Ocak";
        break;
      case 2:
        result = "Şubat";
        break;
      case 3:
        result = "Mart";
        break;
      case 4:
        result = "Nisan";
        break;
      case 5:
        result = "Mayıs";
        break;
      case 6:
        result = "Haziran";
        break;
      case 7:
        result = "Temmuz";
        break;
      case 8:
        result = "Ağustos";
        break;
      case 9:
        result = "Eylül";
        break;
      case 10:
        result = "Ekim";
        break;
      case 11:
        result = "Kasım";
        break;
      case 12:
        result = "Aralık";
        break;
    }
    return result;
  }

  static String? getDayName(int value) {
    String? result;
    switch (value) {
      case 1:
        result = "Pazartesi";
        break;
      case 2:
        result = "Salı";
        break;
      case 3:
        result = "Çarşamba";
        break;
      case 4:
        result = "Perşembe";
        break;
      case 5:
        result = "Cuma";
        break;
      case 6:
        result = "Cumartesi";
        break;
      case 7:
        result = "Pazar";
        break;
    }
    return result;
  }
}
