import 'dart:html';

import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../game/logic.dart';

class GridCoverShowing extends StatefulWidget {
  const GridCoverShowing({
    required this.duration,
    required this.width,
    Key? key
  }) : super(key: key);

  final Duration duration;
  final double width;
  final double padding = 1;

  @override
  _GridCoverShowingState createState() => _GridCoverShowingState();
}

class _GridCoverShowingState extends State<GridCoverShowing>
    with TickerProviderStateMixin {
  late Animation<double> _widthAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((status) {
      if (status==AnimationStatus.completed) {
        Provider.of<Data>(context, listen: false).setGameState(GameState.covered);
      }
    });
    _widthAnimation = Tween(begin: 0.0, end: widget.width).animate(_controller);
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -24,
          child: Container(
            height: 24,
            width: widget.width,
            color: kColorGridLines,
            padding: EdgeInsets.all(widget.padding),
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  height: 22,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff1f005c),
                        Color(0xff5b0060),
                        Color(0xff870160),
                        Color(0xffac255e),
                        Color(0xffca485c),
                        Color(0xffe16b5c),
                        Color(0xfff39060),
                        Color(0xffffb56b),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 22,
                    width: _widthAnimation.value,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
}
