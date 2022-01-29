import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'global.dart';

class HotelDetailsPagepp extends StatefulWidget {
  static final String path = "";
  static final image = "assets/premier_room.png";

  @override
  State<HotelDetailsPagepp> createState() => _HotelDetailsPageppState();
}

class _HotelDetailsPageppState extends State<HotelDetailsPagepp> {
  final String image = "assets/premier_room_with_semi-private_pool_.png";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _checkdate = TextEditingController();
  late int guestno;
  String uid = userdetail.uid;

  void addguest(String name, int roomno,String num,String date) async {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference _stocks = _firestore.collection('Hotel');
    DocumentReference _stock = _stocks.doc("Premierpool");
    DocumentSnapshot snapshot = await _stock.get();
    List<dynamic> y = await snapshot["PR"];
    print(y);
    int avail = await snapshot["avail"];
    List<dynamic> proomno = [];
    for (int i = 0; i < roomno; i++) {
      proomno.add(y.elementAt(i));
      avail--;
    }
    y.removeRange(0, roomno);
    print(y);
    List<dynamic> x = await snapshot["guestdetail"];
    x.add({"name": name, "roomno": proomno, "uid": uid,"Mobile_number":num,"Check-in_Date":date});
    _stock.update({"guestdetail": x});
    _stock.update({"PR": y});
    _stock.update({"avail": avail});
  }

  Future<void> showInformationDialog(BuildContext context) async {
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
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter any text";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter your name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _phonenumber,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter Mobile Number";
                        },
                        decoration:
                        InputDecoration(hintText: "Mobile Number"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Enter Check-in Date"),
                      TextFormField(
                        controller: _checkdate,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter any date";
                        },
                        decoration:
                        InputDecoration(hintText: "DD/MM/YYYY"),
                      ),
                      SizedBox(height: 20),
                      Text("Number of room"),
                      SizedBox(
                        height: 5,
                      ),
                      NumberInputPrefabbed.roundedButtons(
                        controller: TextEditingController(),
                        incDecBgColor: Colors.purple,
                        min: 1,
                        max: available2,
                        onIncrement: (num newlyIncrementedValue) {
                          guestno = newlyIncrementedValue.toInt();
                        },
                        onDecrement: (num newlyDecrementedValue) {
                          guestno = newlyDecrementedValue.toInt();
                        },
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Choice Box"),
                      //     Checkbox(
                      //         value: isChecked,
                      //         onChanged: (checked) {
                      //           setState(() {
                      //             isChecked = checked!;
                      //           });
                      //         })
                      //   ],
                      // )
                    ],
                  )),
              title: Text('Details'),
              actions: <Widget>[
                InkWell(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                  onTap: () {
                    String name = _textEditingController.text;
                    String cnumber = _phonenumber.text;
                    String cdate = _checkdate.text;

                    addguest(name, guestno,cnumber,cdate);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Successfully booked!!'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 20.0),
                    ));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            child: Ink.image(
              image: AssetImage(image),
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Premier Room with private pool",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Row(
                //   children: <Widget>[
                //     const SizedBox(width: 16.0),
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //         vertical: 8.0,
                //         horizontal: 16.0,
                //       ),
                //       decoration: BoxDecoration(
                //           color: Colors.grey,
                //           borderRadius: BorderRadius.circular(20.0)),
                //       child: Text(
                //         "8.4/85 reviews",
                //         style: TextStyle(color: Colors.white, fontSize: 13.0),
                //       ),
                //     ),
                //     Spacer(),
                //     IconButton(
                //       color: Colors.white,
                //       icon: Icon(Icons.favorite_border),
                //       onPressed: () {},
                //     )
                //   ],
                // ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: Colors.purple,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: "20 km from Airport")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                                SizedBox(height: 10,),
                                Text("Available room :$available2",style: TextStyle(color: Colors.red),)
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "\₹ 80,500",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "/per night",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.purple,
                          textColor: Colors.white,
                          child: Text(
                            "Book Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            showInformationDialog(context);
                          },
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "A private courtyard provides direct access to a semi private pool with breathtaking lake views.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "A pool experience beyond compare. From the latched gate on your private terrace, you can slip into a breathtaking semi private pool with uninterrupted lake views. Or simply relax on a sun lounger. Inside your room, naturally lit 55.74 square metres interiors, are enhanced with bursts of colour and traditional Indian fabrics. Furnishings include a two poster king size bed, a plush sofa and a wooden writing desk. The marble bathroom also offers lake views.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: BottomNavigationBar(
          //     backgroundColor: Colors.white54,
          //     elevation: 0,
          //     selectedItemColor: Colors.black,
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.search), title: Text("Search")),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.favorite_border),
          //           title: Text("Favorites")),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.settings), title: Text("Settings")),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
