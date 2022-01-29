import 'package:flutter/material.dart';
import 'Welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'global.dart';

class checkoutsecond extends StatefulWidget {
  const checkoutsecond({Key? key}) : super(key: key);

  @override
  _checkoutsecondState createState() => _checkoutsecondState();
}

class _checkoutsecondState extends State<checkoutsecond> {
  Future<int> recordcheckout() async {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference _stocks = _firestore.collection('Hotel');
    DocumentReference _stock = _stocks.doc("Premierpool");
    DocumentSnapshot snapshot = await _stock.get();
    String uid = userdetail.uid;
    //print(uid);
    List<dynamic> guestinfoout = snapshot["checkout"];
    print(guestinfoout);
    for (int i = 0; i < guestinfoout.length; i++) {
      //print(guestinfo[i]["uid"]);
      if (guestinfoout[i]["uid"] == uid) {
        print("***************uid got match****************out");
        foundoutpp = i;
        checkoutdetailpp.add(snapshot["checkout"][i]);
        print(checkoutdetailpp);
        break;
      }
    }
    return foundoutpp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text("Fortune Inn and suites",
                style: TextStyle(color: Colors.purple, fontSize: 20)),
          ),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
            future: recordcheckout(),
            // the function to get your data from firebase or firestore
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                return snap.data == -1
                    ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Room not Found",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                )
                    : Container(
                    alignment: Alignment.center,
                    child: buildImageInteractionCard(context));
              } else {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }));
  }
}

Widget buildImageInteractionCard(BuildContext context) {
  String name = checkoutdetailpp[0]["name"];
  String roomnos = "";
  for (int i = 0; i < checkoutdetailpp[0]["roomno"].length; i++) {
    String c = checkoutdetailpp[0]["roomno"][i].toString();
    if (i == 0) {
      roomnos = roomnos + '$c';
    } else {
      roomnos = roomnos + ', $c';
    }
  }
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.all(30),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: AssetImage("assets/premier_room_with_semi-private_pool_.png"),
              height: 240,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16).copyWith(bottom: 0),
          child: Column(children: [
            Text("Booking Details",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Name : $name",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rooms Number : $roomnos",
              style: TextStyle(fontSize: 16),
            )
          ]),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                checkoutdone();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Check-out done'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      bottom: 700.0, left: 10, right: 10, top: 10),
                  padding: EdgeInsets.all(10),
                ));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => welcome()));
              },
              child: Text("Check-out"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
            )
          ],
        )
      ],
    ),
  );
}

void checkoutdone() async {
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _stocks = _firestore.collection('Hotel');
  DocumentReference _stock = _stocks.doc("Premierpool");
  DocumentSnapshot snapshot = await _stock.get();
  List<dynamic> roomrestore = checkoutdetailpp[0]["roomno"];
  List<dynamic> firebaseroom = snapshot["PR"];
  int avail = snapshot["avail"];
  for (int i = 0; i < roomrestore.length; i++) {
    firebaseroom.add(roomrestore[i]);
    avail++;
  }
  _stock.update({"PR": firebaseroom});
  _stock.update({"avail": avail});
  List<dynamic> remove = snapshot["checkout"];
  remove.removeAt(foundoutpp);
  _stock.update({"checkout": remove});
  foundoutpp = -1;
}
