import 'dart:convert';
import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    List<dynamic> listProduk = response['data'];
    List<Produk> produks =
        listProduk.map((data) => Produk.fromJson(data)).toList();
    return produks;
  }

  static Future addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProduk;
    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    var response = await Api().post(apiUrl, body);
    return response['status'];
  }

  static Future<bool> updateProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    // var response = await Api().post(apiUrl, body);
    // return response['status'];
    print("Body : $body");
    var response = await Api().put(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // static Future<bool> deleteProduk({int? id}) async {
  //   String apiUrl = ApiUrl.deleteProduk(id!);
  //   var response = await Api().delete(apiUrl);
  //   return response['data'];
  // }
  static Future<bool> deleteProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.deleteProduk(produk.id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
