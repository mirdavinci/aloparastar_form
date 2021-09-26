import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientForm with ChangeNotifier {
  // var fName;
  // var lName;
  // var phNum;
  var idNum;
  var howMetCo;
  var addr;
  var area;
  var relate;

  Future<void> sendClientInfo(String fName,String lName,String phNum) async {
    final url = 'http://91.98.11.166:4321/api/new_moshtarakBase/postmoshtarak';

       try {
        var response = await http.post(Uri.parse(url),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json; charset=utf-8",
            },
            body: json.encode({
              'new_name': fName,
              'new_familyname': lName,
              'new_mobile': phNum
              // 'meli_coade':'idNum'
            }));

        print('${response.statusCode}=> STATUS CODE');

        print('Do not have Response');
      }
      on HttpException catch (err) {
        print(err.message);
      }
     notifyListeners();

  }

}
