import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  final double price;
  final double change;
  final double percent;

  const StockCard({
    Key? key,
    required this.symbol,
    required this.price,
    required this.change,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = (change >= 0) ? Colors.green : Colors.red;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left symbol + NSE
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              symbol,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'NSE',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),

        // Right price + change
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              price.toStringAsFixed(2),
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)} (${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%)',
              style: TextStyle(color: color, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
