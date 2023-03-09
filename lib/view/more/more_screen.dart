import 'package:firstbank_cib/widgets/profile_card.dart';
import 'package:firstbank_cib/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/view_model.dart';

class MoreScreen extends GetView<AuthViewModel> {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileController = Get.find<ProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
        backgroundColor: AppColors.whiteColor2,
        title: const Text(
          "More",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(
                fullname: controller.getFullname(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "Added Features",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9E9C98),
                  ),
                ),
              ),
              const ProfileListTile(
                svgName: "assets/svg/account_management.svg",
                title: "Bill Payment",
              ),
              const ProfileListTile(
                svgName: "assets/svg/bulk_payment.svg",
                title: "Bulk Payment",
              ),
              const ProfileListTile(
                svgName: "assets/svg/account_management.svg",
                title: "Account Manager",
              ),
              const ProfileListTile(
                svgName: "assets/svg/collection.svg",
                title: "Collection",
              ),
              const ProfileListTile(
                svgName: "assets/svg/pension_module.svg",
                title: "Pension Module",
              ),
              const ProfileListTile(
                svgName: "assets/svg/cheque_service.svg",
                title: "Cheque Service",
              ),
              const ProfileListTile(
                svgName: "assets/svg/papss.svg",
                title: "PAPSS Service",
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "Added Features",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9E9C98),
                  ),
                ),
              ),
              const ProfileListTile(
                svgName: "assets/svg/beneficiary_list.svg",
                title: "Beneficiary List",
                svgColor: AppColors.yellowColor3,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9E9C98),
                  ),
                ),
              ),
              const ProfileListTile(
                svgName: "assets/svg/personal_settings.svg",
                title: "Peronal Settings",
                svgColor: AppColors.yellowColor3,
              ),
              const ProfileListTile(
                svgName: "assets/svg/security.svg",
                title: "Security",
                svgColor: AppColors.yellowColor3,
              ),
              const ProfileListTile(
                svgName: "assets/svg/approval_rules.svg",
                title: "Approval Rules",
                svgColor: AppColors.yellowColor3,
              ),
              GestureDetector(
                onTap: () => controller.logUserOut(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 24, bottom: 100),
                  decoration: BoxDecoration(
                    color: AppColors.failedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor2,
                        ),
                      ),
                      const Spacer(),
                      Utils.renderSVGImage(
                        assetName: "assets/svg/logout.svg",
                        height: 20.00,
                        width: 20.0,
                        color: AppColors.whiteColor2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
