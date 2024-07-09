import 'package:flutter/material.dart';
import 'package:grid_master/controls/controller_widget.dart';
import 'package:grid_master/grid_widget.dart';
import 'package:grid_master/widgets/level_chooser.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LevelChooser(genSize: width * height),

        GridWidget(
          width: width,
          height: height,
        ),

        ControllerWidget(),
      ],
    );
  }
}
