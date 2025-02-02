import 'package:flutter/material.dart';
import 'package:grid_master/levels/tutorial/tutorial_1.dart';

import 'game/level.dart';

/// COLORS
const Color kColorGridLines = Color(0xff000000);
const Color kColorWallTile = Color(0xff17232b);
const Color kColorFloorTile = Color(0xff7dabc7);
const Color kColorStartTile = Color(0xff70d93d);
const Color kColorGoalTile = Color(0xff9710af);
const Color kColorPlayer = Color(0xffd51313);
const Color kColorControllerArrow = Color(0xff3d3d3d);
const Color kColorInputSequenceDisplay = Colors.grey;
const Color kColorTimerBar = Color(0xffe79429);


const double kGridLineThickness = 0.4;


/// LAYOUT
const double kGridMaxWidth = 500;




/// SPACES
const Widget kVSpace_4 = SizedBox(height: 4);
const Widget kVSpace_8 = SizedBox(height: 8);
const Widget kVSpace_12 = SizedBox(height: 12);
const Widget kVSpace_16 = SizedBox(height: 16);
const Widget kVSpace_20 = SizedBox(height: 20);
const Widget kVSpace_24 = SizedBox(height: 24);
const Widget kVSpace_32 = SizedBox(height: 32);

const Widget kHSpace_8 = SizedBox(width: 4);
const Widget kHSpace_4 = SizedBox(width: 8);
const Widget kHSpace_12 = SizedBox(width: 12);
const Widget kHSpace_16 = SizedBox(width: 16);
const Widget kHSpace_20 = SizedBox(width: 20);
const Widget kHSpace_24 = SizedBox(width: 24);
const Widget kHSpace_32 = SizedBox(width: 32);

/// DEFAULT LEVEL
const int DEFAULT_LEVEL_WIDTH = 11;
const int DEFAULT_LEVEL_HEIGHT = 11;

final Level DEFAULT_LEVEL = L_TUTORIAL_1;
