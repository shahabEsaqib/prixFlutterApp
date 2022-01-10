// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/taglistlist.dart';
import 'package:flutter_loginpage/services/database.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class taglist extends StatelessWidget {
  final String data;
  taglist({
    Key key,
    @required this.data,
  }) : super(key: key);

  get w200 => null;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
    value: DatabaseService().taglist,
    // initialData: null,
    initialData: null,
    child:Stack(
      children: [
        // BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TagList(),

                ],
              ),
            ),
          ),

        ),

      ],

    ),

    );
  }
}