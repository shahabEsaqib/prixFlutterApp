// ignore_for_file: unused_field, must_call_super, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/ResetVal.dart';
import 'package:flutter/material.dart';

class Resetyourpassword2 extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  final String data;
  Resetyourpassword2 ({ Key key,
    @required this.data,

  }):super(key:key);
  _MyResetyourpassword2State createState() => _MyResetyourpassword2State();
}
class _MyResetyourpassword2State  extends State<Resetyourpassword2 > {

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  String _sucribestatus = 'Yes';
  ResetVal formsignup = new ResetVal();
  String _email;
  final auth = FirebaseAuth.instance;
  String myUsername='';
  initState() {function();
  print(myUsername);

  }
  Future<void> function()  async {myUsername= await HelperFunctions.getUserNameSharedPreference();
  }


  get w200 => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BackgroundImage1(),
        Scaffold(
          appBar: AppBar(title: Text("Reset password"),centerTitle: true,backgroundColor: Colors.white,foregroundColor: Colors.grey.shade600,elevation: 0,),
          backgroundColor: Colors.white,
          body: Form(
            key: _formKeyValue,
            child:

            SingleChildScrollView(
               child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        child: Center(
                          child: Image.asset(
                            'assets/images/logoNew.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 340,
                        child: Text(
                          'Reset your password',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600, fontFamily: 'Raleway'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,

                            color: Colors.yellow,

                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            width: 65,
                            height: 100,

                            alignment: Alignment.centerLeft,
                            child: Image(image: AssetImage(
                                'assets/images/will.png')),
                          ),
                          Container(
                            width: 120,
                            height: 100,


                            child: Container(
                              width: 1,
                              height: 1,

                              alignment: Alignment.bottomLeft,
                              child: RichText(
                                text: TextSpan(
                                  //text: 'Hello ',

                                  children:  <TextSpan>[
                                    TextSpan(text: myUsername.toString()
                                        ,
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade500,
                                            fontFamily: 'Raleway')),
                                    // // TextSpan(text: myUsername.toString(),
                                    // //   style: TextStyle(fontSize: 17,
                                    // //       fontWeight: FontWeight.w300,
                                    // //       color: Colors.grey
                                    // //       ,
                                    // //       fontFamily: 'Raleway'
                                    // // ),
                                    //      , ),
                                  ],
                                ),


                              ),),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(


                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Quote : Strong passwords include numbers, letters and punctuation marks.'
                                  ,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: 'Raleway')),
                              TextSpan(text: '  Strong, like you',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w300,
                                    color: Colors.green
                                    , fontFamily: 'Raleway'),),
                            ],
                          ),


                        ),

                      ),


                      SizedBox(
                        height: 35,
                      ),
                      

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 0),

                        child: Column(children: [ 
                          TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 1),
                                          ),
                                          labelStyle: TextStyle(
                                              color: Colors.green),
                                          hintStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                          // icon: Icon(Icons.mail),
                                          prefixIcon: Icon(Icons.mail,
                                              color: Colors.green
                                                  ),
                                          suffixIcon: emailController
                                                  .text.isEmpty
                                              ? Text('')
                                              : GestureDetector(
                                                  onTap: () {
                                                    emailController.clear();
                                                  },
                                                  child: Icon(Icons.close,color: Colors.green,)),
                                          hintText: 'example@mail.com',
                                          labelText: 'Enter your email',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 1),
                                          )),


                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            // Check if the entered email has the right format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.next,



    onChanged: (value) {
    setState(() {
    _email = value.trim();
    });}),





                        ]
                        ),
                      ),
 
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 55,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 100),
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          _formSubmit();
                                        },
                                        child: Text(
                                          'Reset',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ),

                    ],
                  ),
                ),
             ),
            ),
          ),
      ],
    );
  }

  void _formSubmit() {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      print('form is saved');
      auth.sendPasswordResetEmail(email: _email);
      showDialog(context: context, builder: (context){
        return AlertDialog(
        title:Text('Phone Alert'),
        content: Text('a reset email was sent to your account'),
        actions: [FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          onPressed: (){Navigator.of(context).pushNamed(
            'LoginPage', arguments: '');}, child: Text('Continue'
            ,
            ))],);
      });
    }
  }
}