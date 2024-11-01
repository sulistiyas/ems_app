import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 46, 46),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          padding: EdgeInsets.all(1),
          child: Image(
            image: AssetImage("assets/ems_trans.png"),
            fit: BoxFit.contain,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(LoginScreen());
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = TextButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.white,
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           // children: <Widget>[
  //           //   Image(
  //           //     image: AssetImage("assets/ems_trans.png"),
  //           //     width: 200,
  //           //     height: 200,
  //           //     fit: BoxFit.contain,
  //           //     repeat: ImageRepeat.noRepeat,
  //           //   ),
  //           //   Padding(
  //           //     padding: EdgeInsets.all(10),
  //           //     child: TextField(
  //           //       decoration: InputDecoration(
  //           //           border: OutlineInputBorder(),
  //           //           labelText: 'User Name',
  //           //           hintText: 'Enter valid mail id as abc@gmail.com'),
  //           //     ),
  //           //   ),
  //           //   Padding(
  //           //     padding: EdgeInsets.all(10),
  //           //     child: TextField(
  //           //       obscureText: true,
  //           //       decoration: InputDecoration(
  //           //           border: OutlineInputBorder(),
  //           //           labelText: 'Password',
  //           //           hintText: 'Enter your secure password'),
  //           //     ),
  //           //   ),
  //           //   SizedBox(
  //           //       width: 400,
  //           //       height: 400,
  //           //       child: Row(
  //           //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //         children: <Widget>[
  //           //           ElevatedButton(
  //           //             style: ElevatedButton.styleFrom(
  //           //               elevation: 3,
  //           //               shape: RoundedRectangleBorder(
  //           //                   borderRadius: BorderRadius.circular(32.0)),
  //           //               minimumSize: const Size(180, 40),
  //           //             ),
  //           //             onPressed: () {
  //           //               setState() {}
  //           //             },
  //           //             child: (Text("Sign In",
  //           //                 style: TextStyle(
  //           //                     fontWeight: FontWeight.w900, fontSize: 30))),
  //           //           ),
  //           //           ElevatedButton(
  //           //             style: ElevatedButton.styleFrom(
  //           //               elevation: 3,
  //           //               shape: RoundedRectangleBorder(
  //           //                   borderRadius: BorderRadius.circular(32.0)),
  //           //               minimumSize: const Size(180, 40),
  //           //             ),
  //           //             onPressed: () {
  //           //               setState() {}
  //           //             },
  //           //             child: (Text("Sign Up",
  //           //                 style: TextStyle(
  //           //                     fontWeight: FontWeight.w900, fontSize: 30))),
  //           //           ),
  //           //         ],
  //           //       ))
  //           // ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
