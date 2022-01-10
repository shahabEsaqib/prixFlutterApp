// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


// ignore: must_be_immutable
class ToGameStats extends StatelessWidget {
  bool buttoncheck;
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey.shade600,
                  elevation: 0,



                  title: Text("New Game"),

                ),
                body: Form(

                  child:
                  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(
                            height: 215
                            ,
                          ),
                          // FlatButton(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 10, horizontal: 75),
                          //   shape: StadiumBorder(),
                          //   onPressed: () async {
                          //     Navigator.of(context).pushNamed(
                          //         'gamestats', arguments: '');



                          //   },
                          //   child: Text('Game Stats', style: TextStyle(color: Colors
                          //       .white, fontSize: 25, fontWeight: FontWeight.w700
                          //     ,),),
                          //   color: Colors.red[800],

                          // ),
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
                Navigator.of(context).pushNamed(
                    'gamestats', arguments: '');
              },
                    child: Text(
                    'Game stats',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  color: Colors.green,
                ),
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
                Navigator.of(context).pushNamed(
                    'GameRules', arguments: '');
              },
                    child: Text(
                    'Game Rules',
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
          ]
      ),
    );
  }}