import 'package:flutter/material.dart';

class HomeOptionWidget extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onTap;

  const HomeOptionWidget({
    super.key,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 48),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
