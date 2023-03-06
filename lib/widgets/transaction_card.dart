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
              Image.asset(
                "assets/images/incoming.png",
                width: 32,
                height: 32,
              )
            ],
          ),
          //column 2
          Column(
            children: const [
              Text("Layor Salami"),
              Text("Jan 10 2023"),
            ],
          ),
          //column 3
          Column(
            children: [
              Text("NGN 10,000"),
            ],
          ),
        ],
      ),
    );
  }
}
