// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';


class NewGame extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            // BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                         appBar: AppBar(title: Text("New Game"),centerTitle: true,backgroundColor: Colors.white,foregroundColor: Colors.grey.shade600,elevation: 0,),

                body: Form(

                  child:
                     SafeArea(
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 215
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
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'CreateGame', arguments:'');



                              },
                                        child: Text(
                                          'Create Room',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ),
                            SizedBox(
                              height: 10
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
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'NewGame2', arguments:'');



                              },
                                        child: Text(
                                          'Join Game',
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