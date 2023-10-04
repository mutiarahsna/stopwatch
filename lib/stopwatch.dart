import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class stopwatch extends StatelessWidget {
  const stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({ Key? key}) : super(key: key);

  @override
 _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop(){
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset (){
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps(){
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
  setState(() {
  laps.add(lap);
  });
}

  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;
      if (localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds=0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ?"$seconds": "0$seconds";
        digitHours = (hours >= 10) ?"$hours": "0$hours";
        digitMinutes = (minutes >= 10) ?"$minutes": "0$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Stopwatch",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text("$digitHours:$digitMinutes:$digitSeconds",
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontSize: 82.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color:  Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lap ${index+1}",
                            style:TextStyle(
                                color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "${laps[index+1]}",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: RawMaterialButton(
                        onPressed: (){
                          (!started) ? start():stop();
                        },
                        fillColor: Colors.lightGreen,
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Colors.teal)
                      ),
                        child: Text(
                            (!started)?"Start":"Pause",
                        style: TextStyle(color: Colors.white)
                        ),
                      ),
                  ),
                  SizedBox(width: 8.0,),
                  IconButton(
                    color: Colors.black,
                    onPressed: (){
                      addLaps();
                    },
                      icon: Icon(Icons.flag),
                  ),
                  SizedBox(width: 8.0,),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        reset();
                      },
                      fillColor: Colors.red,
                      shape: StadiumBorder(side: BorderSide(color: Colors.teal)
                      ),
                      child: Text("Reset",
                          style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

