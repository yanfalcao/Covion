import 'package:covion/resource/color.dart';
import 'package:flutter/cupertino.dart';

BottomNavigationBarItem AppBarItem(IconData icon, String text){
  return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Color(0xFFFFFFFF),
        size: 24,
      ),
      activeIcon: Icon(
        icon,
        color: Color(0xA6FFFFFF),
        size: 30,
      ),
      title: SizedBox(width: 0, height: 0,)
  );
}