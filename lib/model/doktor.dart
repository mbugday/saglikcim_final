class Doktor {
  int id;
  String adsoyad;
  String hastane;
  String bolum;


  Doktor({this.adsoyad,this.hastane,this.bolum});

  Map<String,dynamic>toMap() {
    var map = Map<String, dynamic>();
    map["adsoyad"] = adsoyad;
    map["hastane"]=hastane;
    map["bolum"]=bolum;
    return map;

  }

  Doktor.fromMap(Map<String,dynamic>map){
    id=map["id"];
    adsoyad=map["adsoyad"];
    hastane=map["hastane"];
    bolum=map["bolum"];

  }


}