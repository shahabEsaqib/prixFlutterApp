import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
class Check{



  void sendOTP(String _email) async{
    EmailAuth.sessionName = "emailverification";
    // ignore: unused_local_variable
    var res = await EmailAuth.sendOtp(receiverMail: _email);
  }
  bool verifyOTP(String _email,TextEditingController _otpController) {
    var res = EmailAuth.validate(receiverMail: _email, userOTP: _otpController.value.text);
    return res;
  }  }