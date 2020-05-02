import 'dart:core';
import 'dart:io';

import 'package:covion/model/status_global.dart';
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
    return Row(
      children: <Widget>[
        pageState.appBar(),
      ],
    );
  }
}