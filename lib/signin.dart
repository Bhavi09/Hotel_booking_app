import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'Welcome.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final AuthService authService = AuthService();
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/welcome.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.srcOver)),
          ),
          child: Column(
            children: [
              SizedBox(height:70,),
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/logofinal.png'),
              ),
              SizedBox(
                height: 450,
              ),
              user == null
                  ? SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text(
                    "Sign-in",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  onPressed: () {
                    authService.signInWithGoogle().then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const welcome())));
                  },
                ),
              )
                  : SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text(
                    "Explore Booking",
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const welcome()));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
