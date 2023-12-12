import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class RoundRect extends PositionComponent {
  RoundRect({
    required this.bgColor,
    required this.cornerRadius,
    required super.position,
    required super.size,
    super.children,
  }) : super(
          anchor: Anchor.center,
        );
  final Color bgColor;
  final Radius cornerRadius;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size.toSize(),
          cornerRadius,
        ),
        paint);
  }
}
