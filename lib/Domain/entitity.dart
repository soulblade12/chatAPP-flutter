class Message{
  String nama;
  String id;
  String Pesan;


  Message({required this.nama, required this.id, required this.Pesan});

  factory Message.fromJson(Map<String, dynamic> json) {
    return switch (json) {
    {
      'nama': String nama,
    'id': String id,
    'Pesan': String Pesan
    } =>
    Message(nama: nama, id: id, Pesan: Pesan),
    _ => throw const FormatException('Gagal membuat post')
  };
  }
  Map<String, dynamic> toJson() {
    return {
      'nama': this.nama,
      'id': this.id,
      'Pesan': this.Pesan
    };
  }

}