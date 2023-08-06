import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class changePassword extends StatefulWidget{
  const changePassword({Key? key}) : super(key: key);

  @override
  _changePassword createState() => _changePassword();
}

class _changePassword extends State<changePassword> {

  @override
  Widget build(BuildContext context) {
  
  final double screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20), 
            child: ElevatedButton(
              onPressed: (){
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
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
        children: [
          Card(
            child: ListTile(
              title: Text(globals.passwordText[globals.passwordindex]),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              trailing: IconButton(
                icon: const Icon(Icons.remove_red_eye_sharp),
                onPressed: (){
                  setState(() {
                    globals.passwordindex++;
                    globals.passwordindex = globals.passwordindex%2;
                  });
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Change Password'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: (){
                Navigator.pushNamed(
                  context, 
                  '/changepassword2',
                );
              },
            ),
          ),
        ]
      )
    );
  }
}

class changePassword2 extends StatefulWidget{
  const changePassword2({Key? key}) : super(key: key);

  @override
  _changePassword2 createState() => _changePassword2();
}

class _changePassword2 extends State<changePassword2> {

  final myControllerNewPassword = TextEditingController();
  final myControllerConfirmPassword = TextEditingController();

  @override
  void dispose(){
    myControllerNewPassword.dispose();
    myControllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

  final double screenWidth = MediaQuery.of(context).size.width;

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
        children: [
          const FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              'New Password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              height:50,
              alignment: Alignment.centerLeft,
              width: (screenWidth-40),
              child: TextFormField(
                controller: myControllerNewPassword,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              'Confirm New Password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              height:50,
              alignment: Alignment.centerLeft,
              width: (screenWidth-40),
              child: TextFormField(
                controller: myControllerConfirmPassword,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              if(myControllerNewPassword.text == myControllerConfirmPassword.text && (myControllerNewPassword.text != '')){
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Password saved')
                    );
                  },
                );
                setState(() {
                  globals.setPassword = myControllerNewPassword.text;
                });
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
              } else{
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Invalid Password')
                    );
                  },
                );
              }
            }, 
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth/2-30,50),
            ),
          ),
        ]
      )
    );
  }
}