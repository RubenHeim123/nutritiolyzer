import 'package:flutter/material.dart';
import 'package:nutritiolyzer/changePassword.dart';
import 'package:nutritiolyzer/changeAccountData.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/ingredients.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  State<accountPage> createState() => _MyAccountPage();
}

class _MyAccountPage extends State<accountPage>{  

  String getBirthday(){
    if (globals.exampleDate == null){
      return 'Select Birthday';
    } else {
      return '${globals.exampleDate.day}.${globals.exampleDate.month}.${globals.exampleDate.year}';
    }
  }

  @override
  Widget build(BuildContext context){
    
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
         const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Personel information',
            style: TextStyle(
              fontSize: 35,
            ),
          )
        ),
        Row(
          children: [
            Container(
              height: (screenWidth-60),
              width: (screenWidth-60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((screenWidth-40)/2),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/Elon_Musk_Royal_Society.jpg",
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ]
        ),
        Card(
          child: ListTile(
            title: const Text('Username'),
            trailing: Text(globals.exampleUsername),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changeUsername()
                )
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Email'),
            trailing: Text(globals.exampleEmail),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changeEmail()
                )
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Birthday'),
            trailing: Text(getBirthday()),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: () => pickDate(context),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Gender'),
            trailing: Text(globals.exampleGender),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changeGender()
                )
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Phone'),
            trailing: Text(globals.examplePhoneNumber),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changePhoneNumber()
                )
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Password'),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changePassword()
                )
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Ingredients'),
            shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const changeIngredients()
                )
              );
            },
          ),
        ),
      ],
    );
  }
  Future pickDate(BuildContext context) async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: globals.exampleDate ?? initialDate, 
      firstDate: DateTime(DateTime.now().year - 150), 
      lastDate: DateTime.now(),
    ); 

    if (newDate == null)return;     

    setState(() => globals.exampleDate = newDate);
  }
}