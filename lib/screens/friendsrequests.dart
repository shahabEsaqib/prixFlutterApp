// ignore_for_file: unused_field, must_call_super, unused_local_variable, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';



class Friendsrequests extends StatefulWidget {
  @override
  _FriendsrequestsState createState() => _FriendsrequestsState();

}

class _FriendsrequestsState extends State<Friendsrequests> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var requestsoffriends = [];
  int i=0;
  int k=0;
  int length=0;
  String myUsername='';
  String usernamefound  = '';
  String emailfound ='';
  var myfriends= [];
  var hisfriends= [];
  String pushname ='';
  bool testgame;





  bool condition =false;

  @override


  initState() {
    listMaking();
  }


  Future<void>listMaking() async {
    testgame=await HelperFunctions.getgameSharedPreference();

    condition = true;

    setState(() {
      isLoading = false;
    });
    myUsername = await HelperFunctions.getUserNameSharedPreference();

    await _firestore
        .collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          userMap = value.docs[0].data();
          requestsoffriends = userMap["friends_request"];
          myfriends = userMap["friends"];

        }
      });
    });

    isLoading = false;
    length = requestsoffriends.length;

    }


    @override
    Widget build(BuildContext context) {
      final size = MediaQuery
          .of(context)
          .size;


      return Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 153, 0, 0),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                if(testgame==true){Navigator.of(context).pushNamed(
                    'Olduser', arguments: '');}
                else{
                  Navigator.of(context).pushNamed(
                      'Newuser', arguments: '');}}),


          title: Text("Friends Requests"),

        ),
        body:ListView.builder(
            itemCount: requestsoffriends.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 169, 73, 73),
                    onTap: () async {
                      print("°°°°°°°°°°°°°°°");
                      myfriends.add(requestsoffriends[index]);
                      await FirebaseFirestore.instance.collection("users")
                          .doc(myUsername).update({
                        "friends": myfriends,
                      }).catchError((e) {
                        print(e.toString());
                      });
                      print("aaaaaaaaaaaaaaa");

                      await _firestore
                          .collection('users')
                          .where(
                          "userName", isEqualTo: requestsoffriends[index])
                          .get()
                          .then((value) {

                          if (value != null) {
                            userMap = value.docs[0].data();
                            hisfriends = userMap["friends"];
                            hisfriends.add(myUsername);
                          }
                        //}
                       // );
                      },);
                      print("bbbbbbbbbbb");


                      await FirebaseFirestore.instance.collection("users")
                          .doc(requestsoffriends[index]).update({
                        "friends": hisfriends,
                      }).catchError((e) {
                        print(e.toString());
                      });
                      print("cccccccccccc");
                      pushname=requestsoffriends[index];

                      requestsoffriends.removeAt(0);
                      await FirebaseFirestore.instance.collection("users")
                          .doc(myUsername).update({
                        "friends_request": requestsoffriends,
                      }).catchError((e) {
                        print(e.toString());
                      });
                      print("ddddddddddddd");
                      showDialog(context: context, builder: (context){

                        return AlertDialog(title:Text('Phone Alert'),content: Text('you are now friend with '+pushname),actions: [FlatButton(onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Friendsrequests()),);}, child: Text('Continue'))],);
                      });




                    },
                    title: Text(""+requestsoffriends[index]+"               accept request",style: TextStyle(color:Colors.white,),textAlign: TextAlign.center,),



                  ),

                ),
              );
            }
        ),
      );
    }
}



