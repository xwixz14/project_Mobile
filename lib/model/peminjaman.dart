class Peminjaman {
  String? NimMahasiswa;
  String? NamaMahasiswa;
  String? NamaBuku;
  String? TanggalPeminjaman;  
  String? TanggalPengembalian;

  Peminjaman ({
    this.NimMahasiswa,
    this.NamaMahasiswa,
    this.NamaBuku,
    this.TanggalPeminjaman,
    this.TanggalPengembalian,
  });

  factory Peminjaman.fromJson(Map<String, dynamic>json) => Peminjaman(
    NimMahasiswa: json['NimMahasiswa'],
    NamaMahasiswa: json['NamaMahasiswa'],
    NamaBuku :  json['NamaBuku'],
    TanggalPeminjaman: json['TanggalPeminjaman'],
    TanggalPengembalian: json['TanggalPengembalian'],
  );

  Map<String, dynamic> toJson () => {
    'NimMahasiswa' : this.NimMahasiswa,
    'NamaMahasiswa' : this.NamaMahasiswa,
    'NamaBuku' : this.NamaBuku,
    'TanggalPeminjaman' : this.TanggalPeminjaman,
    'TanggalPengembalian': this.TanggalPengembalian,
  };
}

