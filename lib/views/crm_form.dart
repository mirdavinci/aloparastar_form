import 'package:crm_alo_parastar/providers/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CrmForm extends StatefulWidget {
  const CrmForm({Key key}) : super(key: key);

  @override
  _CrmFormState createState() => _CrmFormState();
}

final form = GlobalKey<FormState>();

void saveForm(BuildContext context) {
  final isValid = form.currentState.validate();
  if (!isValid) {
    return;
  } else {
    form.currentState.save();
    FocusScope.of(context).unfocus();
  }
}

var textController = TextEditingController();

class _CrmFormState extends State<CrmForm> {
  @override
  Widget build(BuildContext context) {
    var sendReq = Provider.of<ClientForm>(context);
    var clForm = ClientForm();

    var _firstName;
    var _lastName;
    var _phoneNumber;
    var _idNumber = '';
    var _howMetCompany = '';
    var _address = '';
    var _area = '';
    var _relation = '';
    var fNameCont = TextEditingController();
    var lNameCont = TextEditingController();
    var phNum = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color(0xff3E2B96)),
        backgroundColor: Colors.white,
        title: const Text(
          'فرم ثبت نام',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    margin: EdgeInsets.only(left: 75),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا همه ی فیلد ها را کامل کنید ';
                        }
                      },
                      onSaved: (value) {
                        fNameCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        hintText: 'نام',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    margin: EdgeInsets.only(left: 75),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا همه ی فیلد ها را کامل کنید ';
                        }
                      },
                      onSaved: (value) {
                        lNameCont.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        hintText: 'نام خانوادگی',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    margin: EdgeInsets.only(left: 75),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'لطفا همه ی فیلد ها را کامل کنید ';
                        }
                      },
                      onSaved: (value) {
                        phNum.text = value;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffA8C0FE))),
                        hintText: 'شماره ی همراه',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // customizedTextForm(_idNumber, 'کد ملی', TextInputType.number,
                  //     TextInputAction.next, context),
                  SizedBox(
                    height: 50,
                  ),
                  // customizedTextForm(_howMetCompany, 'نحوه آشنایی',
                  //     TextInputType.text, TextInputAction.next, context),
                  SizedBox(
                    height: 50,
                  ),
                  // customizedTextForm(_area, 'محدوده منزل', TextInputType.text,
                  //     TextInputAction.newline, context),
                  SizedBox(
                    height: 50,
                  ),
                  // customizedTextForm(_address, 'آدرس', TextInputType.text,
                  //     TextInputAction.newline, context),
                  SizedBox(
                    height: 50,
                  ),
                  // customizedTextForm(_relation, 'نسبت با خدمت گیرنده',
                  //     TextInputType.text, TextInputAction.done, context),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 75),
                    child: ElevatedButton(
                      onPressed: () {
                         sendReq.sendClientInfo(fNameCont.text, lNameCont.text, phNum.text );

                        saveForm(context);

                          clForm.sendClientInfo(fNameCont.text, lNameCont.text, phNum.text );
                      },
                      child: Text('ثبت فرم'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customizedTextForm(
    TextEditingController textEditingController,
    var hintInput,
    TextInputType inputType,
    TextInputAction inputAction,
    context) {
  ///onChange => kare hamoon controller ro mikone.
  ///controller => karesh ine k otomaat migire user input ro va niaz b onChange nis

  return Container(
    height: 50,
    width: 250,
    margin: EdgeInsets.only(left: 75),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'لطفا همه ی فیلد ها را کامل کنید ';
        }
      },
      onSaved: (value) {
        textEditingController.text = value;
      },
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xffA8C0FE))),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xffA8C0FE))),
        hintText: hintInput,
      ),
    ),
  );
}
