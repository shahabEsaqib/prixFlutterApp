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
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 153, 0, 0),



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
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 75),
                            shape: StadiumBorder(),
                            onPressed: () async {
                              Navigator.of(context).pushNamed(
                                  'gamestats', arguments: '');



                            },
                            child: Text('Game Stats', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.red[800],

                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),
                          Center(
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 70),

                              shape: StadiumBorder(),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    'GameRules',arguments: '');

                              },
                              child: Text('Game Rules', style: TextStyle(color: Colors
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
          ]
      ),
    );
  }}