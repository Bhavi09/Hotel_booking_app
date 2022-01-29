import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_check_in/part_room_second.dart';
import 'package:hotel_check_in/part_room_third.dart';
import 'part_room.dart';
import 'part_room_second.dart';
import 'global.dart';
import 'part_room_third.dart';

class rooms extends StatefulWidget {
  const rooms({Key? key}) : super(key: key);

  @override
  _roomsState createState() => _roomsState();
}

class _roomsState extends State<rooms> {
  void getroomno() async {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference _stocks = _firestore.collection('Hotel');
    DocumentReference _stock = _stocks.doc("Premier");
    DocumentSnapshot snapshot = await _stock.get();
    int x = snapshot['avail'];
    print("$x Room Available");
  }

  @override
  Widget build(BuildContext context) {
    updatepr();
    //updateprsecond();
     //updateprthird();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text("Fortune Inn and suites",
              style: TextStyle(color: Colors.purple, fontSize: 20)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              buildImageInteractionCard(
                  'assets/premier_room.png',
                  "Enjoy garden views from your bay window seat and private courtyard views from the bathroom.",
                  HotelDetailsPage(),
                  context,
                  "Premier Room",1),
              SizedBox(
                height: 20,
              ),
              buildImageInteractionCard(
                  'assets/premier_room_with_semi-private_pool_.png',
                  "A private courtyard provides direct access to a  private pool with breathtaking lake views.",
                  HotelDetailsPagepp(),
                  context,
                  "Premier Room with Pool",2),
              SizedBox(
                height: 20,
              ),
              buildImageInteractionCard(
                  'assets/Luxury_Suite_living_room_P.jpg',
                  "With a living room, a dining room, a private pool, al fresco dining and garden views.",
                  HotelDetailsPagesuite(),
                  context,
                  "Suite with Private Pool and garden, Lake view",3),
              SizedBox(
                height: 20,
              ),
              //   buildImageInteractionCard(
              //       'assets/Luxury_Suite_living_room_P.jpg',"With a living room, a dining room, a private pool, al fresco dining and garden views."),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   buildImageInteractionCard(
              //       'assets/Kohinoor_Suite_living_room_P (1).jpg',"A truly majestic suite featuring a dining room, a living room and a private pool."),
              //   SizedBox(
              //     height: 20,
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImageInteractionCard(
        String x, String y, Widget z, BuildContext context, String name,int i) =>
    Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: AssetImage(x),
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
              Text(name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text(
                y,
                style: TextStyle(fontSize: 16),
              ),
            ]),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async{
                  if(i==1)
                    {
                      available1 = await availablefirst();
                    }
                  if(i==2)
                  {
                    available2 =await availablesecond();
                  }
                  if(i==3)
                  {
                    available3 = await availablethird();
                  }
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => z));
                },
                child: Text("BOOK NOW"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
              )
            ],
          )
        ],
      ),
    );
