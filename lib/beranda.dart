import 'package:flutter/material.dart';
import 'package:iniyha/stopwatch.dart';

class beranda extends StatefulWidget {
  const beranda({super.key});

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
              },
              splashColor: Colors.orange,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                  Icon(Icons.person, size: 70, color: Colors.orange,),
                    Text("Data Kelompok",
                      style: TextStyle(
                          fontSize: 17.0)
                    ),
                 ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return stopwatch();
                    }));
              },
              splashColor: Colors.orange,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.timer, size: 70, color: Colors.orange,),
                    Text("Stopwatch",
                        style: TextStyle(
                            fontSize: 17.0)
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.orange,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.thumb_up, size: 70, color: Colors.orange,),
                    Text("Recommendation",
                        style: TextStyle(
                            fontSize: 17.0)
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.orange,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.favorite, size: 70, color: Colors.orange,),
                    Text("Favorit",
                        style: TextStyle(
                            fontSize: 17.0)
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
