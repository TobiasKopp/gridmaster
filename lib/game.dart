import 'package:flutter/material.dart';
import 'package:grid_master/controls/controller_widget.dart';
import 'package:grid_master/widgets/grid_widget.dart';
import 'package:grid_master/widgets/level_chooser.dart';
import 'package:grid_master/widgets/timer_bar.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'game/level.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Level level = Provider.of<Data>(context).LEVEL;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TimerBarWidget(),
            GridWidget(level: level),
            const ControllerWidget(),
          ],
        ),

        const LevelChooser(),
      ],
    );
  }
}
