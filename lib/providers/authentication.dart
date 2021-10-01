import 'dart:convert';
import 'dart:io';

import 'package:crm_alo_parastar/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {

  Future<void> signUp(BuildContext ctx,fName, lName, idNum, password, mobileNum, telNum) async {
    const url = 'http://91.98.11.166:4321/api/new_vorudiMoshtarekBase/create';
    try {
      var response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=utf-8",
      }, body: json.encode({
        "new_name": fName,
        "new_lastname": lName,
        "new_melicode": idNum,
        "new_password": password,
        "new_mobilephone": mobileNum,
        "new_homephone": telNum
      }));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: 'ثبت نام با موفقیت انجام شد',
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 20,
            backgroundColor: Colors.orange,textColor: Colors.black ,
        gravity: ToastGravity.CENTER);
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) => MainPage()));
      }
      else{
        Fluttertoast.showToast(msg: 'اتصال اینترنت خود را چک کنید',
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 20,
            backgroundColor: Colors.orange,textColor: Colors.black ,
            gravity: ToastGravity.CENTER);
      }
    }
    on HttpException catch (err) {
      print(err.message);
    }

    notifyListeners();
  }


}