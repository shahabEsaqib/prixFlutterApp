// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class FriendsInUserList extends StatelessWidget {
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
                body: Form(


                    child: SafeArea(
                      child: Column(
                          children: [
                            SizedBox(
                              height: 240
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
                                  'friends', arguments: '');



                              },
                                        child: Text(
                                          'Your friends',
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
                                       onPressed: () async {Navigator.of(context).pushNamed(
                                  'HomeScreen', arguments: '');



                              },
                                        child: Text(
                                          'Send a friend request',
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
                                       onPressed: () async {Navigator.of(context).pushNamed(
                                  'friendsrequests', arguments: '');



                              },
                                        child: Text(
                                          'friends request received',
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
                              height: 300
                              ,),



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