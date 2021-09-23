import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Client with ChangeNotifier{

  var fName;
  var lName;
  var phNum;
  var idNum;
  var howMetCo;
  var addr;
  var area;
  var relate;


  Future<void> sendClientInfo(fName, lName, phNum, idNum, howMetCo, addr, area, relate) async{

    final url = 'http://192.168.1.55:5555/Test/main.aspx#252904263';


    try{
      var response = http.post(Uri.parse(url), body: json.encode({

        'new_name': fName,
        'new_lastname': lName,
        // '': phNum

      }));
    }
    on HttpException catch(err){

      print(err.message);
    }



  }

}