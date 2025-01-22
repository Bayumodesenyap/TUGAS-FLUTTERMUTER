import 'package:acakdadu/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 187, 11, 11),
          Color.fromARGB(255, 221, 201, 27),
        ),
      ),
    ),
  );
}
