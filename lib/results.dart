import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class resultPage extends StatefulWidget {
  const resultPage({Key? key}) : super(key: key);

  @override
  State<resultPage> createState() => _resultPage();
}

class _resultPage extends State<resultPage>{

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        const ListTile(
          title: Text(
            'Your most likely ingredients',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        ListTile(
          title: Text('1. ${globals.bestIngredients[0]}'),
        ),
        ListTile(
          title: Text('2. ${globals.bestIngredients[1]}'),
        ),
        ListTile(
          title: Text('3. ${globals.bestIngredients[2]}'),
        ),
        ListTile(
          title: Text('4. ${globals.bestIngredients[3]}'),
        ),
        ListTile(
          title: Text('5. ${globals.bestIngredients[4]}'),
        ),
      ],
    );
  }
}