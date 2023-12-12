import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import 'roundrect.dart';

class PlayArea extends RoundRect {
  PlayArea()
      : super(
          position: Vector2(gameWidth / 2, gameHeight / 2),
          bgColor: const Color(0xff000000),
          size: Vector2(gameWidth, gameHeight),
          cornerRadius: const Radius.circular(5),
          children: [RectangleHitbox()],
        );
}
