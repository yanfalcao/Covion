import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final String image;
  final MyHomePageState pageState;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.pageState,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        _card(context),
        _circularImage()
      ],
    );
  }

  Widget _card(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        top: Consts.avatarRadius,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'SourceSansPro SemiBold'
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'SourceSansPro Regular'
            ),
          ),
          SizedBox(height: 26.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.redAccent
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  pageState.pop();
                },
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro SemiBold',
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _circularImage(){
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: CircleAvatar(
        radius: 55,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 55,
          backgroundImage: AssetImage(image),
        ),
      )

    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 65.0;
}