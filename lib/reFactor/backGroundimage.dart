import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';


class background_image extends StatelessWidget {
  const background_image({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(10.0, 370.0, 355.0, 311.0),
      size: Size(375.0, 812.0),
      pinLeft: true,
      pinRight: true,
      fixedHeight: true,
      child:
      // Adobe XD layer: 'pic1' (shape)
      RepeatContainerBGimage(),
    );
  }
}


class RepeatContainerBGimage extends StatelessWidget {
  const RepeatContainerBGimage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/bgImage.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}