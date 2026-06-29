import 'package:flutter/material.dart';
import 'package:doctro/theme/ayureze_theme.dart';

class OslerCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isError;

  const OslerCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: value ? AyurezeTheme.healingGreen50 : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isError 
                    ? AyurezeTheme.remoteRed50 
                    : (value ? AyurezeTheme.healingGreen50 : AyurezeTheme.border),
                width: 2,
              ),
            ),
            child: value
                ? Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isError ? AyurezeTheme.remoteRed50 : AyurezeTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}