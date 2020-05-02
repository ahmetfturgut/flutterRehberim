class Notlar {
  int notId;
  int kategoriID;
  String notBaslik;
  String notIcerik;
  String notTarih;
  int notOncelik;

  Notlar(this.kategoriID, this.notBaslik, this.notIcerik, this.notTarih,
      this.notOncelik);

  Notlar.withId(this.notId, this.kategoriID, this.notBaslik, this.notIcerik,
      this.notTarih, this.notOncelik);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["notId"] = notId;
    map["kategoriID"] = kategoriID;
    map["notBaslik"] = notBaslik;
    map["notIcerik"] = notIcerik;
    map["notTarih"] = notTarih;
    map["notOncelik"] = notOncelik;
  }

  Notlar.fromMap(Map<String, dynamic> map) {
    this.kategoriID = map["kategoriID"];
    this.kategoriID = map["kategoriID"];
    this.notBaslik = map["kategoriID"];
    this.notIcerik = map["kategoriID"];
    this.notTarih = map["kategoriID"];
    this.notOncelik = map["kategoriID"];
  }

  @override
  String toString() {
    return 'Notlar{notId: $notId, kategoriID: $kategoriID, notBaslik: $notBaslik, notIcerik: $notIcerik, notTarih: $notTarih, notOncelik: $notOncelik}';
  }


}
