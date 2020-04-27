import 'package:auto_size_text/auto_size_text.dart';
import 'package:covion/controller/GeneralHelper.dart';
import 'package:covion/model/status_global.dart';
import 'package:covion/service/global_status_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../main.dart';

class Dashboard{
  BuildContext context;
  StatusGlobal statusGlobal;
  MyHomePageState pageState;

  Dashboard({this.context, this.pageState});

  Widget build(){
    return FutureBuilder<StatusGlobal>(
      future: StatusGlobalService().fetchStatus(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          statusGlobal = snapshot.data;
          return board(false);
        }
        return board(true);
//        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget board(bool loading){
    if(loading){
      return Stack(
        children: <Widget>[
          pageState.appBar(),
          infectionLoading(),
          deathsLoading(),
          recoveredLoading(),
          newCasesLoading(),
          newDeathsLoading()
        ],
      );
    }
    return Stack(
      children: <Widget>[
        pageState.appBar(),
        infection(),
        deaths(),
        recovered(),
        newCases(),
        newDeaths()
      ],
    );
  }

  Widget infection(){
    return Align(
      alignment: Alignment(0, -0.6),
      child: Container(
        height: Height(context, 25),
        width: Width(context, 90),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: Color(0xffabb7c5),
                blurRadius: 6.0,
                spreadRadius: 1.0,
                offset: Offset(
                  3,
                  3.0,
                ),
              )
            ]
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                child: textInBox(
                  statusGlobal.infected.toString(),
                  Color(0xFF6A77CC),
                  60,
                  25
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: textInBox(
                  'Infected',
                  Color(0xFF6A77CC),
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

  Widget infectionLoading(){
    return Align(
      alignment: Alignment(0, -0.6),
      child: Container(
          height: Height(context, 25),
          width: Width(context, 90),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  width: 250,
                  height: 45,
                  child: shimmer()
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  width: 150,
                  height: 25,
                  child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

  Widget deaths(){
    return Align(
      alignment: Alignment(-0.82, 0.18),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: textInBox(
                      statusGlobal.deaths.toString(),
                      Color(0xFFE15E5E),
                      40,
                      25
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: textInBox(
                      'Deaths',
                      Color(0xFFE15E5E),
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

  Widget deathsLoading(){
    return Align(
      alignment: Alignment(-0.82, 0.18),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  width: 150,
                  height: 40,
                  child: shimmer()
                ),
                Container(
                  width: 100,
                  height: 25,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

  Widget recovered(){
    return Align(
      alignment: Alignment(0.82, 0.18),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: textInBox(
                      statusGlobal.recovered.toString(),
                      Color(0xFF23C74F),
                      40,
                      25
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: textInBox(
                      'Recovered',
                      Color(0xFF23C74F),
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

  Widget recoveredLoading(){
    return Align(
      alignment: Alignment(0.82, 0.18),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15),
                    width: 150,
                    height: 40,
                    child: shimmer()
                ),
                Container(
                    width: 100,
                    height: 25,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

  Widget newCases(){
    return Align(
      alignment: Alignment(-0.82, 0.92),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: textInBox(
                      statusGlobal.newCases.toString(),
                      Color(0xFF8836CF),
                      50,
                      25
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: textInBox(
                      'New Cases Today',
                      Color(0xFF8836CF),
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

  Widget newCasesLoading(){
    return Align(
      alignment: Alignment(-0.82, 0.92),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15),
                    width: 150,
                    height: 40,
                    child: shimmer()
                ),
                Container(
                    width: 100,
                    height: 25,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

  Widget newDeaths(){
    return Align(
      alignment: Alignment(0.82, 0.92),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: textInBox(
                      statusGlobal.newDeaths.toString(),
                      Color(0xFF8836CF),
                      50,
                      25
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: textInBox(
                      'New Deaths Today',
                      Color(0xFF8836CF),
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

  Widget newDeathsLoading(){
    return Align(
      alignment: Alignment(0.82, 0.92),
      child: Container(
          height: Height(context, 23),
          width: Width(context, 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffabb7c5),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3,
                    3.0,
                  ),
                )
              ]
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15),
                    width: 150,
                    height: 40,
                    child: shimmer()
                ),
                Container(
                    width: 100,
                    height: 25,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: shimmer()
                )
              ],
            ),
          )
      ),
    );
  }

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

  Widget shimmer(){
    return Shimmer.fromColors(
      baseColor: Colors.grey[200],
      highlightColor: Colors.white,
      child: Image.asset('rect.jpg', fit: BoxFit.fill,),
    );
  }
}