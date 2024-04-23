import 'package:flutter/material.dart';

class LinePaint extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;
  final bool withGap;
  const LinePaint({super.key, this.color = Colors.black, this.thickness = 2.0, this.height = 2.0, this.withGap = false,});
  @override Widget build(BuildContext context,) {
    return CustomPaint(
      painter: LinePainter(color: color, thickness: thickness, withGap: withGap,),
      size: Size(double.infinity, height,),
    );
  }
}


class LinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final bool withGap;
  const LinePainter({required this.color, required this.thickness, required this.withGap,});
  @override void paint(Canvas canvas, Size size,) {
    final Paint paint = Paint()..strokeWidth = thickness;
    if(withGap) {
      bool isGap = true;
      for(int i = 0; i < size.width; i += 4) {
        paint.color = isGap ? Colors.transparent : color;
        final Offset startPoint = Offset(i.toDouble(), size.height / 2,);
        final Offset endPoint = Offset((i + 4).toDouble() + 1, size.height / 2,);
        canvas.drawLine(startPoint, endPoint, paint,);
        isGap = !isGap;
      }
    } else {
      paint.color = color;
      final Offset startPoint = Offset(0, size.height / 2,);
      final Offset endPoint = Offset(size.width, size.height / 2,);
      canvas.drawLine(startPoint, endPoint, paint,);
    }
  }
  @override bool shouldRepaint(CustomPainter oldDelegate,) { return false; }
}