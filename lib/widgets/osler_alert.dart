import 'package:flutter/material.dart';
import 'package:doctro/theme/ayureze_theme.dart';

enum OslerAlertType { success, error, warning, info }

class OslerAlert extends StatelessWidget {
  final String title;
  final String? message;
  final OslerAlertType type;
  final bool showIcon;
  final VoidCallback? onDismiss;

  const OslerAlert({
    super.key,
    required this.title,
    this.message,
    this.type = OslerAlertType.info,
    this.showIcon = true,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (showIcon) ...[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getIconBackgroundColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_getIcon(), color: _getIconColor(), size: 20),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _getForegroundColor(),
                    ),
                  ),
                  if (message != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      message!,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getForegroundColor(),
                        height: 1.3,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (onDismiss != null) ...[
              GestureDetector(
                onTap: onDismiss,
                child: Icon(Icons.close, color: _getForegroundColor(), size: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case OslerAlertType.success:
        return AyurezeTheme.healingGreen10;
      case OslerAlertType.error:
        return AyurezeTheme.remoteRed10;
      case OslerAlertType.warning:
        return AyurezeTheme.sunshineYellow10;
      case OslerAlertType.info:
        return AyurezeTheme.connectivityBlue10;
    }
  }

  Color _getForegroundColor() {
    switch (type) {
      case OslerAlertType.success:
        return AyurezeTheme.healingGreen100;
      case OslerAlertType.error:
        return AyurezeTheme.remoteRed100;
      case OslerAlertType.warning:
        return AyurezeTheme.sunshineYellow100;
      case OslerAlertType.info:
        return AyurezeTheme.connectivityBlue100;
    }
  }

  Color _getIconBackgroundColor() {
    switch (type) {
      case OslerAlertType.success:
        return AyurezeTheme.healingGreen50.withOpacity(0.2);
      case OslerAlertType.error:
        return AyurezeTheme.remoteRed50.withOpacity(0.2);
      case OslerAlertType.warning:
        return AyurezeTheme.sunshineYellow50.withOpacity(0.2);
      case OslerAlertType.info:
        return AyurezeTheme.connectivityBlue50.withOpacity(0.2);
    }
  }

  Color _getIconColor() {
    switch (type) {
      case OslerAlertType.success:
        return AyurezeTheme.healingGreen100;
      case OslerAlertType.error:
        return AyurezeTheme.remoteRed100;
      case OslerAlertType.warning:
        return AyurezeTheme.sunshineYellow100;
      case OslerAlertType.info:
        return AyurezeTheme.connectivityBlue100;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case OslerAlertType.success:
        return Icons.check_circle_outline;
      case OslerAlertType.error:
        return Icons.error_outline;
      case OslerAlertType.warning:
        return Icons.warning_amber_outlined;
      case OslerAlertType.info:
        return Icons.info_outline;
    }
  }
}