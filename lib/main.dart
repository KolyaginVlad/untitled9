import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Solve());
}

class Solve extends StatefulWidget {
  const Solve({Key? key}) : super(key: key);

  @override
  _SolveState createState() => _SolveState();
}

class _SolveState extends State<Solve> {
  String a = "";
  String b = "";
  String c = "";
  String result = "";

  void count() {
    if (this.a != "" && this.b != "" && this.c != ""&& this.a!="") {
      double x1;
      double x2;
      double a = double.parse(this.a);
      double b = double.parse(this.b);
      double c = double.parse(this.c);
      var D = b * b - 4 * c * a;
      if (D >= 0) {
        x1 = (-b + sqrt(D)) / (2 * a);
        x2 = (-b - sqrt(D)) / (2 * a);
        setState(() {
          result = "x1 = ${x1.toStringAsFixed(6)} \nx2 = ${x2.toStringAsFixed(6)}";
        });
      } else {
        setState(() {
          result = "Нет решений";
        });
      }
    } else {
      setState(() {
        result = "Введите корректные данные";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Решение квадратных уравнений"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: 'a', border: InputBorder.none, isCollapsed: true),
                      style: TextStyle(fontSize: 22),
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      onChanged: (value) {
                        a = value;
                      },
                    ),
                  ),
                  Flexible(
                      child: Text(
                    "x\u00B2 + ",
                    style: TextStyle(fontSize: 22),
                  )),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: 'b', border: InputBorder.none, isCollapsed: true),
                      style: TextStyle(fontSize: 22),
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      onChanged: (value) {
                        b = value;
                      },
                    ),
                  ),
                  Flexible(
                      child: Text(
                    "x +",
                    style: TextStyle(fontSize: 22),
                  )),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: 'c', border: InputBorder.none, isCollapsed: true),
                      style: TextStyle(fontSize: 22),
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      onChanged: (value) {
                        c = value;
                      },
                    ),
                  ),
                  Flexible(
                      child: Text(
                    "= 0",
                    style: TextStyle(fontSize: 22),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: count,
                child: Text("Решить"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              Divider(),
              Text(
                result,
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
