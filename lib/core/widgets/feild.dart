
import 'package:flutter/material.dart';


const decoratiomText = InputDecoration(

  // hintText: "UserName" ,
  enabledBorder:  UnderlineInputBorder(
    borderSide:  BorderSide.none,
  ),
  focusedBorder:   UnderlineInputBorder(
    borderSide:  BorderSide(color: Colors.black, width: 1.0),
  ),
  hintStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
  prefixIcon:Padding(
    padding: const EdgeInsets.only(right: 10),
    // child: Container(
    //   margin: const EdgeInsets.only(top: 15),
    //   padding: const EdgeInsets.only(bottom: 10),
    //   height: 20,
    //   width: 30,
    //   decoration:  BoxDecoration(
    //       border: Border(right: BorderSide(color:  Theme.of(context).canvasColor,width: 1))
    //   ),
    //   //child: Icon(icon,color: Colors.black,size: 20,),
    // ),
  ),
filled: true,
  contentPadding: EdgeInsets.all(8)
);