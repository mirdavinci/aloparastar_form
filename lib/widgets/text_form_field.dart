import 'package:flutter/material.dart';

Widget customTextFormField(TextEditingController inputController, String hint ,){

  return Container(
    height: 70,
    width: 250,
    margin: EdgeInsets.only(left: 100),
    child: TextFormField(
      // controller: ,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value.isEmpty) {
          return 'لطفا تمام فیلد ها را کامل کنید ';
        }
      },
      onSaved: (value) {
       },
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
        hintText:  hint
      ),
    ),
  );

}