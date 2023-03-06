import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          //column 1
          Column(
            children: [
              Center(
                child: Image.asset("assets/images/incoming.png"),
              )
            ],
          ),
          //column 2
          Column(
            children: [],
          ),
          //column 3
          Column(
            children: [],
          ),
        ],
      ),
    );
  }
}
