import 'dart:core';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:covion/core/language/language.dart';
import 'package:covion/model/status_global.dart';
import 'package:covion/utils/GeneralHelper.dart';
import 'package:flutter/material.dart';

import '../main/main.dart';

class Settings{
  BuildContext context;
  StatusGlobal statusGlobal;
  MyHomePageState pageState;

  Settings({this.context, this.pageState});

  Widget build(){
    return board(false);
  }

  Widget board(bool isLoading){
    return Column(
      children: <Widget>[
        pageState.appBar(),
        boxItem('Countries'),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage()));
          },
          child: boxItem('Languages'),
        )
      ],
    );
  }

  Widget boxItem(String text) => Container(
      height: Height(context, 8),
      width: Width(context, 91),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Color(0x66abb7c5),
              blurRadius: 6.0,
              spreadRadius: 1.0,
              offset: Offset(3, 3.0),
            )
          ]
      ),
      margin: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'SourceSansPro Regular',
            fontSize: 24,
            color: Color(0xFF6A77CC),
          ),
        ),
      )
    );
}