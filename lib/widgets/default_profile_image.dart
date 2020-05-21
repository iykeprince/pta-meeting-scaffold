import 'package:flutter/material.dart';

Widget defaultProfileImage({size = 40.0}) {
  return Container(
    width: size,
    height: size,
    padding: EdgeInsets.only(right: 10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/flash_logo.jpg'),
      ),
    ),
  );
}
