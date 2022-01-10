// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class SetDate extends StatefulWidget {
  @override
  _SetDateState createState() => _SetDateState();

}

class _SetDateState extends State<SetDate> with WidgetsBindingObserver {

@override
Widget build(BuildContext context) {
  final size = MediaQuery
      .of(context)
      .size;
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
                actions: [


                ],

                title: Text("Set date"),

              ),
              body: Form(

                child:  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(
                            height: 150
                            ,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            shape: StadiumBorder(),
                            onPressed: () async {
                              HelperFunctions.savetimeSharedPreference('3');
                              Navigator.of(context).pushNamed(
                                  'invitefriends', arguments: '');



                            },
                            child: Text('3 days', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.green,

                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),

                          Center(
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                              shape: StadiumBorder(),
                              onPressed: () async {await HelperFunctions.savetimeSharedPreference('7');
                              Navigator.of(context).pushNamed(
                                  'invitefriends', arguments: '');



                              },
                              child: Text('7 days', style: TextStyle(color: Colors
                                  .white, fontSize: 25, fontWeight: FontWeight.w700
                                ,),),
                              color: Colors.green,

                            ),
                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 60),
                            shape: StadiumBorder(),
                            onPressed: () async {await HelperFunctions.savetimeSharedPreference('14');
                            Navigator.of(context).pushNamed(
                                'invitefriends', arguments: '');



                            },
                            child: Text('14 days', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.green,

                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 80),
                            shape: StadiumBorder(),
                            onPressed: () async {await HelperFunctions.savetimeSharedPreference('21');
                            Navigator.of(context).pushNamed(
                                'invitefriends', arguments: '');



                            },
                            child: Text('21 days', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.green,

                          ),
                          SizedBox(
                            height: 15
                            ,
                          ),
                         
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 100),
                            shape: StadiumBorder(),
                            onPressed: () async {await HelperFunctions.savetimeSharedPreference('30');
                            Navigator.of(context).pushNamed(
                                'invitefriends', arguments: '');



                            },
                            child: Text('30 days', style: TextStyle(color: Colors
                                .white, fontSize: 25, fontWeight: FontWeight.w700
                              ,),),
                            color: Colors.green,

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