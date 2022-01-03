import 'package:cloud_firestore/cloud_firestore.dart';

class CreatingRoom{
  Future<void> createRoom(roomname) async {
    FirebaseFirestore.instance.collection("rooms").add(roomname).catchError((e) {
      print(e.toString());
    });
  }
}
