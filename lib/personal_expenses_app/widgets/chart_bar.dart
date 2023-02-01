import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 20,child: FittedBox(child: Text('\u{20B9}${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 5,
          width: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromARGB(255, 164, 164, 160),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                widthFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 9, 59, 138),
                                                Color.fromARGB(255, 12, 111, 192)
                                              ],),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text('$label')
      ],
    );
  }
}
