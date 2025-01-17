

import 'dart:ui';

import 'package:crud/screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed =Color.fromRGBO(231, 28, 36, 1);
const colorGreen =Color.fromRGBO(33, 191, 115, 1);
const colorWhite =Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue =Color.fromRGBO(44, 62, 80, 1);


SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

InputDecoration AppInputDecoration(level){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen, width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorWhite, width: 1),
    ),
    border: OutlineInputBorder(),
    labelText: level
  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: colorWhite, border: Border.all(color: colorWhite,width: 1),
    borderRadius: BorderRadius.circular(4)
   ),
    child: Padding(padding: EdgeInsets.only(left: 30, right: 30),
    child: child,
    ),
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}

Ink SuccessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText, style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: colorWhite
       ),
      ),
    ),
  );

}

void ErrorToast(msg) {
  Fluttertoast.showToast(
      msg: msg ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  mainAxisSpacing: 2,
  mainAxisExtent: 250,
);
}
