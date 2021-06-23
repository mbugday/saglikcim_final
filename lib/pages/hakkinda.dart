import 'package:flutter/material.dart';
import 'package:saglikcim/pages/islemler.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında', textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen '
                    '3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301041 numaralı Mehmet Ali BUĞDAY tarafından'
                    ' 25 Haziran 2021 günü yapılmıştır.', textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border.all(),
                ),
                child: new GestureDetector(
                  child: new Text("Geri Dön",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0)),
                  onSecondaryTapCancel: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Islemler()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
