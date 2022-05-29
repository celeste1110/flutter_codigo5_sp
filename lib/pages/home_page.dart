import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/profile_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _adressController = TextEditingController();
  bool darkMode = false;
  int genderMode=1;
  SPGlobal mandarina= SPGlobal();
  @override
  initState() {
    super.initState();
    getData();
    _getDataFull();
  }

  getData() async {
//   getDataInternet().then((value){
//     print(value);
//   });

    name = await getName();
    setState(() {});
  }

  Future<String> getName() async {
    return "Manolo Robles";
  }

  Future<List<String>> getProducts() async {
    return Future.delayed(Duration(seconds: 3), () {
      return ["Corbatas", "Camisas", "Polos", "Sacos"];
    });
  }

  _saveData()  {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("fullName", _fullNameController.text);
    // prefs.setString('address', _adressController.text);
    // prefs.setBool('darkMode', darkMode);
    // prefs.setInt('gender', genderMode);
    mandarina.fullName=_fullNameController.text;
    mandarina.address=_adressController.text;
    mandarina.darkMode=darkMode;
    mandarina.gender=genderMode;
  }

  _getDataFull()  {

    _fullNameController.text = mandarina.fullName;
    _adressController.text = mandarina.address;
    darkMode=mandarina.darkMode;
    genderMode=mandarina.gender;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/3208282/pexels-photo-3208282.jpeg?auto=compress&cs=tinysrgb&h=650&w=940'),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&h=650&w=940'),
                    ),
                    Text(
                      'Laura Fernandez',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Administradora',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
              leading: Icon(
                Icons.person,
              ),
              title: Text('My Profile'),
            ),
            ListTile(
              leading: Icon(
                Icons.copy,
              ),
              title: Text('Portafolio'),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text('Change Password'),
            ),
            Divider(
              thickness: 0.6,
              indent: 12,
              endIndent: 12,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff424242),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _adressController,
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: darkMode,
                onChanged: (bool value) {
                  darkMode = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Gender',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              RadioListTile(
                title: Text('Male'),
                value: 1,
                groupValue: genderMode,
                onChanged: (int? value) {
                  genderMode=value!;
                  setState(() {

                  });
                },
              ),

              RadioListTile(
                title: Text('Female'),
                value: 2,
                groupValue: genderMode,
                onChanged: (int?  value) {
                  genderMode=value!;
                  setState(() {

                  });

                },
              ),


              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    _saveData();
                  },
                  label: const Text('Save data'),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: getProducts(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       // return Center(
      //       //   child: Text(snapshot.data),
      //       // );
      //       // return ListView(
      //       //
      //       //   children: [
      //       //     ...snapshot.data.map((e)=>Text(e)),
      //       //   ],
      //       // );
      //       return ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //
      //           });
      //         },
      //         child: Text(
      //           'click',
      //         ),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
