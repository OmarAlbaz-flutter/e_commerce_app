import 'package:flutter/material.dart';

SweepGradient sweepGraientMethod() {
    return SweepGradient(
      center: FractionalOffset.center,
      colors: <Color>[
        Color(0xFF9775FA), // base purple
        Color(0xFFA689FB), // lighter purple
        Color(0xFFB79CFC), // soft lavender
        Color(0xFF8660E0), // deeper purple
        Color(0xFF6F4CC0), // dark accent purple
        Color(0xFF9775FA), // back to base for seamless transition
      ],
      stops: <double>[0.0, 0.25, 0.5, 0.75, 0.9, 1.0],
    );
  }