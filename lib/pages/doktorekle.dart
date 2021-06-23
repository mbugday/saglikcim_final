import 'package:saglikcim/database/db.dart';
import 'package:flutter/material.dart';
import 'package:saglikcim/model/doktor.dart';

class DoktorEkle extends StatelessWidget {
  final Doktor doktor;

  const DoktorEkle({Key key, @required this.doktor}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(doktor.id==null ? "Yeni Doktor Ekle" : doktor.adsoyad,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
      ),
      body: SingleChildScrollView(child:DoktorForm(doktor:doktor,child: DoktorEkleForm())),
    );
  }
}
class DoktorForm extends InheritedWidget {
  final Doktor doktor;
  DoktorForm({Key key,  @required Widget child, @required this.doktor}) : super(key: key, child: child);
  static DoktorForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DoktorForm>();
  }

  @override
  bool updateShouldNotify(DoktorForm oldWidget) {
    return doktor.id != oldWidget.doktor.id;
  }

}
class DoktorEkleForm extends StatefulWidget {
  @override
  _DoktorEkleFormState createState() => _DoktorEkleFormState();
}

class _DoktorEkleFormState extends State<DoktorEkleForm> {
  final _formkey = GlobalKey<FormState>();
  DbHelper _db;

@override
  void initState() {
    _db=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Doktor doktor =DoktorForm.of(context).doktor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Ad Soyad",
                ),
                onSaved: (value) {
                  doktor.adsoyad = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Hastane"),
                onSaved: (value) {
                  doktor.hastane = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Bölüm"),
                onSaved: (value) {
                  doktor.bolum = value;
                },
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.teal,
              child: Text("Kaydet",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  _formkey.currentState.save();

                  if (doktor.id == null) {
                    await _db.insertDoktor(doktor);
                  }
                  var snackBar = Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text(
                          "Doktorunuz Eklendi.", textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                              fontStyle: FontStyle.italic))));

                  snackBar.closed.then((onValue) {
                    Navigator.pop(context);
                  },);
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}




/*class DoktorEkle extends StatefulWidget {
  @override
  _DoktorekleState createState() => _DoktorekleState();
}

class _DoktorekleState extends State<DoktorEkle> {

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
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: TextField(
              decoration: InputDecoration(
                labelText: "Ad Soyad",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.alt_route),
            title: TextField(
              decoration: InputDecoration(
                labelText: "Bölüm",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: TextField(
              decoration: InputDecoration(
                labelText: "Hastane",
              ),
            ),
          ),
          const Divider(
            height: 5.0,
          ),
          ListTile(
            leading: const Icon(Icons.add_ic_call),
            title: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefon",
              ),
            ),
          ),
          MaterialButton(
            elevation: 5.0,
            color: Colors.teal,
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
            onPressed: () {},
            child: Text(
              "Kaydet",
              textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
*/