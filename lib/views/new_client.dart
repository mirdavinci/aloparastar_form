import 'package:crm_alo_parastar/views/crm_form.dart';
import 'package:crm_alo_parastar/widgets/drop_down_menu.dart';
import 'package:crm_alo_parastar/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
class NewClient extends StatefulWidget {
  const NewClient({Key key}) : super(key: key);

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {

  var nameController = TextEditingController();
  String dropdownValue = 'One';
  List<String> spinnerItems = ['One', 'Two', 'Three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Transform(
          transform: Matrix4.translationValues(250, 0, 0),
          child: Text('مشترک جدید')),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body:Container(
         child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: 15,),
                customTextFormField(nameController, 'نام'),
                SizedBox(height: 20,),
                customTextFormField(nameController, 'نام خانوادگی'),
                SizedBox(height: 20,), customTextFormField(nameController, 'تلفن همراه'),
                SizedBox(height: 20,), customTextFormField(nameController, 'تلفن ثابت'),
                SizedBox(height: 20,),
                customTextFormField(nameController, 'کد ملی'),
                SizedBox(height: 30,),
                customTextFormField(nameController, 'نحوه ی آشنایی'),
                SizedBox(height: 30,),
                customTextFormField(nameController, 'محدوده ی منزل'),
                SizedBox(height: 30,),
                customTextFormField(nameController, 'آدرس'),
                SizedBox(height: 30,),
                CustomDropDownMenu(dropdownValue, spinnerItems),

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
