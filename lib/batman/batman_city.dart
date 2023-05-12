import 'package:flutter/material.dart';

class BatmanCity extends StatelessWidget {
  const BatmanCity({super.key, required this.animation});
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _cityCustomClipper(progress: animation.value),
      child: Image.asset(
        'assets/images/city.png',
      ),
    );
  }
}

class _cityCustomClipper extends CustomClipper<Path> {
  _cityCustomClipper({required this.progress});
  final double progress;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
