import 'package:flutter/material.dart';
import 'package:doctro/widgets/osler_tag.dart';

enum AppointmentStatus { pending, approved, complete, cancel, waiting }

class OslerStatusBadge extends StatelessWidget {
  final AppointmentStatus status;
  final String? customLabel;

  const OslerStatusBadge({
    super.key,
    required this.status,
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    return OslerTag(
      label: customLabel ?? _getLabel(),
      style: _getStyle(),
      icon: _getIcon(),
    );
  }

  String _getLabel() {
    switch (status) {
      case AppointmentStatus.pending:
        return "Pending";
      case AppointmentStatus.approved:
        return "Approved";
      case AppointmentStatus.complete:
        return "Completed";
      case AppointmentStatus.cancel:
        return "Cancelled";
      case AppointmentStatus.waiting:
        return "Waiting";
    }
  }

  OslerTagStyle _getStyle() {
    switch (status) {
      case AppointmentStatus.pending:
        return OslerTagStyle.warning;
      case AppointmentStatus.approved:
        return OslerTagStyle.info;
      case AppointmentStatus.complete:
        return OslerTagStyle.success;
      case AppointmentStatus.cancel:
        return OslerTagStyle.danger;
      case AppointmentStatus.waiting:
        return OslerTagStyle.info;
    }
  }

  IconData _getIcon() {
    switch (status) {
      case AppointmentStatus.pending:
        return Icons.schedule;
      case AppointmentStatus.approved:
        return Icons.check_circle_outline;
      case AppointmentStatus.complete:
        return Icons.check_circle;
      case AppointmentStatus.cancel:
        return Icons.cancel_outlined;
      case AppointmentStatus.waiting:
        return Icons.hourglass_top;
    }
  }

  static AppointmentStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'approved':
      case 'approve':
        return AppointmentStatus.approved;
      case 'complete':
      case 'completed':
        return AppointmentStatus.complete;
      case 'cancel':
      case 'cancelled':
        return AppointmentStatus.cancel;
      case 'waiting':
        return AppointmentStatus.waiting;
      default:
        return AppointmentStatus.pending;
    }
  }
}