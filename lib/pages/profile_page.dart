import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/sp_global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullname = '';

  String address = '';

  bool darkMode = false;

  int gender = 1;
  SPGlobal mandarina= SPGlobal();
  @override
  initState() {
    super.initState();

    //_getDataFull();
  }

  // _getDataFull() {
  //
  //   fullname = mandarina.fullName;
  //   address = mandarina.address;
  //   darkMode=mandarina.darkMode;
  //   gender=mandarina.gender;
  //   setState(() {});
  // }
 Future<String> getDataTest() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fullName")??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gender==1?Colors.blue:Colors.pinkAccent,
        title: Text('Profile'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(mandarina.fullName),
                subtitle: Text('Full Name'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(address),
                subtitle: Text(mandarina.address),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text(mandarina.darkMode==false?'Off':'On',),
                subtitle: Text('Dark Mode'),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: Text(mandarina.gender==1?'Male':'Female',),
                subtitle: Text('Gender'),
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(child: Text('Name')),
      //     Center(child: Text(fullname)),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Center(child: Text('FullName')),
      //     Center(child: Text(address)),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Center(
      //       child: Text(
      //         darkMode==false?'Off':'On',
      //       ),
      //     ),
      //     Center(
      //       child: Text(
      //         address,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
