import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPageState();
  }

}

class _ForgotPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body:Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://wallpaperaccess.com/full/2727570.jpg"),
              fit: BoxFit.fill),
        ),
        child:
          Column(
            children: [
              const Text("Please contact the admin to reset your password",
                style: TextStyle(fontSize: 20, color: Colors.white,),
              ),
            ],
          ),
      ),
    );
  }

}