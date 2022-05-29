import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PruebaProfile extends StatefulWidget {
  const PruebaProfile({Key? key}) : super(key: key);

  @override
  State<PruebaProfile> createState() => _PruebaProfileState();
}

class _PruebaProfileState extends State<PruebaProfile> {
  String fullname = '';

  String address = '';

  bool darkMode = false;

  int gender = 1;
  @override
  initState() {
    super.initState();

    _getDataFull();
  }

  _getDataFull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullname = prefs.getString("fullName") ?? '';
    address = prefs.getString('address') ?? '';
    darkMode = prefs.getBool('darkMode') ?? false;
    gender = prefs.getInt('gender') ?? 1;
    setState(() {});
  }
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
      body: FutureBuilder(
        future: getDataTest(),
        builder: (BuildContext context,AsyncSnapshot snap){
          if(snap.hasData){
            return Center(child: Text(snap.data));
          }
          return Center(
            child: Text('Cargando'),
          );
        },
      ),

    );
  }
}
