// ignore_for_file: must_call_super, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';




class Spetial extends StatefulWidget {
  @override
  _SpetialState createState() => _SpetialState();



}

class _SpetialState extends State<Spetial> with WidgetsBindingObserver {
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
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,

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
                              'Game Over',
                              style: TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.w300,
                                  color: Colors.white, fontFamily: 'Raleway'

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
                                  color: Colors.white, fontFamily: 'Raleway'

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
                                  color: Colors.white, fontFamily: 'Raleway'

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
                                  await HelperFunctions.savepointsSharedPreference('0');
                                  Navigator.of(context).pushNamed(
                                    'Newuser', arguments: '');

                                },
                                child: Text('Continue', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),
                                color: Colors.red[800],

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