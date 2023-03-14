import 'package:firstbank_cib/utils/utils.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../view_model/transfer_screen_view_model.dart';
import '../../widgets/select_beneficiary_dialogue.dart';
import '../../widgets/select_payment_account_dialogue.dart';
import '../../widgets/text_field_input.dart';
import '../../widgets/view_payment_dialogue.dart';

class TransfersScreen extends StatefulWidget {
  const TransfersScreen({Key? key}) : super(key: key);

  @override
  State<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    // _tabController.animateTo(1);
  }

  final controller = Get.find<TransferScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor2,
        title: const Text(
          "Transfer",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColors.whiteColor2,
            padding: const EdgeInsets.only(bottom: 2),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: AppColors.yellowColor3,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
              unselectedLabelColor: AppColors.unselectedIconColor,
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(
                  text: "Own Account",
                ),
                Tab(
                  text: "To First Bank",
                ),
                Tab(
                  text: "To other Bank",
                ),
                Tab(
                  text: "International",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                OwnAccountTabView(),
                FirstBankTabview(),
                OtherBankTabview(),
                InternationalBankTabview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OwnAccountTabView extends GetView<TransferScreenViewModel> {
  const OwnAccountTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransferScreenViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  Get.dialog(
                    const SelectPaymentAccountDialogue(
                      selector: 1,
                    ),
                  );
                },
                child: AppTextFieldInput(
                  controller: controller.ownBankSourceAccountController,
                  headerText: "Source Account",
                  hintText: controller.selectedSourceAccounthintText,
                  readOnly: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.dialog(const SelectPaymentAccountDialogue(
                        selector: 1,
                      ));
                    },
                    child: const RotatedBox(
                      quarterTurns: 45,
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  Get.dialog(
                    const SelectPaymentAccountDialogue(
                      selector: 2,
                    ),
                  );
                },
                child: AppTextFieldInput(
                  controller: controller.ownBankBeneficiaryAccountController,
                  headerText: "Account to credit",
                  hintText: controller.selectedBeneficiaryAccounthintText,
                  readOnly: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.dialog(
                        const SelectPaymentAccountDialogue(
                          selector: 2,
                        ),
                      );
                    },
                    child: const RotatedBox(
                      quarterTurns: 45,
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.beneficialAmountController,
              headerText: 'Amount',
              hintText: 'NGN',
              isNumberonly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.ownAccountPaymentMemoController,
              headerText: 'Payment Description',
              hintText: '',
            ),
          ),
          //START
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 24,
          //     right: 18.0,
          //     left: 18.0,
          //   ),
          //   child: Obx(
          //     () => Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         const Padding(
          //           padding: EdgeInsets.only(bottom: 8.0),
          //           child: Text(
          //             "Payment Type",
          //             style: TextStyle(
          //               color: AppColors.textColor2,
          //               fontSize: 12,
          //             ),
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 0,
          //                   groupValue: controller.ownselectedPaymentType,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                       (states) => AppColors.yellowColor3),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentType(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'Salary Payment',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 2,
          //                   groupValue: controller.ownselectedPaymentType,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                     (states) => AppColors.yellowColor3,
          //                   ),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentType(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'Vendor Payment',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Radio(
          //               value: 3,
          //               groupValue: controller.ownselectedPaymentType,
          //               fillColor: MaterialStateColor.resolveWith(
          //                 (states) => AppColors.yellowColor3,
          //               ),
          //               onChanged: (value) {
          //                 controller.setOwnPaymentType(value!);
          //               },
          //             ),
          //             const Text(
          //               'Other Payment',
          //               style: TextStyle(
          //                 color: AppColors.textColor2,
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 24,
          //     right: 18.0,
          //     left: 18.0,
          //   ),
          //   child: Obx(
          //     () => Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         const Padding(
          //           padding: EdgeInsets.only(bottom: 8.0),
          //           child: Text(
          //             "Payment method",
          //             style: TextStyle(
          //               color: AppColors.textColor2,
          //               fontSize: 12,
          //             ),
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 0,
          //                   groupValue: controller.ownselectedPaymentTMethod,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                       (states) => AppColors.yellowColor3),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentMethod(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'Instant Payment',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 1,
          //                   groupValue: controller.ownselectedPaymentTMethod,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                     (states) => AppColors.yellowColor3,
          //                   ),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentMethod(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'PAPPS',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 2,
          //                   groupValue: controller.ownselectedPaymentTMethod,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                       (states) => AppColors.yellowColor3),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentMethod(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'BULK NIP',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Radio(
          //                   value: 3,
          //                   groupValue: controller.ownselectedPaymentTMethod,
          //                   fillColor: MaterialStateColor.resolveWith(
          //                     (states) => AppColors.yellowColor3,
          //                   ),
          //                   onChanged: (value) {
          //                     controller.setOwnPaymentMethod(value!);
          //                   },
          //                 ),
          //                 const Text(
          //                   'RTGS',
          //                   style: TextStyle(
          //                     color: AppColors.textColor2,
          //                     fontSize: 12,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // END
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => AppTextFieldInput(
                controller: controller.otherBankPaymentTypeController,
                headerText: 'Value Date',
                hintText: controller.ownvalueDate,
                suffixIcon: const Icon(Icons.calendar_month_rounded),
                readOnly: true,
                onTap: () => controller.showDatePickerDialog(),
              ),
            ),
          ),
          // END
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure you want to pay?'),
                    content: const Text('This process cannot be reversed.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.failedColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => ViewPaymentDialogue(
                              onTap: () =>
                                  controller.initiateOwnAccountPayment(),
                            ),
                          );
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              text: 'Initiate Payment',
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class FirstBankTabview extends GetView<TransferScreenViewModel> {
  const FirstBankTabview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransferScreenViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => AppTextFieldInput(
                controller: controller.firstBankSourceAccountController,
                headerText: 'Source Account',
                hintText: controller.selectedSourceAccounthintTextFB,
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    Get.dialog(
                      const SelectPaymentAccountDialogue(
                        selector: 3,
                      ),
                    );
                  },
                  child: const RotatedBox(
                    quarterTurns: 45,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Obx(
                    () => AppTextFieldInput(
                      controller:
                          controller.firstBankBeneficialAccountController,
                      headerText: 'Account Number',
                      hintText: controller.selectedBeneficiaryAccountnum,
                      readOnly: true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Get.dialog(
                            const SelectBeneficiaryDialogue(
                              selector: 3,
                            ),
                          );
                        },
                        child: const RotatedBox(
                          quarterTurns: 45,
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(
                      const SelectBeneficiaryDialogue(
                        selector: 3,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, top: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDeep,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 58,
                    width: 55,
                    child: Utils.renderSVGImage(
                      assetName: "assets/svg/three_head.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => AppTextFieldInput(
                readOnly: true,
                controller: controller.firstBankBeneficialAccountnameController,
                headerText: 'Accout Name',
                hintText: controller.selectedBeneficiaryName,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.firstBankAmountAccountController,
              headerText: 'Amount',
              hintText: 'NGN',
              isNumberonly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.firstBankPaymentMemoController,
              headerText: 'Payment Description',
              hintText: '',
            ),
          ),
          // START
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 24,
          //     right: 16.0,
          //     left: 16.0,
          //   ),
          //   child: AppTextFieldInput(
          //     controller: controller.firstBankPaymentTypeController,
          //     headerText: 'Payment Type',
          //     hintText: 'Select option',
          //     suffixIcon: const RotatedBox(
          //       quarterTurns: 45,
          //       child: Icon(Icons.chevron_right),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 24,
          //     right: 18.0,
          //     left: 18.0,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       const Padding(
          //         padding: EdgeInsets.only(bottom: 8.0),
          //         child: Text(
          //           "Payment method",
          //           style: TextStyle(
          //             color: AppColors.textColor2,
          //             fontSize: 12,
          //           ),
          //         ),
          //       ),
          //       Row(
          //         children: [
          //           Radio(
          //             value: 1,
          //             groupValue: 2,
          //             fillColor: MaterialStateColor.resolveWith(
          //                 (states) => AppColors.unselectedIconColor),
          //             onChanged: (value) {},
          //           ),
          //           const Text(
          //             'Instant Payment',
          //             style: TextStyle(
          //               color: AppColors.textColor2,
          //               fontSize: 12,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Radio(
          //             value: 2,
          //             groupValue: 2,
          //             fillColor: MaterialStateColor.resolveWith(
          //               (states) => AppColors.yellowColor3,
          //             ),
          //             onChanged: (value) {},
          //           ),
          //           const Text(
          //             'RTGS',
          //             style: TextStyle(
          //               color: AppColors.textColor2,
          //               fontSize: 12,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // END
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 16.0,
              left: 16.0,
            ),
            child: Obx(
              () => AppTextFieldInput(
                controller: controller.firstBankPaymentTypeController,
                headerText: 'Value Date',
                hintText: controller.ownvalueDateFB,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.showDatePickerDialogFB();
                  },
                  child: const Icon(Icons.calendar_month_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Save details as beneficiary ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Obx(
                  () => Switch(
                    value: controller.saveBeneficiary,
                    onChanged: (value) {
                      controller.saveBeneficiaryToggle();
                      print(controller.saveBeneficiary);
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 24,
          //     right: 16.0,
          //     left: 16.0,
          //   ),
          //   child: AppButton(
          //     onTap: () {},
          //     bgColor: Colors.transparent,
          //     borderColor: AppColors.primaryColor,
          //     textColor: AppColors.primaryColor,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: const [
          //         Icon(
          //           Icons.add_to_photos_rounded,
          //           color: AppColors.primaryColor,
          //         ),
          //         SizedBox(width: 8),
          //         Text(
          //           "Add another transaction",
          //           style: TextStyle(
          //             color: AppColors.primaryColor,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
              bottom: 100,
            ),
            child: AppButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure you want to pay?'),
                    content: const Text('This process cannot be reversed.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.failedColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => ViewPaymentDialogue(
                              onTap: () => controller
                                  .initiateToFirstBankAccountPayment(),
                            ),
                          );
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              text: 'Initiate Payment',
            ),
          ),
        ],
      ),
    );
  }
}

