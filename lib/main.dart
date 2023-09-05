import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practical_2/screen/loginscreen.dart';
import 'package:practical_2/screen/signupscreen.dart';
import 'package:practical_2/screen/vote_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: FirebaseAuth.instance.currentUser == null ? homescreen() : VotingScreen(),
    );
  }
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
