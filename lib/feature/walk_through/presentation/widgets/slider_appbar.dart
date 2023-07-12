import 'package:flutter/material.dart';

PreferredSizeWidget sliderAppBar({required double value})=>AppBar(
  title: Slider(
    value: value,
    inactiveColor: Colors.grey.shade300,
    onChanged: (double value) {},

  ),
);
