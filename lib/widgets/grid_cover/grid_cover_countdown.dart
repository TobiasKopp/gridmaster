import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../game/logic.dart';

class _AnimatedCountdown extends StatefulWidget {
  const _AnimatedCountdown({Key? key}) : super(key: key);

  @override
  _AnimatedCountdownState createState() => _AnimatedCountdownState();
}

class _AnimatedCountdownState extends State<_AnimatedCountdown>
    with TickerProviderStateMixin {

  late Animation<double> _fontSizeAnimation;
  late Animation<double> _opacityAnimation;
  late AnimationController _controller;
  int _displayNumber = 3;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((status) {
      if (status==AnimationStatus.completed) {
        if (_displayNumber <= 1) {
          Provider.of<Data>(context, listen: false).setGameState(GameState.showing);
        }
        setState(() {
          _displayNumber--;
          _controller.reset();
          _controller.forward();
        });
      }
    });
    _fontSizeAnimation = Tween(begin: 40.0, end: 140.0).animate(
        CurvedAnimation(parent: _controller,
            curve: Curves.easeOutSine
        ));
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller,
            curve: Curves.easeInCubic
        ));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_displayNumber",
      style: TextStyle(
        color: Colors.white.withOpacity(_opacityAnimation.value),
        fontSize: _fontSizeAnimation.value,
      ),
    );
  }
}

class GridCoverCountdown extends StatelessWidget {
  const GridCoverCountdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWallTile,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const _AnimatedCountdown(),
    );
  }
}

