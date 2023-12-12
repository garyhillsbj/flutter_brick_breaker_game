import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../brick_breaker.dart';
import 'roundrect.dart';
import 'ball.dart';
import 'bat.dart';

class Brick extends RoundRect
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Brick({
    required super.position,
    required super.bgColor,
  }) : super(
          size: Vector2(brickWidth, brickHeight),
          cornerRadius: const Radius.circular(brickHeight / 5),
          children: [RectangleHitbox()],
        );

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();
    game.score.value++;

    if (game.world.children.query<Brick>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}
