import 'package:flutter/cupertino.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space(this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

/// A widget with [size] height and 0 width
/// used to provide vertical spacing between widgets
class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, size);
}

/// A widget with [size] width and 0 height
/// used to provide horizontal spacing between widgets
class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(size, 0);
}
