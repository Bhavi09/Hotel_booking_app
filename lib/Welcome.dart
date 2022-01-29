import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_check_in/checkinthird.dart';
import 'package:hotel_check_in/checkoutthird.dart';
import 'checkoutsecond.dart';
import 'rooms.dart';
import 'global.dart';
import 'checkin.dart';
import 'checkout.dart';
import 'signin.dart';
import 'checkinsecond.dart';
import 'checkinthird.dart';
import 'checkoutthird.dart';
import 'package:carousel_slider/carousel_slider.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  String name = userdetail.displayName!.split(" ")[0];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> showcheckinDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Premier Room'),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/premier_room.png'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const checkin()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Premier Room with Pool'),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/premier_room_with_semi-private_pool_.png'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const checkinsecond()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Luxury Suite'),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/Luxury_Suite_living_room_P.jpg'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const checkinthird()));
                          },
                        ),
                      ),
                    ],
                  )),
              title: Text('Select Room Type'),
            );
          });
        });
  }

  Future<void> showcheckoutDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Premier Room'),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/premier_room.png'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const checkout()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Premier Room with Pool'),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/premier_room_with_semi-private_pool_.png'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const checkoutsecond()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Luxury Suite'),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/Luxury_Suite_living_room_P.jpg'),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const checkoutthird()));
                          },
                        ),
                      ),
                    ],
                  )),
              title: Text('Select Room Type'),
            );
          });
        });
  }

  List<dynamic> imgList = [
    "assets/premier_room.png",
    "assets/Kohinoor_Suite_living_room_P (1).jpg",
    "assets/premier_room_with_semi-private_pool_.png",
    "assets/Luxury_Suite_living_room_P.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Fortune Inn and suites",
              style: const TextStyle(color: Colors.purple, fontSize: 20)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: 300,
                          )),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '"It is our pleasure to welcome you"',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                "$name",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => rooms()));
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child:
                          Text('Book a room', style: TextStyle(fontSize: 20))),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    showcheckinDialog(context);
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text('Self check in',
                          style: TextStyle(fontSize: 20))),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    showcheckoutDialog(context);
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Text('Self check out',
                          style: TextStyle(fontSize: 20))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
