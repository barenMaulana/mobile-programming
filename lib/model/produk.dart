class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;
  String? image;

  Produk(
      {this.id,
      this.kodeProduk,
      this.namaProduk,
      this.hargaProduk,
      this.image});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: int.parse(json['id']),
      kodeProduk: json['kode_produk'],
      namaProduk: json['nama_produk'],
      hargaProduk: int.parse(json['harga']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_produk': kodeProduk,
      'nama_produk': namaProduk,
      'harga': hargaProduk,
      'image': image,
    };
  }
}
