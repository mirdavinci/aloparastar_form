import 'package:crm_alo_parastar/providers/authentication.dart';
import 'package:crm_alo_parastar/views/crm_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

final regForm = GlobalKey<FormState>();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    var fNameCont = TextEditingController();
    var lNameCont = TextEditingController();
    var idNumCont = TextEditingController();
    var passCont = TextEditingController();
    var mobileCont = TextEditingController();
    var telCont = TextEditingController();
    var signupController = Provider.of<Authentication>(context);

    void saveForm(BuildContext context) {
      final isValid = regForm.currentState.validate();
      if (!isValid) {
        return;
      } else {
        regForm.currentState.save();
        signupController.signUp(context, fNameCont.text, lNameCont.text,
            idNumCont.text, passCont.text, mobileCont.text, telCont.text);
        FocusScope.of(context).unfocus();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
        centerTitle: true,
        title: Text('ثبت نام'),
      ),
      body:   SingleChildScrollView(
          child: Form(
            key: regForm,
               child: Column(
                mainAxisSize: MainAxisSize.max,
                 children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: fNameCont,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا نام خود را وارد کنید ';
                        }
                      },
                      onSaved: (value) {
                        fNameCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'نام',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: lNameCont,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا نام خانوادگی خود را وارد کنید ';
                        }
                      },
                      onSaved: (value) {
                        lNameCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'نام خانوادگی',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: idNumCont,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا کد ملی خود را وارد کنید ';
                        }
                      },
                      onSaved: (value) {
                        idNumCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'کد ملی',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: passCont,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty || value.toString().length < 6) {
                          return 'لطفا یک کلمه ی عبور قوی انتخاب نمایید ';
                        }
                      },
                      onSaved: (value) {
                        passCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'رمز عبور',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: mobileCont,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا شماره ی همراه خود را وارد کنید ';
                        }
                      },
                      onSaved: (value) {
                        mobileCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'تلفن همراه',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 250,
                    margin: EdgeInsets.only(left: 100),
                    child: TextFormField(
                      controller: telCont,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        saveForm(context);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا شماره ی ثابت خود را وارد کنید ';
                        }
                      },
                      onSaved: (value) {
                        telCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen.shade400,)),
                        hintText: 'تلفن ثابت',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.only(left: 200),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen.shade400,
                          shadowColor: Colors.white60),
                      onPressed: () {
                        saveForm(context);
                      },
                      child: Text('ارسال فرم'),
                    ),
                  ),
                ],
              ),
            ),
          ),
     );
  }
}
