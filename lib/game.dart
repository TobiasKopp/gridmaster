import 'package:flutter/material.dart';
import 'package:grid_master/controls/controller_widget.dart';
import 'package:grid_master/grid_widget.dart';
import 'package:grid_master/widgets/level_chooser.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({
    this.width = 11,
    this.height = 11,
    Key? key
  }) : super(key: key);

  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridWidget(
              level: Provider.of<Data>(context).LEVEL,
            ),

            const ControllerWidget(),
          ],
        ),

        LevelChooser(genSize: width * height),
      ],
    );
  }
}
