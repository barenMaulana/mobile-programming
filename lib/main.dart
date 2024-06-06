import 'package:flutter/material.dart';
import 'package:toko_kita/ui/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      //home: RegistrasiPage(),
      home: LoginPage(),
    );
  }
}
