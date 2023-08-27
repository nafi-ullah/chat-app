import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
      child: const Column(
        children: [
          Text('Move Rover'),

        ],
      )
    );
  }
}
