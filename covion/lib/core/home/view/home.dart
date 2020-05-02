import 'dart:core';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:covion/utils/GeneralHelper.dart';
import 'package:covion/model/status_global.dart';
import 'package:covion/service/global_status_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../main/main.dart';

class Dashboard{
  BuildContext context;
  StatusGlobal statusGlobal;
  MyHomePageState pageState;

  Dashboard({this.context, this.pageState});

  Widget build(){
    return FutureBuilder<StatusGlobal>(
      future: StatusGlobalService().fetchStatus(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.error != null){
            pageState.checkInternetConnectivity();
          }else{
            statusGlobal = snapshot.data;
            return board(false);
          }
        }
        return board(true);
      },
    );
  }

  Widget board(bool isLoading){
    if(!isLoading){
      return Stack(
        children: <Widget>[
          pageState.appBar(),
          DashboardBox(
              alignment: Alignment(0, -0.6),
              isMainBox: true,
              data: statusGlobal.infected.toString(),
              label: 'Infected',
              color: Color(0xFF6A77CC),
              context: context
          ).build(),
          DashboardBox(
              alignment: Alignment(-0.82, 0.18),
              isMainBox: false,
              data: statusGlobal.deaths.toString(),
              label: 'Deaths',
              color: Color(0xFFE15E5E),
              context: context
          ).build(),
          DashboardBox(
              alignment: Alignment(0.82, 0.18),
              isMainBox: false,
              data: statusGlobal.recovered.toString(),
              label: 'Recovered',
              color: Color(0xFF23C74F),
              context: context
          ).build(),
          DashboardBox(
              alignment: Alignment(-0.82, 0.92),
              isMainBox: false,
              data: statusGlobal.newCases.toString(),
              label: 'New Cases Today',
              color: Color(0xFF8836CF),
              context: context
          ).build(),
          DashboardBox(
              alignment: Alignment(0.82, 0.92),
              isMainBox: false,
              data: statusGlobal.newDeaths.toString(),
              label: 'New Deaths Today',
              color: Color(0xFFE15E5E),
              context: context
          ).build()
        ],
      );
    }else{
      return Stack(
        children: <Widget>[
          pageState.appBar(),
          ShimmerBox(
              alignment: Alignment(0, -0.6),
              isMainBox: true,
              context: context
          ).build(),
          ShimmerBox(
              alignment: Alignment(-0.82, 0.18),
              isMainBox: false,
              context: context
          ).build(),
          ShimmerBox(
              alignment: Alignment(0.82, 0.18),
              isMainBox: false,
              context: context
          ).build(),
          ShimmerBox(
              alignment: Alignment(-0.82, 0.92),
              isMainBox: false,
              context: context
          ).build(),
          ShimmerBox(
              alignment: Alignment(0.82, 0.92),
              isMainBox: false,
              context: context
          ).build()
        ],
      );
    }
  }
}

class DashboardBox{
  Alignment alignment;
  bool isMainBox;
  String data;
  String label;
  Color color;
  BuildContext context;

  DashboardBox({this.alignment, this.isMainBox, this.data, this.label, this.color, this.context});

  Widget build(){
    return Align(
      alignment: this.alignment,
      child: Container(
          height: isMainBox ? Height(context, 25) : Height(context, 23),
          width: isMainBox ? Width(context, 90) : Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [boxShadow()]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: textInBox(
                      this.data,
                      this.color,
                      isMainBox ? 60 : 50,
                      25
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: textInBox(
                      this.label,
                      this.color,
                      26,
                      15
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  BoxShadow boxShadow() => BoxShadow(
    color: Color(0x66abb7c5),
    blurRadius: 6.0,
    spreadRadius: 1.0,
    offset: Offset(3, 3.0),
  );

  Widget textInBox(String text, Color color, double size, double minSize){
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return AutoSizeText(
      text.replaceAllMapped(reg, mathFunc),
      style: TextStyle(
        fontFamily: 'SourceSansPro Regular',
        fontSize: size,
        color: color,
      ),
      maxLines: 1,
      minFontSize: minSize,
    );
  }
}

class ShimmerBox{
  Alignment alignment;
  bool isMainBox;
  BuildContext context;

  ShimmerBox({this.alignment, this.isMainBox, this.context});

  Widget build(){
    return Align(
      alignment: this.alignment,
      child: Container(
          height: isMainBox ? Height(context, 25) : Height(context, 23),
          width: isMainBox ? Width(context, 90) : Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [boxShadow()]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15),
                    width: isMainBox ? 250 : 150,
                    height: isMainBox ? 45 : 40,
                    child: shimmer()
                ),
                Container(
                    width: isMainBox ? 150 : 100,
                    height: isMainBox ? 25 : 25,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

  Widget shimmer() => Shimmer.fromColors(
    baseColor: Colors.grey[200],
    highlightColor: Colors.white,
    child: Image.asset('rect.jpg', fit: BoxFit.fill,),
  );

  BoxShadow boxShadow() => BoxShadow(
    color: Color(0x66abb7c5),
    blurRadius: 6.0,
    spreadRadius: 1.0,
    offset: Offset(3, 3.0),
  );
}