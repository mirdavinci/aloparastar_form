import 'package:crm_alo_parastar/helpers/tab_item.dart';
import 'package:crm_alo_parastar/views/signup.dart';
import 'package:flutter/material.dart';



 class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
     int selectedPosition;
     return Scaffold(
      bottomNavigationBar: BottomAppBar(

        color: Colors.lightGreen.shade400,
        shape: CircularNotchedRectangle(),
        // elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: TabItem(
                icon: Icons.home,
                isSelected: selectedPosition == 0,
                onTap: () {
                  setState(() {
                    selectedPosition = 0;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Signup()));
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TabItem(
                  icon: Icons.location_on,
                  isSelected: selectedPosition == 1,
                  onTap: () {
                    setState(() {
                      // print("tapped");
                      selectedPosition = 1;
                    });
                  }),
            ),
            SizedBox(
              width: 48,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TabItem(
                  icon: Icons.message,
                  isSelected: selectedPosition == 2,
                  onTap: () {
                    setState(() {
                      selectedPosition = 2;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(12),
               child: TabItem(
                  icon: Icons.search,
                  isSelected: selectedPosition == 3,
                  onTap: () {
                    setState(() {
                      selectedPosition = 3;
                     });
                  },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        // elevation: 3,
        onPressed: () {
          return;
        },
        child: Icon(
          Icons.home,
          color: Colors.green.shade800,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
