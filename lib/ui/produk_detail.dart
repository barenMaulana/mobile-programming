import 'package:flutter/material.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';
import 'package:toko_kita/ui/produk_page.dart';
import 'package:toko_kita/bloc/produk_bloc.dart';
import 'package:toko_kita/widget/warning_dialog.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.produk?.image != null
                ? Image.network(
                    'http://localhost:8080/uploads/' + widget.produk!.image!,
                    height: 200,
                    width: 200,
                  )
                : Container(),
            Text(
              "Kode : ${widget.produk?.kodeProduk ?? 'N/A'}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk?.namaProduk ?? 'N/A'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : RP. ${widget.produk?.hargaProduk.toString() ?? 'N/A'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("Edit"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Delete"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  // void confirmHapus() {
  //   AlertDialog alertDialog = AlertDialog(
  //     content: const Text("Yakin ingin menghapus data ini?"),
  //     actions: [
  //       // tombol hapus
  //       OutlinedButton(
  //         child: const Text("Ya"),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => ProdukForm(
  //                 produk: widget.produk!,
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //       // tombol batal
  //       OutlinedButton(
  //         child: const Text("Batal"),
  //         onPressed: () => Navigator.pop(context),
  //       ),
  //     ],
  //   );

  //   showDialog(builder: (context) => alertDialog, context: context);
  // }
  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            Produk deleteProduk = Produk(id: null);
            deleteProduk.id = widget.produk!.id;
            ProdukBloc.deleteProduk(produk: deleteProduk).then((value) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ProdukPage()));
            }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                        description:
                            "Permintaan hapus data gagal, silahkan coba lagi",
                      ));
            });
          },
        ),
        // tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
