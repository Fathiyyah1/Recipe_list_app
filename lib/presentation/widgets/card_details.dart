import 'package:flutter/material.dart';

Widget CardDetails(
    {required String title,
    required String cookTime,
    required String rating,
    required String thumbnailUrl}) {
  return Container(
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
