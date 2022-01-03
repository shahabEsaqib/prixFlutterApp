// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class NewGame extends StatelessWidget {
  @override
  @override
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
                                  vertical: 10, horizontal: 97),
                              shape: StadiumBorder(),
                              onPressed: () async {
                                Navigator.of(context).pushNamed(
                                    'CreateGame', arguments: '');



                              },
                              child: Text('Create Room', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.red[800],

                            ),
                            SizedBox(
                              height: 30
                              ,
                            ),
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 110),

                                shape: StadiumBorder(),
                                onPressed: () async {Navigator.of(context).pushNamed(
                                    'NewGame2', arguments:'');



                                },
                                child: Text('Join Game', style: TextStyle(color: Colors
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