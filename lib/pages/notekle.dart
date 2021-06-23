import 'package:saglikcim/database/dbnot.dart';
import 'package:flutter/material.dart';
import 'package:saglikcim/model/nt.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotEkle extends StatelessWidget {
  final Nt nt;

  const NotEkle({Key key, @required this.nt}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(nt.id==null ? "Notunuz" : "Notu Düzenle",textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontStyle: FontStyle.italic)),
      ),
      body: SingleChildScrollView(child:NotForm(nt:nt,child: NotEkleForm())),
    );
  }
}
class NotForm extends InheritedWidget {
  const NotForm({Key key,@required this.nt, @required Widget child}) : super(key: key, child: child);
  final Nt nt;

  static NotForm of(BuildContext context) {
    final NotForm result = context.dependOnInheritedWidgetOfExactType();
    assert (result != null);
    return result;
    //return context.dependOnInheritedWidgetOfExactType<NotForm>();
    }

  @override
  bool updateShouldNotify(NotForm old) => nt != old.nt;
    //return nt.id != oldWidget.nt.id;


}
class NotEkleForm extends StatefulWidget {
  @override
  _NotEkleFormState createState() => _NotEkleFormState();
}

class _NotEkleFormState extends State<NotEkleForm> {
  final _formkey = GlobalKey<FormState>();
  DbHelper _dbn;

  @override
  void initState() {
    _dbn=DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Nt nt =NotForm.of(context).nt;

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
                  hintText: "Not"),
                initialValue: nt.nt,
                onSaved: (value) {
                  nt.nt = value;
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

                    if (nt.id == null) {
                      await _dbn.insertNt(nt);
                    } else {
                      await _dbn.updateNt(nt);
                    }

                    var snackBar = Scaffold.of(context).showSnackBar(SnackBar(
                        duration: Duration(milliseconds: 250),
                        content: Text(
                            "Not Eklendi.", textAlign: TextAlign.center,
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
