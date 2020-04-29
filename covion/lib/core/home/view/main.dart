import 'dart:ffi';
import 'dart:io';

import 'package:covion/controller/GeneralHelper.dart';
import 'package:covion/core/home/view/custom_dialog.dart';
import 'package:covion/core/home/view/helper.dart';
import 'package:covion/core/home/view/home/home.dart';
import 'package:covion/resource/icons/custom_bar_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title = 'Global Infection Data';
  int _currentBar = 1;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
    dashboard = Dashboard(context: context, pageState: this);

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: _body(),
      bottomNavigationBar: Container(
        child: _navigationBar(),
      ),
    );
  }

  Widget _body(){
    return dashboard.build();
  }

  Widget appBar() => Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: Height(context, 20),
      width: Width(context, 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 1.0],
              colors: [
                Color(0xffab9ae1),
                Color(0xff7371c1),
                Color(0xff4545b2)
              ]
          ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: Height(context, 6)),
        child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SourceSansPro Regular',
              fontSize: 30,
              color: Color(0xffffffff),
            )
        ),
      )
    ),
  );

  Widget _navigationBar() => BottomNavigationBar(
    items: [
      AppBarItem(CustomBar.bar_chart, "Analitycs"),
      AppBarItem(CustomBar.home_run, "Home"),
      AppBarItem(CustomBar.settings, "Configure")
    ],
    backgroundColor: Color(0xE6615EF1),
    type: BottomNavigationBarType.fixed,
    currentIndex: widget._currentBar,
    onTap: (index){
      setState(() {
        _changePage(index);
      });
    },
  );

  checkInternetConnectivity() async {
    try {
      await InternetAddress.lookup('google.com');
    } on SocketException catch (_) {
      _noNetwork();
    }
  }

  Widget _noNetwork(){
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: 'Oops!',
        description: 'Please check your internet connection',
        buttonText: 'Try Again',
        pageState: this,
        image: 'no-connection.png',
      )
    );
  }

  _changePage(int index){
    widget._currentBar = index;
    switch(index){
      case 0:
        widget.title = 'Infection Graphics';
        break;
      case 1:
        widget.title = 'Global Infection Data';
        break;
      case 2:
        widget.title = 'Settings';
        break;
    }
  }

  pop(){
    setState(() {});
  }
}
