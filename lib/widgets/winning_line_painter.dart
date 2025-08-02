import 'package:flutter/material.dart';

class WinningLinePainter extends CustomPainter {
  final int comboIndex;
  final double progress;

  WinningLinePainter({required this.comboIndex, this.progress = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / 3;

    Offset start = Offset.zero;
    Offset end = Offset.zero;

    switch (comboIndex) {
      case 0:
        start = Offset(0, cellSize / 2);
        end = Offset(size.width, cellSize / 2);
        break;
      case 1:
        start = Offset(0, cellSize * 1.5);
        end = Offset(size.width, cellSize * 1.5);
        break;
      case 2:
        start = Offset(0, cellSize * 2.5);
        end = Offset(size.width, cellSize * 2.5);
        break;
      case 3:
        start = Offset(cellSize / 2, 0);
        end = Offset(cellSize / 2, size.height);
        break;
      case 4:
        start = Offset(cellSize * 1.5, 0);
        end = Offset(cellSize * 1.5, size.height);
        break;
      case 5:
        start = Offset(cellSize * 2.5, 0);
        end = Offset(cellSize * 2.5, size.height);
        break;
      case 6:
        start = Offset(0, 0);
        end = Offset(size.width, size.height);
        break;
      case 7:
        start = Offset(size.width, 0);
        end = Offset(0, size.height);
        break;
    }

    final animatedEnd = Offset.lerp(start, end, progress)!;

    final gradient = LinearGradient(
      colors: [Colors.greenAccent, Colors.blueAccent, Colors.purpleAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromPoints(start, end));

    final paint = Paint()
      ..shader = gradient
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(start, animatedEnd, paint);
  }

  @override
  bool shouldRepaint(covariant WinningLinePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.comboIndex != comboIndex;
}
