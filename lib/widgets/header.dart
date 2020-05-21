import 'package:flutter/material.dart';

AppBar customAppBar(text) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontFamily: 'Comfortaa',
      ),
    ),
  );
}
