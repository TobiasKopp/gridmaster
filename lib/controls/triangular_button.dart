import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';
import 'package:grid_master/widgets/triangle_painter.dart';

class TriangularButton extends StatelessWidget {
  const TriangularButton({
    required this.onPressed,
    Key? key
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: CustomPaint(
        painter: TrianglePainter(
          strokeColor: kColorControllerArrow,
          paintingStyle: PaintingStyle.fill,
        ),
        child: Container(
          width: 50,
          height: 30,
        ),
      ),
    );
  }
}
