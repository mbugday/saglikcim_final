import 'package:flutter/material.dart';
import 'package:saglikcim/database/dbnot.dart';
import 'package:saglikcim/pages/notekle.dart';
import 'package:saglikcim/model/nt.dart';

class Notlar extends StatefulWidget {
  @override
  _NotlarState createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> with SingleTickerProviderStateMixin {
  DbHelper _dbn;

  @override
  void initState() {
    _dbn = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Notlarım",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotEkle(
                nt: Nt(),
              ),
            ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Nt>> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data.isEmpty) return Text(" ");
            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Nt nt = snapshot.data[index];
                    
                    return GestureDetector(
                      onDoubleTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotEkle(
                              nt:nt,
                            ),
                          ),
                        );
                      },
                      child: Dismissible(
                        key: Key(nt.nt),
                        onDismissed: (direction) async {
                          await _dbn.removeNt(nt.id);

                          setState(() {});
                          Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 200),
                              content: Text("Not silindi.",
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
                                    Text(nt.nt,
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
                      ),
                    );
                  }),
            );
          },
          future: _dbn.getNt()),
    );
  }
}