class OtherBankTabview extends GetView<TransferScreenViewModel> {
  const OtherBankTabview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransferScreenViewModel>();
    return const Center(
      child: Text("Other Bank Tab"),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankSourceAccountController,
              headerText: 'Source Account',
              hintText: 'Select Account',
              suffixIcon: const RotatedBox(
                quarterTurns: 45,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: AppTextFieldInput(
                    controller: controller.otherBankBeneficialAccountController,
                    headerText: 'Account Number',
                    hintText: '0123456789',
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, top: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDeep,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 58,
                    width: 55,
                    child: Utils.renderSVGImage(
                      assetName: "assets/svg/three_head.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankBeneficialAccountnameController,
              headerText: 'Accout name',
              hintText: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankAmountAccountController,
              headerText: 'Amount',
              hintText: 'NGN',
              isNumberonly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankPaymentMemoController,
              headerText: 'Payment Description',
              hintText: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankPaymentTypeController,
              headerText: 'Payment Type',
              hintText: 'Select option',
              suffixIcon: const RotatedBox(
                quarterTurns: 45,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 18.0,
              left: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Payment method",
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 2,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.unselectedIconColor),
                      onChanged: (value) {},
                    ),
                    const Text(
                      'Instant Payment',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: 2,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.yellowColor3,
                      ),
                      onChanged: (value) {},
                    ),
                    const Text(
                      'RTGS',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.otherBankPaymentTypeController,
              headerText: 'Value Date',
              hintText: '24/02/2023',
              suffixIcon: const Icon(Icons.calendar_month_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppButton(
              onTap: () {},
              bgColor: Colors.transparent,
              borderColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_to_photos_rounded,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add another transaction",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
              bottom: 100,
            ),
            child: AppButton(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => const InitiatePaymentDialogue(),
                // );
              },
              text: 'Initiate Payment',
            ),
          ),
        ],
      ),
    );
  }
}

