import 'package:flutter/material.dart';
// import 'package:toko_kita/ui/registrasi_page.dart';
import 'package:toko_kita/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      //home: RegistrasiPage(),
      // home: LoginPage(),
      home: ProdukPage(),
    );
  }
}
