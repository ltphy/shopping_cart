import 'package:flutter/material.dart';

const scaleValue = 70;

Offset scaleOffset(double x, double y) {
  return Offset(x * scaleValue, -y * scaleValue);
}

Offset translateToIconLocation(Offset offset, double size) {
  return offset.translate(-size/2, -size);
}
