import 'package:flutter/material.dart';
import 'package:grid_master/constants.dart';


class GridCoverFailed extends StatelessWidget {
  const GridCoverFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWallTile,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            child: const Text(
              "You failed.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          kVSpace_16,
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ))
              ),
              onPressed: () => restart(context),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                ),
                child: const Text(
                  'Try again?',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

  void restart(BuildContext context) {
    // TODO
  }

}
