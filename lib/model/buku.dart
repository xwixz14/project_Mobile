class Buku {
  String? NamaBuku;
  String? Penerbit;
  String? TahunPenerbit;
  String? UploadGambar;

  Buku({
    this.NamaBuku,
    this.Penerbit,
    this.TahunPenerbit,
    this.UploadGambar,
  });

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        NamaBuku: json['NamaBuku'],
        Penerbit: json['Penerbit'],
        TahunPenerbit: json['TahunPenerbit'],
        UploadGambar: json['UploadGambar'],
      );

  Map<String, dynamic> toJson() => {
        'NamaBuku': this.NamaBuku,
        'Penerbit': this.Penerbit,
        'TahunPenerbit': this.TahunPenerbit,
        'UploadGambar': this.UploadGambar,
      };

  Buku.fromMap(Map<String, dynamic> map) {
    this.NamaBuku = map['NamaBuku'];
    this.Penerbit = map['Penerbit'];
    this.TahunPenerbit = map['TahunPenerbit'];
    this.UploadGambar = map['UploadGambar'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['NamaBuku'] = this.NamaBuku;
    map['Penerbit'] = this.Penerbit;
    map['TahunPenerbit'] = this.TahunPenerbit;
    map['UploadGambar'] = this.UploadGambar;
    return map;
  }
}
