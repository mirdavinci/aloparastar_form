import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  // const CustomDropDownMenu({Key key}) : super(key: key);

  CustomDropDownMenu(this.dropdownValue, this.spinnerItems);

  String dropdownValue = 'One';
  List<String> spinnerItems = ['One', 'Two', 'Three'];

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
          padding: EdgeInsets.all(10),

          child: Column(children: <Widget>[
              DropdownButton<String>(
                value: widget.dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                onChanged: (String data) {
                  setState(() {
                    widget.dropdownValue = data;
                  });
                },
                items: widget.spinnerItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text('Selected Item = ' + '${widget.dropdownValue}',
                  style: TextStyle(fontSize: 22, color: Colors.black)),
            ]),
        ),
      );
  }
}
