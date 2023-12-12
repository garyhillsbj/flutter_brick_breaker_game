import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import 'roundrect.dart';

class Bat extends RoundRect with DragCallbacks {
  Bat({
    required super.position,
  }) : super(
          bgColor: const Color(0xff0099ff),
          size: Vector2(batWidth, batHeight),
          cornerRadius: const Radius.circular(batHeight / 2),
          children: [RectangleHitbox()],
        );

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x)
        .clamp(width / 2, gameWidth - width / 2);
  }

  void moveBy(double dx) {
    add(MoveToEffect(
      Vector2(
        (position.x + dx).clamp(width / 2, gameWidth - width / 2),
        position.y,
      ),
      EffectController(duration: 0.1),
    ));
  }
}
