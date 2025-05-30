// ignore_for_file: avoid_unnecessary_containers


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const calculatorApp());
}

// ignore: camel_case_types
class calculatorApp extends StatefulWidget {
  const calculatorApp({super.key});

  @override
  State<calculatorApp> createState() => _calculatorAppState();
}

// ignore: camel_case_types
class _calculatorAppState extends State<calculatorApp> {
  int firstNum = 0;
  int secondNum = 0;
  String history='';
   String textToDisplay='';
   String res='';
   String operation='';
  void btnOnClick(String btnVal) {
    if (kDebugMode) {
      print('Button Pressed: $btnVal');
    }
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } 
    else if(btnVal=='+/-'){
      if(textToDisplay[0]!='-'){
        res= '-$textToDisplay';
      }else{
        res=textToDisplay.substring(1);
      }
    }
    else if(btnVal=='<'){
      res=textToDisplay.substring(0,textToDisplay.length-1);
    }
    else if(btnVal=='%'){
      if(textToDisplay.isNotEmpty && int.tryParse(textToDisplay) != null){
        res=(int.parse(textToDisplay)/100).toString();
      }
    }
    else if (btnVal == '0' || btnVal == '1' || btnVal == '2' || btnVal == '3' || btnVal == '4' || btnVal == '5' || btnVal == '6' || btnVal == '7' || btnVal == '8' || btnVal == '9') {
      res = textToDisplay + btnVal;
    }
    else if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/') {
      if (textToDisplay.isNotEmpty && int.tryParse(textToDisplay) != null) {
        firstNum = int.parse(textToDisplay);
        res = '';
        operation = btnVal;
      }
    } else if (btnVal == '=') {
      if (textToDisplay.isNotEmpty && int.tryParse(textToDisplay) != null) {
        secondNum = int.parse(textToDisplay);
        if (operation == '+') {
          res = (firstNum + secondNum).toString();
          history = firstNum.toString() + operation + secondNum.toString();
        }
        if (operation == '-') {
          res = (firstNum - secondNum).toString();
          history = firstNum.toString() + operation + secondNum.toString();
        }
        if (operation == 'X') {
          res = (firstNum * secondNum).toString();
          history = firstNum.toString() + operation + secondNum.toString();
        }
        if (operation == '/') {
          if (secondNum != 0) {
            res = (firstNum / secondNum).toString();
            history = firstNum.toString() + operation + secondNum.toString();
          } else {
            res = 'Error'; // Handle division by zero
          }
        }
      }
    } else {
      res = textToDisplay + btnVal;
    }

    setState(() {
      textToDisplay = res;
    });
  }

  bool newMethod(String btnVal) => btnVal == 'C';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 17, 26),
          title: const Text('Calculator'),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 30, 241, 2),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: TextStyle(
                      fontSize: 24,
                      color: const Color.fromARGB(255, 111, 102, 102),
                    ), // Provide a default value for the text
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 236, 239, 236),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0), // Add space below the row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalButtons(
                      text: 'AC',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: 'C',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '<',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                    CalButtons(
                      text: '/',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0), // Add space below the row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalButtons(
                      text: '9',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '8',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '7',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: 'X',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0), // Add space below the row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalButtons(
                      text: '6',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '5',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '4',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '-',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0), // Add space below the row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalButtons(
                      text: '3',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '2',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(255, 212, 255, 0),
                    ),
                    CalButtons(
                      text: '1',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(255, 201, 246, 4),
                    ),
                    CalButtons(
                      text: '+',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0), // Add space below the row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalButtons(
                      text: '+/-',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '0',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '%',
                      callback: btnOnClick,
                      fillColor: Colors.black,
                      textColor: const Color.fromARGB(236, 217, 250, 4),
                    ),
                    CalButtons(
                      text: '=',
                      callback: btnOnClick,
                      fillColor: const Color.fromARGB(255, 255, 165, 0), // Orange background
                      textColor: const Color.fromARGB(236, 0, 0, 0), // Black text
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalButtons extends StatelessWidget {
  final String text;
  final Function callback;
  final Color fillColor;
  final Color textColor; // Add the textColor parameter

  const CalButtons({
    required this.text,
    required this.callback,
    required this.fillColor,
    required this.textColor, // Mark textColor as required
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callback(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 26,
          color: textColor, // Use the textColor parameter
        ),
      ),
    );
  }
}