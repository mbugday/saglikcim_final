import 'package:flutter/material.dart';
import 'package:saglikcim/pages/islemler.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlıkçım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: LoginHome(),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LoginHome(context);
  }
}

// ignore: non_constant_identifier_names
Widget _LoginHome(BuildContext context) {
  return Center(
    // ignore: avoid_unnecessary_containers
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/images/giris.png')),
            // ignore: avoid_unnecessary_containers
            Container(
              child: GestureDetector(
                child: const Text(
                  "SAĞLIKÇIM",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 50.0),
                ),
                onLongPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Islemler()));
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

