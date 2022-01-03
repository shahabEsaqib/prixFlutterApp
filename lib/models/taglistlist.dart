import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {

    final taglist = Provider.of<QuerySnapshot>(context);

    //print(brews.documents);
    for (var doc in taglist.docs) {
      print(doc.data());
    }

    return Container(

    );
  }
}