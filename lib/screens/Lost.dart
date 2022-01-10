// ignore_for_file: must_call_super, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';




class Lost extends StatefulWidget {
  @override
  _LostState createState() => _LostState();



}

class _LostState extends State<Lost> with WidgetsBindingObserver {
  
  String points='0';



  initState() {
    fn();
  }

  Future<void> fn() async {
    points=await HelperFunctions.getpointsSharedPreference();
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
                              height: 100
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              'Game over you lost',
                              style: TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.w300,
                                  color: Colors.black, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),
                            SizedBox(
                              height: 20
                              ,
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),width : 300,child: Text(
                              'You earned :',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w300,
                                  color: Colors.black, fontFamily: 'Raleway'

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
                                  color: Colors.black, fontFamily: 'Raleway'

                              ),
                              textAlign: TextAlign.left,
                            ),),
                            SizedBox(
                              height: 30
                              ,
                            ),
                           
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                padding: const EdgeInsets.symmetric(horizontal: 50,
                                    vertical: 15),
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 60),
                                  shape: StadiumBorder(),
                                   onPressed: () async {
                                  await HelperFunctions.savepointsSharedPreference('0');
                                  Navigator.of(context).pushNamed(
                                      'Newuser', arguments: '');

                                },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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