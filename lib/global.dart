import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Queue<int> PR = new Queue<int>();
Queue<int> PPV = new Queue<int>();
Queue<int> PRPP = new Queue<int>();
Queue<int> LS = new Queue<int>();
Queue<int> KS = new Queue<int>();

//For user details
var userdetail = FirebaseAuth.instance.currentUser!;
//*******************   Premier Room     *************************************
int found =-1;
int foundout = -1;
int available1 = 0;
int available2 = 0;
int available3 = 0;
List<dynamic> checkindetail=[];
List<dynamic> checkoutdetail=[];
void updatepr()async
{
  // for (int i = 101; i <= 300; i++) {
  //   PR.add(i);
  // }
  List<int> y=[];
  for(int i=101;i<=200;i++)
    {
      y.add(i);
    }
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("Premier");
  DocumentSnapshot snapshot = await _stock.get();
  // List<dynamic> x  = snapshot["PR"];
  //x.add(46);
  //x.removeAt(0);
  _stock.update({"PR":y});
}

Future<int> availablefirst()async
{
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("Premier");
  DocumentSnapshot snapshot = await _stock.get();
  return snapshot["avail"];
}
//******************  Premier room With private pool ***************************************

int foundpp =-1;
int foundoutpp = -1;
List<dynamic> checkindetailpp=[];
List<dynamic> checkoutdetailpp=[];
void updateprsecond()async
{
  // for (int i = 101; i <= 300; i++) {
  //   PR.add(i);
  // }
  List<int> y=[];
  for(int i=201;i<=300;i++)
  {
    y.add(i);
  }
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("Premierpool");
  DocumentSnapshot snapshot = await _stock.get();
  // List<dynamic> x  = snapshot["PR"];
  //x.add(46);
  //x.removeAt(0);
  _stock.update({"PR":y});
}
Future<int> availablesecond()async
{
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("Premierpool");
  DocumentSnapshot snapshot = await _stock.get();
  return snapshot["avail"];
}

//****************************** Luxury Suite *****************************
int foundsuite =-1;
int foundoutsuite = -1;
List<dynamic> checkindetailsuite=[];
List<dynamic> checkoutdetailsuite=[];



void updateprthird()async
{
  // for (int i = 101; i <= 300; i++) {
  //   PR.add(i);
  // }
  List<int> y=[];
  for(int i=1;i<=30;i++)
  {
    y.add(i);
  }
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("luxurysuite");
  DocumentSnapshot snapshot = await _stock.get();
  // List<dynamic> x  = snapshot["PR"];
  //x.add(46);
  //x.removeAt(0);
  _stock.update({"PR":y});
}
Future<int> availablethird()async
{
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("luxurysuite");
  DocumentSnapshot snapshot = await _stock.get();
  return snapshot["avail"];
}
//********************* Available ***********************

