import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ApprovalchildPosition extends StatelessWidget {
  const ApprovalchildPosition({
    super.key,
    required this.usename,
    required this.userStatus,
    required this.userPosition,
    this.time,
    required this.statusColor,
  });
  final String usename;
  final String userStatus;
  final String userPosition;
  final String? time;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  usename,
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userStatus,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userPosition,
                style: const TextStyle(
                  color: AppColors.unselectedIconColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              time == null
                  ? const SizedBox.shrink()
                  : Text(
                      time ?? "",
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
