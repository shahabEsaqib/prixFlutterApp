
// ignore_for_file: unused_field, unused_local_variable, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String usernamefound  = '';
  String emailfound ='';
  bool _visible1 = false;
  bool _visible2 = false;
  var requestsoffriends =[];
  int i =0;
  String username='';
  bool testgame;
  bool condition =false;

  @override


  // ignore: override_on_non_overriding_member
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    condition = true;
    testgame=await HelperFunctions.getgameSharedPreference();
    username = await HelperFunctions.getUserNameSharedPreference();



    await _firestore
        .collection('users')
        .where("userName", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        if(value!=null){
        userMap = value.docs[0].data();
        usernamefound = userMap['userName'];
        if(usernamefound==username || usernamefound.length<3){usernamefound='';}
        emailfound = userMap['userEmail'];
        requestsoffriends  = userMap["friends_request"];}
        else{
          isLoading = false;}
      });
      isLoading = false;
      requestsoffriends.add(username);
      if(condition==true && usernamefound!=''){

        _visible1=true;
        _visible2=false;

      }
      if(condition==true && usernamefound=='' ){

        _visible2=true;
        _visible1=false;
      }




    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade600,
        elevation: 0,


        title: Text("Search"),

      ),
      body:
      isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(style: TextStyle(color: Colors.black),
                controller: _search,
                decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              ),
                                              focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(40),
          ),
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15),
                                              // icon: Icon(Icons.mail),
                                              prefixIcon: Icon(Icons.search,
                                                  color: Colors.green
                                                      ),
                                              suffixIcon: _search
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        _search.clear();
                                                      },
                                                      child: Icon(Icons.close,color: Colors.green,)),
                                              hintText: 'Friend Name',
                                              labelText: 'Search',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              )),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 60,
                                          ),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: StadiumBorder(),
            ),
              onPressed: onSearch,
              child: Text("Search",style: TextStyle(color: Colors.white),),
              


            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),

          Visibility(

              visible:_visible1,
              child: Container(
                margin: const EdgeInsets.all(2.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                alignment: Alignment.centerLeft,
                color: Colors.green,
                width: 550,
                height: 70,
                child : Center(
                  child: Row(children: [
                  Text("                 "+usernamefound.toString(),style: TextStyle(color: Colors.white,fontSize: 17)),
                    Container(
                      width: 70,
                      height: 10,
                    ),
                    ElevatedButton(//height: 5,
                      //padding: EdgeInsets.symmetric(
                          //vertical: 10, horizontal: 10),


                      //shape: StadiumBorder(),
                      onPressed: () async {
                        String username = await HelperFunctions.getUserNameSharedPreference();
                        await FirebaseFirestore.instance.collection("users")
                          .doc(usernamefound.toString()).update({
                        "friends_request": requestsoffriends,
                      }).catchError((e){
                        print(e.toString());
                      });
                        showDialog(context: context, builder: (context){

                          return AlertDialog(title:Text('Phone Alert'),content: Text('friend request successfully sent'),actions: [FlatButton(onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),);}, child: Text('Continue'))],);
                        });




                      },
                      child: Text('Send request', style: TextStyle(color: Colors
                          .black, fontSize: 17, fontWeight: FontWeight.w700
                        ,),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,),

                    ),
                  ],),
                )

                ),

              ),



          Visibility(
            visible:_visible2,
            child: Container(
              width: 500,
              height: 70,
              child: Text("user dont exist",style: TextStyle(color: Colors.red),textAlign: TextAlign.center),
            ),


          )


          ]
      ),
    );
  }



  }

