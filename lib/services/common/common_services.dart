import 'package:flutter/material.dart';

class CommonServices {
  Color getColorStatus(String input) {
    Color color;
    switch (input.toLowerCase()) {
      case "green":
        color = Colors.greenAccent;
        break;
      case "blue":
        color = Colors.blueAccent;
        break;
      case "red":
        color = Colors.redAccent;
        break;
      case "black":
        color = Colors.black87;
        break;
      case "grey":
        color = Colors.grey;
        break;
      case "yellow":
        color = Colors.yellowAccent;
        break;
      case "brown":
        color = Colors.brown;
        break;
      case "pink":
        color = Colors.pinkAccent;
        break;
      case "purple":
        color = Colors.purpleAccent;
        break;
      case "white":
        color = Colors.white;
        break;
      default:
        color = Colors.white;
        break;
    }

    return color;
  }
}
