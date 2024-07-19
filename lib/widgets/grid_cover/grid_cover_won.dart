import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';


class GridCoverWon extends StatelessWidget {
  const GridCoverWon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWallTile,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            child: const Text(
              "You won!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

}
