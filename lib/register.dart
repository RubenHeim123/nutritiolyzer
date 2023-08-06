import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{ 

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'User name',
              border: OutlineInputBorder(),
            ),
            controller: usernameController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(),
            ),
            controller: emailController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'Enter Password',
              border: OutlineInputBorder(),
            ),
            controller: passwordController,
          ),            
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
            controller: confirmController,
          ),            
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              if(usernameController.text == ''){
                setState(() {
                  passwordController.clear();  
                  confirmController.clear();                
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Please enter username')
                    );
                  },
                );
              } else if((emailController.text == '')){
                                setState(() {
                  passwordController.clear();  
                  confirmController.clear();                
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Please enter email')
                    );
                  },
                );
              } else if((passwordController.text == '')){
                                setState(() {
                  passwordController.clear();  
                  confirmController.clear();                
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Please enter password')
                    );
                  },
                );
              } else if((confirmController.text == '')){
                setState(() {
                  passwordController.clear();  
                  confirmController.clear();                
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Please confirm your password')
                    );
                  },
                );
              } else if (confirmController.text != passwordController.text) {
                setState(() {
                  passwordController.clear();  
                  confirmController.clear();                
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Is your password correct confirmed?')
                    );
                  },
                );
              } else if(confirmController.text == passwordController.text){
                Navigator.pop(context);
                setState(() {
                  globals.exampleUsername = usernameController.text;
                  globals.exampleEmail = emailController.text;
                  globals.setPassword = confirmController.text;
                  print(globals.exampleEmail);
                }); 
              }
            }, 
            child: const Text('Register'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth-30,50),               
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'By signing up, you agree to Nutritiolyzer´s Term of Service and Privacy Policy.',
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ]
      ),
    );
  }
}