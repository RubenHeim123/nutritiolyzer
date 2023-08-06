import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class changeIngredients extends StatefulWidget{
  const changeIngredients({Key? key}) : super(key: key);

  @override
  _changeIngredients createState() => _changeIngredients();
}

class _changeIngredients extends State<changeIngredients> {

  @override
  Widget build(BuildContext context) {
    
    final double screenWidth = MediaQuery.of(context).size.width; 
    final children = <Widget>[];

    for (var i = 0; i < globals.name.length; i++) {
      children.add(
        Card(
          child: CheckboxListTile(
            title: Text(globals.name[i]),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            controlAffinity: ListTileControlAffinity.trailing,
            value: globals.checked[i],
            onChanged: (bool? value){
              setState(() {
                globals.checked[i] = value!;
              });
            },
          ),
        )
      );
    }

    children.add(const SizedBox(height: 10));

    children.add(
      ElevatedButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
                return const AlertDialog(
                content: Text('Ingredients saved')
              );
            },
          );
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamed(
              context,
              '/homepage',
            ).then((value){
              setState(() {
                globals.homeindex = 4;
              });
            });   
          });
          setState(() {});
        }, 
        child: const Text('Save'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(screenWidth/2-30,50),
        ),
      )
    );
    
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: children,
      ),
    );
  }
}