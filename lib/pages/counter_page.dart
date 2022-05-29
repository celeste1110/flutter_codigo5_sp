import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _cont=0;
  @override
  initState(){
    super.initState();
    _getNumber();
  }
  _saveData() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setInt("num", _cont);

  }
  _getNumber() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _cont=prefs.getInt("num") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _cont++;
          setState(() {
            _saveData();
            setState(() {

            });

          });

        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cont.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              'Presiona el boton para subir el contador!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
