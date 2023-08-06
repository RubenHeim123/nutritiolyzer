import 'package:flutter/material.dart';
import 'package:nutritiolyzer/account.dart';
import 'package:nutritiolyzer/results.dart';
import 'package:nutritiolyzer/search.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/add.dart';
import 'package:nutritiolyzer/start.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _MyHomePage();
}


class _MyHomePage extends State<homePage>{
  List<Widget> body = <Widget>[
    const startPage(),
    const searchPage(),
    const addPage(),
    const resultPage(),
    const accountPage(),
  ];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20), 
            child: ElevatedButton(
              onPressed: (){
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/')
                  );
              }, 
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            )
          )
        ],
      ),
      body: Center(
        child: body[globals.homeindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green,
        unselectedItemColor: Colors.black,
        currentIndex: globals.homeindex,
        onTap: (int newIndex){
          setState(() {
            globals.homeindex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              Icons.search
            ),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Results',
            icon: Icon(
              Icons.analytics
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(
              Icons.person
            ),
          ),
        ],
      ),
    );
  }
}