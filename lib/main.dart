import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signin.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Fortune Inn and suites",
    home: hotel_book(),
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
    debugShowCheckedModeBanner: false,
  ));
}

class hotel_book extends StatefulWidget {
  const hotel_book({Key? key}) : super(key: key);

  @override
  _hotel_bookState createState() => _hotel_bookState();
}

class _hotel_bookState extends State<hotel_book> {
  @override
  Widget build(BuildContext context) {
    return signin();
  }
}
