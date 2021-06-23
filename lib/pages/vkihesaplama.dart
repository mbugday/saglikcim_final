import 'package:flutter/material.dart';
import 'package:saglikcim/pages/vkigrafik.dart';


class Vki extends StatefulWidget {
  @override
  _VkiState createState() => _VkiState();
}

class _VkiState extends State<Vki> {
  TextEditingController kilo = new TextEditingController();
  TextEditingController boy = new TextEditingController();
  double sonuc = 0;

  void hesapla() {
    setState(() {
      sonuc = double.parse(kilo.text) /
          (double.parse(boy.text) * double.parse(boy.text));
      sonuc *= 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vücut Kitle Endeksi",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: kilo,
                decoration: const InputDecoration(
                  hintText: 'Kilonuz',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: boy,
                decoration: const InputDecoration(
                  hintText: 'Boyunuz (cm)',
                ),
              ),
            ),
            Text("    "),
            Text(
              "Vücut Kitle İndeksiniz (BKİ) : " + sonuc.toString(),
              textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.black87, fontStyle: FontStyle.italic),
            ),
            Text("    "),
            Text("    "),
            /*MaterialButton(
              elevation: 5.0,
              color: Colors.teal,
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
              onPressed: () {
                hesapla();
              },
              child: Text(
                "Hesapla",
                textAlign: TextAlign.center,
                style:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),*/
            Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border.all(),
                ),
                child: new GestureDetector(
                  child: new Text("Hesapla",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0)),
                  onDoubleTap: () {
                  hesapla();
                    },
                ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.teal,
                border: Border.all(),
              ),
              child: new GestureDetector(
                child: new Text("Grafiği İncele",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0)),
                onLongPressUp: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LineChartSample2()));

                },
              ),
            ),
            /*Text("    "),
            Text(
                "0 ila 18,4 BKI: Zayıf."),
            Text("    "),
            Text(
                "18.5 ila 24.9 BKI: Normal."),
            Text("    "),
            Text(
                "25 ila 29.9 BKI: Fazla Kilolu."),
            Text("    "),
            Text(
                "30 ila 34.9 BKI: Şişman. Birinci derece obez."),
            Text("    "),
            Text(
                "35 ila 44.9 BKI: Şişman. İkinci derece obez."),
            Text("    "),
            Text(
                "45+ BKI: Aşırı Şişman."),*/

          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
