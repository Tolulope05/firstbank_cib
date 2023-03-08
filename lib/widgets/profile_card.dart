import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/utils.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    this.fullname,
  }) : super(key: key);
  final String? fullname;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteColor2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xffAFC2DB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "LS",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "The Sharply Africa",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fullname ?? "No Name",
                        style: const TextStyle(
                          color: AppColors.unselectedIconColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Organization ID:933787438",
              style: TextStyle(
                color: AppColors.unselectedIconColor,
                fontSize: 14,
              ),
            ),
          ),
          AppButton(
            onTap: () {},
            bgColor: Colors.transparent,
            borderColor: AppColors.primaryColor,
            textColor: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.renderSVGImage(assetName: "assets/svg/organization.svg"),
                const SizedBox(width: 8),
                const Text(
                  "Add another transaction",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
