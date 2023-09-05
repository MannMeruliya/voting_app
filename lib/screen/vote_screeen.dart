import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practical_2/main.dart';

class VotingScreen extends StatefulWidget {
  @override
  _VotingScreenState createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  final CollectionReference votes = FirebaseFirestore.instance.collection('votes');
  bool hasVoted = false;

  void addVote(String option) async {
    if (!hasVoted) {
      await votes.add({'option': option, 'userId': FirebaseAuth.instance.currentUser!.uid,'email':FirebaseAuth.instance.currentUser!.email});
      setState(() {
        hasVoted = true;
      });
    } else {
      print('You have already voted.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting App'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => homescreen()),
              );
            },
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vote for your favorite Party:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () => addVote('BJP'),
                child: Text('Vote for BJP'),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () => addVote('congress'),
                child: Text('Vote for congress'),
              ),
              SizedBox(height: 20,),
              hasVoted
                  ? Text('You have already voted.',style: TextStyle(fontSize: 18),)
                  : Text('You have not voted yet.',style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
