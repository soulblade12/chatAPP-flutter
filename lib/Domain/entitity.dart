class Message{
  String nama;
  String id;
  String Pesan;


  Message({required this.id, required this.nama, required this.Pesan});


  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nama': this.nama,
      'Pesan': this.Pesan
    };
  }

}