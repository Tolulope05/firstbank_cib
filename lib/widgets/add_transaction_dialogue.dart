import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../view_model/view_model.dart';

class AddTransactionDialogue extends StatelessWidget {
  const AddTransactionDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileController = Get.find<ProfileViewModel>();
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        // color: AppColors.scaffoldBgColor,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: Row(
                children: [
                  const Text(
                    "Select Orgnization",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close),
                  )
                ],
              ),
            ),

            organizationTypewidget(
              id: 1,
              name: "Abuja Limited",
              // isSelected: false,
            ),
            organizationTypewidget(
              id: 2,
              name: "Lagos Limited",
              // isSelected: true,
            ),
            organizationTypewidget(
              id: 3,
              name: "Rivers Limited",
              // isSelected: false,
            ),
            // FutureBuilder(
            //     future: profileController.fetchSubsidiaries(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         SpinKitWave(
            //           color: AppColors.primaryColor,
            //         );
            //       }
            //       return Obx(
            //         () => ListView.builder(
            //           itemBuilder: (context, index) {
            //             organizationTypewidget(
            //               id: snapshot.data![index].subsidiaryId,
            //               name: snapshot.data![index].subsidiaryName,
            //               isSelected: true,
            //               // isSelected:
            //               //     profileController.subsidiaries.subsidiaryId ==
            //               //         profileController
            //               //             .subsidiariesList[index].subsidiaryId,
            //             );
            //           },
            //           itemCount: snapshot.data!.length,
            //           shrinkWrap: true,
            //           physics: const NeverScrollableScrollPhysics(),
            //         ),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}

Widget organizationTypewidget({
  required String? name,
  required int? id,
  // required bool isSelected,
}) {
  ProfileViewModel profileController = Get.find<ProfileViewModel>();
  return InkWell(
    onTap: () => profileController.fetchSubsidiaryId(id!),
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor2,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "Organization Name",
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Organization ID: $id",
                style: const TextStyle(
                  color: AppColors.unselectedIconColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          // isSelected
          //     ? const Center(
          //         child: Icon(
          //           Icons.check_outlined,
          //           color: AppColors.yellowColor3,
          //         ),
          //       )
          //     : SizedBox.shrink(),
        ],
      ),
    ),
  );
}
