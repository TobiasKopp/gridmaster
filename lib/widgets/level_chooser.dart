import 'package:flutter/material.dart';
import 'package:grid_master/game/logic.dart';

import '../controls/generate_button.dart';
import '../levels/tutorial/tutorial_1.dart';
import '../levels/tutorial/tutorial_5.dart';

class LevelChooser extends StatelessWidget {
  const LevelChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const GenerateButton(),
        IconButton(
          onPressed: () => Logic.switchToLevel(context, L_TUTORIAL_1),
          icon: const Text("1", style: TextStyle(fontSize: 30),),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () => Logic.switchToLevel(context, L_TUTORIAL_5),
          icon: const Text("5", style: TextStyle(fontSize: 30),),
          iconSize: 40,
        ),
      ],
    );
  }
}
