import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class background_color_gradient extends StatelessWidget {
  const background_color_gradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(-19.0, -11.0, 415.0, 833.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      pinRight: true,
      pinTop: true,
      pinBottom: true,
      child: repeat_BG_color(),
    );
  }
}
class repeat_BG_color extends StatelessWidget {
  const repeat_BG_color({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
          colors: [
            const Color(0xff7e80b9),
            const Color(0x9a7b7db4),
            const Color(0x0d7678ae),
            const Color(0xff3f405d)
          ],
          stops: [0.0, 0.32, 0.787, 1.0],
        ),
        border: Border.all(width: 1.0, color: const Color(0xff707070)),
      ),
    );
  }
}