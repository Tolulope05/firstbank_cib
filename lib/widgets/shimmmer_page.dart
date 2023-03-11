import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingShimmer() {
  return Shimmer.fromColors(
    // baseColor: Colors.grey[300]!,
    baseColor: AppColors.primaryColor.withOpacity(0.01),
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(height: 80),
        );
      },
    ),
  );
}
