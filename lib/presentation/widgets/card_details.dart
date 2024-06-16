import 'package:flutter/material.dart';

Widget CardDetails(
    {required String title,
    required String cookTime,
    required String rating,
    required String thumbnailUrl}) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    // height: 180,
    // decoration: BoxDecoration(
    //   color: Colors.black,
    //   borderRadius: BorderRadius.circular(15),
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.black.withOpacity(0.6),
    //       offset: Offset(
    //         0.0,
    //         10.0,
    //       ),
    //       blurRadius: 10.0,
    //       spreadRadius: -6.0,
    //     ),
    //   ],
    //   image: DecorationImage(
    //     colorFilter: ColorFilter.mode(
    //       Colors.black.withOpacity(0.35),
    //       BlendMode.multiply,
    //     ),
    //     image: NetworkImage(thumbnailUrl),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    child: Column(
      children: [
        Image.network(thumbnailUrl),
        Text(title),
        Text(cookTime),
        Text(rating),
      ],
    ),
  );
}
