// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CalButtons extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalButtons(
     this.text,
     this.fillColor,
     this.textColor,
     this.textSize, 
      // ignore: empty_constructor_bodies
      this.callback, {super.key});
    
  @override
  Widget build(BuildContext context) {

    return Container(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 9, 10), // Set the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      onPressed: () => {},
                      child:  Text(
                        text,
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 179, 243, 3), // Set the color for the text
                        ),
                      ),
                    ),
                  ),
                );
  }
}