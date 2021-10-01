import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  const TabItem({Key key, this.icon, this.isSelected, this.onTap , this.color})
      : super(key: key);


  final IconData icon;
  final bool isSelected;
  final Function onTap;
  final Color color ;

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tab(
              icon: Icon(widget.icon, color: Colors.lightGreen.shade900,),
            ),
          ],
        ),
      ),
    );
  }
}
