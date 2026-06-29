import 'package:flutter/material.dart';
import 'package:doctro/theme/ayureze_theme.dart';
import 'package:doctro/widgets/osler_button.dart';

class OslerModal extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? message;
  final Widget? content;
  final String? primaryText;
  final String? secondaryText;
  final VoidCallback? primaryAction;
  final VoidCallback? secondaryAction;
  final bool showCloseButton;
  final IconData? icon;
  final Color? iconColor;
  final bool isDanger;

  const OslerModal({
    super.key,
    required this.title,
    this.subtitle,
    this.message,
    this.content,
    this.primaryText,
    this.secondaryText,
    this.primaryAction,
    this.secondaryAction,
    this.showCloseButton = true,
    this.icon,
    this.iconColor,
    this.isDanger = false,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? subtitle,
    String? message,
    Widget? content,
    String? primaryText,
    String? secondaryText,
    VoidCallback? primaryAction,
    VoidCallback? secondaryAction,
    bool showCloseButton = true,
    IconData? icon,
    Color? iconColor,
    bool isDanger = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OslerModal(
        title: title,
        subtitle: subtitle,
        message: message,
        content: content,
        primaryText: primaryText,
        secondaryText: secondaryText,
        primaryAction: primaryAction,
        secondaryAction: secondaryAction,
        showCloseButton: showCloseButton,
        icon: icon,
        iconColor: iconColor,
        isDanger: isDanger,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: AyurezeTheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AyurezeTheme.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              if (showCloseButton)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AyurezeTheme.surfaceMuted,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.close, color: AyurezeTheme.textSecondary, size: 20),
                    ),
                  ),
                ),
              if (icon != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AyurezeTheme.healingGreen50).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor ?? AyurezeTheme.healingGreen50, size: 32),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AyurezeTheme.textPrimary),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null || message != null) ...[
                const SizedBox(height: 8),
                Text(
                  message ?? subtitle!,
                  style: TextStyle(fontSize: 14, color: AyurezeTheme.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
              if (content != null) ...[
                const SizedBox(height: 24),
                content!,
              ],
              if (primaryText != null || secondaryText != null) ...[
                const SizedBox(height: 24),
                Column(
                  children: [
                    if (primaryText != null)
                      OslerButton(
                        text: primaryText!,
                        customColor: isDanger ? AyurezeTheme.remoteRed50 : null,
                        onPressed: () {
                          primaryAction?.call();
                          Navigator.pop(context);
                        },
                      ),
                    if (secondaryText != null) ...[
                      const SizedBox(height: 12),
                      OslerButton(
                        text: secondaryText!,
                        style: OslerButtonStyle.secondary,
                        onPressed: () {
                          secondaryAction?.call();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}