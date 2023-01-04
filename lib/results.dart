import 'package:flutter/material.dart';
// import 'bmi_brain.dart';
// import 'bodyofapp.dart';

class results extends StatelessWidget {
  var getAdvice;
  var getResult;
  var Calalculate_bmi;
  results(
      {required this.getResult,
      required this.Calalculate_bmi,
      required this.getAdvice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "YOUR RESULTS",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Card(
                color: Color(0xFF1D1E33),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getResult.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      Calalculate_bmi,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getAdvice,
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            botombutton(
              buttonlable: 'RE-CALCULATE',
              ontap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//botom buttons
class botombutton extends StatelessWidget {
  botombutton({required this.ontap, required this.buttonlable});
  final VoidCallback ontap;
  final String buttonlable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 80,
        width: double.infinity,
        color: Color(0xFFEB1555),
        child: Center(
          child: Text(
            "$buttonlable",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
