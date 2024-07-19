import 'package:flutter/material.dart';

class GridCoverWon extends StatelessWidget {
  const GridCoverWon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You won!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 48.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}
