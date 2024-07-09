import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({required this.nTiles, Key? key}) : super(key: key);

  final int nTiles;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Provider.of<Data>(context, listen: false).generateRandomTiles(nTiles),
      icon: Icon(Icons.autorenew),
      iconSize: 40,
    );
  }
}
