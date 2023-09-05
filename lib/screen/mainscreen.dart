import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Voting App"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                height: 150,
                width: 180,
                color: Colors.grey,
                child: Text(
                  "Black",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                height: 150,
                width: 170,
                color: Colors.grey,
                child: Text(
                  "Green",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Text(
                    "Vote for Black Party",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text("Vote for Green Party"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
