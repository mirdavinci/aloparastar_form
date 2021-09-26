import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Authentication with ChangeNotifier{

  Future<void> signUp( fName , lName , idNum , password , mobileNum , telNum) async{
    const url = 'http://91.98.11.166:4321/api/new_vorudiMoshtarekBase/create';
    try{
      var response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=utf-8",
      },body: json.encode({
        "new_name": fName,
        "new_lastname":lName,
        "new_melicode":idNum,
        "new_password":password,
        "new_mobilephone":mobileNum,
        "new_homephone":telNum

      }));
      print(response.body);
      print(response.statusCode);

    }
    on HttpException catch(err){
      print(err.message);
    }

    notifyListeners();

  }



}