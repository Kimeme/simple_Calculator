import 'package:calculator/home_screen.dart';
import 'package:flutter/material.dart';
void main ()
{
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  //const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}
/*
class SimpleCalculator extends StatefulWidget {
 // SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String userInput = "";

  String result = "0";

  List<String> buttonList = [
    "AC",
    "(",
    ")",
    "/",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    "C",
    "0",
    ".",
    "=",


  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Simple Calculator"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.79,
                child: resultwidget(

                ),
              )
            ],
          )
      ),
    );
  }

  Widget resultwidget() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(userInput, style: TextStyle(fontSize: 32),),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

  Widget buttonwidget() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(66, 233, 232, 232),
      child: GridView.builder(
        itemCount: buttonList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), itemBuilder: (context, index) {
        return button(buttonList[index]);
        },
      ),
    );
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return Colors.redAccent;
    }
    if (text == "=" || text == "AC") {
      return Colors.white;
    }
    return Colors.indigo;
  }


  getBgColor(String text) {
    if (text == "AC") {
      return Colors.redAccent;
    }
    if (text == "=") {
      return Color.fromARGB(255, 104, 204, 159);
    }
    return Colors.white;
  }

  Widget button(String text) {
    return InkWell(
      onTap: () {
        setState( () {
         // handleButtonPress(text);
        } ) ;
      },

      child: Container(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text, style: TextStyle(
              color: getBgColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
*/





