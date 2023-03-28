import 'package:fin_infocom/widgets/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('My App'),
            decoration: BoxDecoration(
              color: Color(0xff990d35),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Get.to(ProfileScreen());
              // Navigator.pop(context);
            },
          ),
          // ListTile(
          //   title: Text('Settings'),
          //   onTap: () {
          //     // Update the state of the app
          //     // ...
          //     // Then close the drawer
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
