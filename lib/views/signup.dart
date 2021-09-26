import 'package:crm_alo_parastar/providers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

final regForm = GlobalKey<FormState>();

void saveForm(BuildContext context) {
  final isValid = regForm.currentState.validate();
  if (!isValid) {
    return;
  } else {
    regForm.currentState.save();
    FocusScope.of(context).unfocus();
  }
}

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade400,
        centerTitle: true,
        title: Text('ثبت نام'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: regForm,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'لطفا نام خود را وارد کنید ';
                      }
                    },
                    onSaved: (value) {
                      // fNameCont.text = value;
                    },
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintText: 'نام',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'لطفا نام خانوادگی خود را وارد کنید ';
                      }
                    },
                    onSaved: (value) {},
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintText: 'نام خانوادگی',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'لطفا کد ملی خود را وارد کنید ';
                      }
                    },
                    onSaved: (value) {},
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintText: 'کد ملی',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.toString().length < 6) {
                        return 'لطفا یک کلمه ی عبور قوی انتخاب نمایید ';
                      }
                    },
                    onSaved: (value) {},
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintText: 'رمز عبور',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'لطفا شماره ی همراه خود را وارد کنید ';
                      }
                    },
                    onSaved: (value) {},
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      hintText: 'تلفن همراه',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(left: 100),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'لطفا شماره ی ثابت خود را وارد کنید ';
                      }
                    },
                    onSaved: (value) {},
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent)),
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
                        primary: Colors.pinkAccent.shade400.withOpacity(0.6),
                        shadowColor: Colors.grey),
                    onPressed: () {
                      saveForm(context);
                      signupController.signUp(
                          fNameCont.text,
                          lNameCont.text,
                          idNumCont.text,
                          passCont.text,
                          mobileCont.text,
                          telCont.text);
                    },
                    child: Text('ارسال فرم'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
