import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/game/logic.dart';
import 'package:provider/provider.dart';

import '../../data.dart';

class GridCoverInitial extends StatelessWidget {
  const GridCoverInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWallTile,
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
              ))
          ),
          onPressed: () => Provider.of<Data>(context, listen: false).setGameState(GameState.countdown),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
            ),
            child: const Text(
              'Start Game',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          )
      ),
    );
  }
}



