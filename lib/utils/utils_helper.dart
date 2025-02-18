
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration mTextFieldDecoration({var lableText,required String hintText,Icon? suffixIcon,Icon? prefixIcon }) {
  return InputDecoration(
    labelText: lableText,
    hintText: hintText,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    ) ,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    )
  );
}

SizedBox mHeight({var mHeight=11}){
  return SizedBox(
    height: mHeight,
  );
}

SizedBox mWidth({var mWidth=11}){
  return SizedBox(
    width: mWidth,
  );
}