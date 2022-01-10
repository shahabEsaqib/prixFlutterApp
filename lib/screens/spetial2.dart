// ignore_for_file: must_call_super, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';




class Spetial2 extends StatefulWidget {
  @override
  _Spetial2State createState() => _Spetial2State();



}

class _Spetial2State extends State<Spetial2> with WidgetsBindingObserver {
  String points ='';
  String myUsername;
  bool test ;



  initState() {
    fn();
  }

  Future<void> fn() async {
    test = await HelperFunctions.getgameSharedPreference();
    myUsername=await HelperFunctions.getUserNameSharedPreference();
    print(myUsername);
    await FirebaseFirestore.instance.collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) async {
      if (value != null) {
        print(value.docs[0].data()["points"]);

        setState(() {points= value.docs[0].data()["points"];});


      }
    });
  }


  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            // BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.white,

                body: Form(

                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 200
                              ,
                            ),

                            SizedBox(
                              height: 20
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              'You have :',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade600, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),

                            SizedBox(
                              height: 30
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              '     '+points+' points',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade600, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),
                            SizedBox(
                              height: 30
                              ,
                            ),
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 80),
                                shape: StadiumBorder(),
                                onPressed: () async {
                                  if(test==true){Navigator.of(context).pushNamed(
                                      'Olduser', arguments: '');}
                                  else{Navigator.of(context).pushNamed(
                                      'Newuser', arguments: '');}


                                },
                                child: Text('Back', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),
                                color: Colors.green,

                              ),
                            ),





                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),]
      ),
    );
  }}