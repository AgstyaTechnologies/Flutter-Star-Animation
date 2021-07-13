import 'dart:async';

import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LineState();
}

int count = 0;

class _LineState extends State<Line> with TickerProviderStateMixin {
  double _progress = 0.0;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    const threeSec = const Duration(milliseconds: 3000);
    Timer.periodic(threeSec, (Timer t) {
      if (count == 5) {
        count = 0;
      }
      count = count + 1;
      print("Count: $count");
      var controller = AnimationController(
          duration: Duration(milliseconds: 3000), vsync: this);

      animation = Tween(begin: 0.0, end: 1.0).animate(controller)
        ..addListener(() {
          setState(() {
            _progress = animation.value;
          });
        });

      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LinePainter(_progress));
  }
}

class LinePainter extends CustomPainter {
  Paint _paint;
  Paint _paint2;
  Paint _paint3;
  Paint _paint4;
  Paint _paint5;
  double _progress;

  LinePainter(this._progress) {
    _paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3.0;

    _paint2 = Paint()
      ..color = Colors.red
      ..strokeWidth = 3.0;

    _paint3 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3.0;

    _paint4 = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 3.0;

    _paint5 = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var points = [
      Offset(0.0, 280.0),
      Offset(150.0 * (_progress), -280.0 * _progress + 280.0),
      Offset(150.0, 0.0),
      Offset(130 * _progress + 150, 280.0 * _progress),
      Offset(-280.0 * (_progress) + 280.0, -171.0 * _progress + 280.0),
      Offset(280.0, 280.0),
      Offset(0.0, 110.0),
      Offset(280.0 * _progress, 110.0),
      Offset(280.0, 110.0),
      Offset((-280.0 * _progress) + 280.0, (170.0 * _progress) + 110.0),
    ];
    // if (points.isEmpty) return;
    // Path path = Path();
    // Offset origin = points[0];
    // path.moveTo(origin.dx, origin.dy);
    // for (Offset o in points) {
    //   path.lineTo(o.dx * _progress, o.dy * _progress);
    // }
    // canvas.drawPath(
    //   path,
    //   Paint()
    //     ..color = Colors.orange
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 4.0,
    // );
    if (count == 1) {
      canvas.drawLine(points[0], points[1], _paint);
    } else if (count == 2) {
      canvas.drawLine(Offset(0.0, 280.0), Offset(150.0, 0.0), _paint);
      canvas.drawLine(points[2], points[3], _paint2);
    } else if (count == 3) {
      canvas.drawLine(Offset(0.0, 280.0), Offset(150.0, 0.0), _paint);
      canvas.drawLine(Offset(150.0, 0.0), Offset(280, 280.0), _paint2);
      canvas.drawLine(points[4], points[5], _paint3);
    } else if (count == 4) {
      canvas.drawLine(Offset(0.0, 280.0), Offset(150.0, 0.0), _paint);
      canvas.drawLine(Offset(150.0, 0.0), Offset(280, 280.0), _paint2);
      canvas.drawLine(Offset(0.0, 110), Offset(280.0, 280.0), _paint3);
      canvas.drawLine(points[6], points[7], _paint4);
    } else if (count == 5) {
      canvas.drawLine(Offset(0.0, 280.0), Offset(150.0, 0.0), _paint);
      canvas.drawLine(Offset(150.0, 0.0), Offset(280, 280.0), _paint2);
      canvas.drawLine(Offset(0.0, 110), Offset(280.0, 280.0), _paint3);
      canvas.drawLine(Offset(0.0, 110.0), Offset(280.0, 110.0), _paint4);
      canvas.drawLine(points[8], points[9], _paint5);
    }
    // canvas.drawLine(Offset(0.0, 280.0),
    //     Offset(150.0 * (_progress), -280.0 * _progress + 280.0), _paint);
    // canvas.drawLine(Offset(150.0, 0.0),
    //     Offset(130 * _progress + 150, 280.0 * _progress), _paint2);
    //
    // canvas.drawLine(
    //     Offset(-280.0 * (_progress) + 280.0, -171.0 * _progress + 280.0),
    //     Offset(280.0, 280.0),
    //     _paint3);
    // canvas.drawLine(
    //     Offset(0.0, 110.0), Offset(280.0 * _progress, 110.0), _paint4);
    // canvas.drawLine(
    //     Offset(280.0, 110.0),
    //     Offset((-280.0 * _progress) + 280.0, (170.0 * _progress) + 110.0),
    //     _paint5);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}
