class Nt {
  int id;
  var nt;

  Nt({this.nt});

  Map<String,dynamic>toMap() {
    var map = Map<String, dynamic>();
    map["nt"]=nt;
    return map;

  }

  Nt.fromMap(Map<String,dynamic>map){
    id=map["id"];
    nt=map["nt"];

  }

}