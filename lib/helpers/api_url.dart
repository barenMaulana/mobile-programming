class ApiUrl {
  static const String baseUrl = "https://10.0.2.2/toko-api/public";

  static const String login = baseUrl + "/login";
  static const String registrasi = baseUrl + "/register";
  static const String listProduk = baseUrl + "/produk";
  static const String createProduk = baseUrl + "/produk";

  static String updateProduk(int id) {
    return baseUrl + "/produk/" + id.toString() + "/update";
  }

  static String deleteProduk(int id) {
    return baseUrl + "/produk/" + id.toString() + "/delete";
  }

  static String showProduk(int id) {
    return baseUrl + "/produk/" + id.toString();
  }
}
