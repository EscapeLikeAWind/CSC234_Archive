import 'package:flutter/material.dart';

class IconsWrapper extends StatelessWidget {
  const IconsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIcons(
          Icons.timelapse,
          "Time Elapsed:\n250ms",
        ),
        _buildIcons(Icons.search, "Results Returned:\n69"),
        _buildIcons(Icons.network_cell, "Possible Meaning:\n2+")
      ],
    );
  }

  Widget _buildIcons(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.purple,
          size: 16,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
