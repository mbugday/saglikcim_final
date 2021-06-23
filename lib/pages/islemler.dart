import 'package:flutter/material.dart';
import 'package:saglikcim/pages/doktorlar%C4%B1m.dart';
import 'package:saglikcim/pages/hakkinda.dart';
import 'package:saglikcim/pages/ilaclar%C4%B1m.dart';
import 'package:saglikcim/pages/notlar%C4%B1m.dart';
import 'package:saglikcim/pages/vkihesaplama.dart';

class Islemler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sağlıkçım",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: Text(
              "mab.6@gmail.com",
              textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
              accountName: Text(
                "Mali Buğday",
                textAlign: TextAlign.center,
                style:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text(
                  "S",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _Islemler(),
      backgroundColor: Colors.white,
    );
  }
}

class _Islemler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Islems(context);
  }
}

Widget _Islems(BuildContext context) {
  final ilacButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.teal,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ilaclar()));
      },
      child: Text(
        "İlaçlarım",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    ),
  );

  final doktorButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.teal,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Doktorlar()));
      },
      child: Text(
        "Doktorlarım",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    ),
  );

  final notButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.teal,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Notlar()));
      },
      child: Text(
        "Notlarım",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    ),
  );

  final vkiButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.teal,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Vki()));
      },
      child: Text(
        "Vücut Kitle Endeksi Hesapla",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    ),
  );
  final hakkindaButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.teal,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Hakkinda()));
      },
      child: Text(
        "Hakkında",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    ),
  );

  return Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15.0),
            ilacButton,
            SizedBox(height: 15.0),
            doktorButton,
            SizedBox(height: 15.0),
            notButton,
            SizedBox(height: 15.0),
            vkiButton,
            SizedBox(height: 15.0),
            hakkindaButton,
          ],
        ),
      ),
    ),
  );
}
