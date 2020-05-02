import 'package:covion/utils/GeneralHelper.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appBar(),
    );
  }

  Widget appBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          height: Height(context, 11),
          width: Width(context, 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
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
            padding: EdgeInsets.only(top: Height(context, 5)),
            child: Text(
                'Languages',
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
  }
}