import 'package:flutter/material.dart';

class ScaleGroup extends StatelessWidget {
  const ScaleGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildMea(),
        _buildMea(),
        _buildMea(),
        _buildMeaOutline(),
        _buildMeaOutline()
      ],
    );
  }

  Widget _buildMea() {
    return const Icon(
      Icons.car_crash,
      size: 32,
      color: Color(0xff8bc34a),
    );
  }

  Widget _buildMeaOutline() {
    return const Icon(
      Icons.car_crash_outlined,
      size: 32,
    );
  }
}
