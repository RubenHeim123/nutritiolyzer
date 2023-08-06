import 'package:flutter/material.dart';
import 'package:nutritiolyzer/globals.dart' as globals;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>{ 
  
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/logo.jpeg"
          ), 
          fit: BoxFit.cover
        )
      ),
      child: Container(
        alignment: const Alignment(0, 0.8),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          buttonPadding: const EdgeInsets.all(10),
          buttonMinWidth: screenWidth/2-30,   
          buttonHeight: 100,
            children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context, 
                  '/loginpage',
                );
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(screenWidth/2-30,35),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context, 
                  '/registerpage',
                );
              },
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(screenWidth/2-30,35),
              ),
            ),
          ]
        )     
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{ 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            'Login',
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
              labelText: 'Email adress',
              border: OutlineInputBorder(),
            ),
            controller: emailController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              if ((globals.passwordText[1].toString() != '') && (globals.exampleEmail != '') && (emailController.text == globals.passwordText[2].toString()) && (passwordController.text == globals.passwordText[1].toString())){
                globals.homeindex = 0;
                Navigator.pushNamed(
                  context, 
                  '/homepage',
                );
              } else if ((emailController.text != globals.passwordText[2].toString())){
                setState((){
                  passwordController.clear();
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Wrong email')
                    );
                  },
                );
              } else if ((passwordController.text != globals.passwordText[1].toString())){
                setState(() {
                  passwordController.clear();                  
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Wrong password')
                    );
                  },
                );
              } else{
                setState(() {
                  passwordController.clear();                  
                });
                showDialog(
                  context: context,
                  builder: (context) {
                      return const AlertDialog(
                      content: Text('Please register first')
                    );
                  },
                );
              }
            }, 
            child: const Text('Login'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth-30,50),               
            ),
          )
        ]
      ),
    );
  }
}