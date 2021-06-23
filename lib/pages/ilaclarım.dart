import 'package:flutter/material.dart';
import 'package:saglikcim/database/dbilac.dart';
import 'package:saglikcim/pages/ilacekle.dart';
import 'package:saglikcim/model/ilac.dart';

class Ilaclar extends StatefulWidget {
  @override
  _IlaclarState createState() => _IlaclarState();
}

class _IlaclarState extends State<Ilaclar> with SingleTickerProviderStateMixin {
  DbHelper _dbi;

  @override
  void initState() {
    _dbi = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("İlaçlarım",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IlacEkle(
                ilac: Ilac(),
              ),
            ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Ilac>> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data.isEmpty) return Text(" ");
            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Ilac ilac = snapshot.data[index];
                    return Dismissible(
                      key: Key(ilac.vakit),
                      onDismissed: (direction) async {
                        await _dbi.removeIlac(ilac.id);

                        setState(() {});
                        Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(milliseconds: 200),
                            content: Text("İlaç silindi.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic))));
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
                                  Text(ilac.vakit,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic)),
                                  Text(ilac.ad,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic)),
                                  Text(ilac.adet,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic)),
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
          future: _dbi.getIlac()),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:saglikcim/pages/aksam.dart';
import 'package:saglikcim/pages/ogle.dart';
import 'package:saglikcim/pages/sabah.dart';

// ignore: use_key_in_widget_constructors
class Ilaclar extends StatefulWidget {
  @override
  _IlaclarState createState() => _IlaclarState();
}

class _IlaclarState extends State<Ilaclar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İlaçlarım",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(),
            ),
            child: new GestureDetector(
              child: new Text("Sabah",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sabah()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(),
            ),
            child: new GestureDetector(
              child: new Text("Öğle",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ogle()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(),
            ),
            child: new GestureDetector(
              child: new Text("Akşam",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Aksam()));
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
*/
