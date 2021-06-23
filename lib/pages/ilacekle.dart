import 'package:saglikcim/database/dbilac.dart';
import 'package:flutter/material.dart';
import 'package:saglikcim/model/ilac.dart';

class IlacEkle extends StatelessWidget {
  final Ilac ilac;

  const IlacEkle({Key key, @required this.ilac}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(ilac.id==null ? "Yeni İlaç Ekle" : ilac.ad,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
      ),
      body: SingleChildScrollView(child:IlacForm(ilac:ilac,child: IlacEkleForm())),
    );
  }
}
class IlacForm extends InheritedWidget {
  final Ilac ilac;
  IlacForm({Key key,  @required Widget child, @required this.ilac}) : super(key: key, child: child);
  static IlacForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IlacForm>();
  }

  @override
  bool updateShouldNotify(IlacForm oldWidget) {
    return ilac.id != oldWidget.ilac.id;
  }

}
class IlacEkleForm extends StatefulWidget {
  @override
  _IlacEkleFormState createState() => _IlacEkleFormState();
}

class _IlacEkleFormState extends State<IlacEkleForm> {
  final _formkey = GlobalKey<FormState>();
  DbHelper _dbi;

  @override
  void initState() {
    _dbi=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Ilac ilac =IlacForm.of(context).ilac;

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
                  hintText: "Vakit",
                ),
                onSaved: (value) {
                  ilac.vakit = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "İlaç adı",
                ),
                onSaved: (value) {
                  ilac.ad = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Adet"),
                onSaved: (value) {
                  ilac.adet = value;
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

                    if (ilac.id == null) {
                      await _dbi.insertIlac(ilac);
                    }

                    var snackBar = Scaffold.of(context).showSnackBar(SnackBar(
                        duration: Duration(milliseconds: 250),
                        content: Text(
                            "İlaç Eklendi.", textAlign: TextAlign.center,
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
