import 'package:flutter/cupertino.dart';

double Height(BuildContext context, int percent){
  return MediaQuery.of(context).size.height * (percent/100);
}

double Width(BuildContext context, int percent){
  return MediaQuery.of(context).size.width * (percent/100);
}