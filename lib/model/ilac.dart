class Ilac {
  int id;
  String vakit;
  String ad;
  String adet;


  Ilac({this.vakit,this.ad,this.adet});

  Map<String,dynamic>toMap() {
    var map = Map<String, dynamic>();
    map["vakit"]=vakit;
    map["ad"] = ad;
    map["adet"]=adet;
    return map;

  }

  Ilac.fromMap(Map<String,dynamic>map){
    id=map["id"];
    vakit=map["vakit"];
    ad=map["ad"];
    adet=map["adet"];

  }

}