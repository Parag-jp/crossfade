import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CrossFade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      reload();
    });
  }
    void reload(){
     setState(() {
       isFirst = false;
     });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 2),
          firstChild: Container(
            height: 300,
            width: 500,
            color: Colors.yellowAccent,
          ),
          secondChild: Image.asset(
            'assets/images/ipl.jpg',
            width: 500,
            height: 300,fit: BoxFit.fill,
          ),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
