import 'dart:math';

import 'package:flutter/material.dart';


getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

const backgroundColor = Colors.black;
const buttonColor = Colors.red;
const borderColor = Colors.grey;