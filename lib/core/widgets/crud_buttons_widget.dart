import 'package:flutter/material.dart';

class CrudButtonsWidget extends StatelessWidget {
  const CrudButtonsWidget({
    super.key,
    required this.onTapCreate,
    required this.onTapRead,
    required this.onTapUpdate,
    required this.onTapDelete,
  });

  final VoidCallback onTapCreate;
  final VoidCallback onTapRead;
  final VoidCallback onTapUpdate;
  final VoidCallback onTapDelete;

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(icon: Icons.add, label: 'Create', onTap: onTapCreate),
        _buildButton(icon: Icons.search, label: 'Read', onTap: onTapRead),
        _buildButton(icon: Icons.edit, label: 'Update', onTap: onTapUpdate),
        _buildButton(icon: Icons.delete, label: 'Delete', onTap: onTapDelete),
      ],
    );
  }
}
