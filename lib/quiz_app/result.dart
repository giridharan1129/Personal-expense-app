import 'package:flutter/material.dart';

import './quiz_main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore == 0) {
      resultText = 'You are extremely strange';
    } else if (resultScore == 9) {
      resultText = 'You are awesome !';
    } else if (resultScore <= 5) {
      resultText = 'You are hard to read';
    } else {
      resultText = 'You are strange';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,150,0,0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  resultPhrase,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Score :',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '$resultScore',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),SizedBox(height: 20,),
            ElevatedButton(onPressed: resetHandler(), child: Text('RESTART QUIZ'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),)
          ],
        ),
      ),
    );
  }
}
