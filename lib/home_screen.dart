import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class SimpleCalculator extends StatefulWidget {
   SimpleCalculator({super.key});

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
    "x",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          /*appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Simple Calculator"),
          ),*/
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.90,
                child: resultwidget(),
              ),
              Expanded(child: buttonwidget()),
            ],
          ),
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
            alignment: Alignment.centerRight,
            child: Text(
              userInput,
              style: TextStyle(
                  fontSize: 32
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonwidget() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(66, 233, 232, 232),
      child: GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: buttonList.length,
        itemBuilder: (context, index) {
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
        text == "x" ||
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
          handleButtonPress(text);
        });
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
            text,
            style: TextStyle(
              color: getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }

  handleButtonPress(String text) {
    if( text=="AC"){
      userInput= "";
      result= "";
      return;
    }
    if( text=="x"){
      if( userInput.length > 0){
        userInput = userInput.substring(0, userInput.length -1 );
        return;
      }
      else{
        return null;
      }
    }
    if(text=="="){
       result = calculate();
      userInput = result;
      if(userInput.endsWith(".0")){
        userInput= userInput.replaceAll(".0", " ");
      }
      if(result.endsWith(".0")){
        result= result.replaceAll(".0", " ");
      }
      return;
    }
    userInput= userInput + text;
  }

  String calculate() {
    try{
     var exp= Parser().parse(userInput);
     var evaluation= exp.evaluate(EvaluationType.REAL, ContextModel());
     return evaluation.toString();
    }
    catch(e){
      return "Error";
    }
  }
}

