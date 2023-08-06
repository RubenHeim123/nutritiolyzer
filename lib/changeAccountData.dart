import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class changePhoneNumber extends StatefulWidget{
  const changePhoneNumber({Key? key}) : super(key: key);

  @override
  _changePhoneNumber createState() => _changePhoneNumber();
}

class _changePhoneNumber extends State<changePhoneNumber> {
  
  final myController = TextEditingController();

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
              'Change Phone number',
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
                controller: myController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'New Phone number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              setState(() {
                globals.examplePhoneNumber = myController.text;
              });
              showDialog(
                context: context,
                builder: (context) {
                    return const AlertDialog(
                    content: Text('Phone number saved')
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
            }, 
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth/2-30,50),
            ),
          )
        ],
      ),
    );
  }
}

class changeGender extends StatefulWidget{
  const changeGender({Key? key}) : super(key: key);

  @override
  _changeGender createState() => _changeGender();
}

class _changeGender extends State<changeGender> {
  
  final myController = TextEditingController();

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
              'Change Gender',
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
              child: DropdownButton<String>(
                value: globals.exampleGender,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    globals.exampleGender = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    child: Text('Male'),
                    value: 'Male',
                  ),
                  DropdownMenuItem(
                    child: Text('Female'),
                    value: 'Female',
                  )
                ],
              )
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                    return const AlertDialog(
                    content: Text('Gender saved')
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
        ],
      ),
    );
  }
}

class changeEmail extends StatefulWidget{
  const changeEmail({Key? key}) : super(key: key);

  @override
  _changeEmail createState() => _changeEmail();
}

class _changeEmail extends State<changeEmail> {
  
  final myEmailController = TextEditingController();

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
              'Change Email',
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
                controller: myEmailController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'New Email adress',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              setState(() {
                globals.exampleEmail = myEmailController.text;
              });
              showDialog(
                context: context,
                builder: (context) {
                    return const AlertDialog(
                    content: Text('Email saved')
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
            }, 
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth/2-30,50),
            ),
          )
        ],
      ),
    );
  }
}

class changeUsername extends StatefulWidget{
  const changeUsername({Key? key}) : super(key: key);

  @override
  _changeUsername createState() => _changeUsername();
}

class _changeUsername extends State<changeUsername> {
  
  final myUsernameController = TextEditingController();

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
              'Change Username',
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
                controller: myUsernameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'New Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              setState(() {
                globals.exampleUsername = myUsernameController.text;
              });
              showDialog(
                context: context,
                builder: (context) {
                    return const AlertDialog(
                    content: Text('Username saved')
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
            }, 
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth/2-30,50),
            ),
          )
        ],
      ),
    );
  }
}