import 'package:flutter/material.dart';
import 'package:saglikcim/database/db.dart';
import 'package:saglikcim/pages/doktorekle.dart';
import 'package:saglikcim/model/doktor.dart';

class Doktorlar extends StatefulWidget {
  @override
  _DoktorlarState createState() => _DoktorlarState();
}

class _DoktorlarState extends State<Doktorlar> with SingleTickerProviderStateMixin{
  DbHelper _db;

  @override
  void initState() {
  _db=DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title:  Text("Doktorlar",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => DoktorEkle(
                  doktor: Doktor(),
              ),
          ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Doktor>> snapshot){
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data.isEmpty) return Text(" ");
          return Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Doktor doktor = snapshot.data[index];
                  return Dismissible(
                    key: Key(doktor.adsoyad),
                    onDismissed: (direction) async{
                      await _db.removeDoktor(doktor.id);

                      setState((){});
                      Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 200),
                          content: Text("Doktor silindi.",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic))));
                    },
                    child: Container(
                      color: Colors.teal,
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(doktor.adsoyad,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
                                Text(doktor.hastane,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
                                Text(doktor.bolum,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                          Divider(
                            height: 100.0,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
          },
          future: _db.getDoktor()
      ),
    );
  }
}


//,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)

/*class Doktorlar extends StatefulWidget {
  @override
  _DoktorlarState createState() => _DoktorlarState();
}

class _DoktorlarState extends State<Doktorlar> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doktorlarım",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(),
            ),
            child: new GestureDetector(
              child: new Text("Ekle",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic,fontSize: 25.0)
              ),
              onDoubleTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Doktorekle()));
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
/*floatingActionButton: FloatingActionButton(
onPressed: (){
Navigator.push(
context, MaterialPageRoute(builder: (context) => Doktorekle()));
},
child: Icon(Icons.add),
),*/
*/