class InternationalBankTabview extends GetView<TransferScreenViewModel> {
  const InternationalBankTabview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransferScreenViewModel>();
    return const Center(
      child: Text("International Bank Tab"),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.internationalBankSourceAccountController,
              headerText: 'Source Account',
              hintText: 'Select Account',
              suffixIcon: const RotatedBox(
                quarterTurns: 45,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: AppTextFieldInput(
                    controller:
                        controller.internationalBankBeneficialAccountController,
                    headerText: 'Account Number',
                    hintText: '0123456789',
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, top: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDeep,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 58,
                    width: 55,
                    child: Utils.renderSVGImage(
                      assetName: "assets/svg/three_head.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller:
                  controller.internationalBankBeneficialAccountnameController,
              headerText: 'Accout name',
              hintText: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.internationalBankAmountAccountController,
              headerText: 'Amount',
              hintText: 'NGN',
              isNumberonly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.internationalBankPaymentMemoController,
              headerText: 'Payment Description',
              hintText: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.internationalBankPaymentTypeController,
              headerText: 'Payment Type',
              hintText: 'Select option',
              suffixIcon: const RotatedBox(
                quarterTurns: 45,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 18.0,
              left: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Payment method",
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 2,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.unselectedIconColor),
                      onChanged: (value) {},
                    ),
                    const Text(
                      'Instant Payment',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: 2,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.yellowColor3,
                      ),
                      onChanged: (value) {},
                    ),
                    const Text(
                      'RTGS',
                      style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 16.0,
              left: 16.0,
            ),
            child: AppTextFieldInput(
              controller: controller.internationalBankPaymentTypeController,
              headerText: 'Value Date',
              hintText: '24/02/2023',
              suffixIcon: const Icon(Icons.calendar_month_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
            ),
            child: AppButton(
              onTap: () {},
              bgColor: Colors.transparent,
              borderColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_to_photos_rounded,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add another transaction",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16.0,
              left: 16.0,
              bottom: 100,
            ),
            child: AppButton(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => const InitiatePaymentDialogue(),
                // );
              },
              text: 'Initiate Payment',
            ),
          ),
        ],
      ),
    );
  }
}
