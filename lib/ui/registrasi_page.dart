import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class RegistrasiPageState extends State<RegistrasiPage> {
final _formKey = GlobalKey<FormState>();
bool isLoading = false;

final _namaTextboxController = TextEditingController();
final _emailTextboxController = TextEditingController () ;
final _passwordTextboxController = TextEditingController () ;

@override
Widget build (BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: const Text ("Registrasi"),
  ), 
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all (8.0), child: 
        Form( key: _formKey, child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [_namaTextField(), _emailTextField(), _passwordTextField(), _passwordKonfirmasiTextField(), _buttonRegistrasi ()];
        ),
      ),
      ),
    ),
  );
}


Widget namaTextField() {
  return TextFormField(
    decoration: const InputDecoration (labelText: "Nama"), 
    keyboardType: TextInputType.text, 
    controller: _namaTextboxController,
    validator: (value) {
      if (value!.length < 3) {
        return "Nama harus diisi minimal 3 karakter";
      }
      return null;
    },
  );
}



}
