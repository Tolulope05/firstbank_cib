import 'package:firstbank_cib/utils/utils.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:firstbank_cib/widgets/initiate_payment_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../constants/colors.dart';
import '../../model/model.dart';
import '../../view_model/transfer_screen_view_model.dart';
import '../../widgets/text_field_input.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Source account",
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 12,
                    ),
                  ),
                ),
                DropdownSearch<BankAccount>(
                  asyncItems: (String filter) => controller.getSourceBankList(),
                  itemAsString: (BankAccount u) =>
                      "${u.accountName!} - ${u.accountNumber!}",
                  onChanged: (BankAccount? data) =>
                      controller.setSourceAccount(data!),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    baseStyle: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 14,
                    ),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Select Account",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Account to credit",
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 12,
                    ),
                  ),
                ),
                DropdownSearch<BankAccount>(
                  asyncItems: (String filter) =>
                      controller.getBeneficiaryBankList(),
                  itemAsString: (BankAccount u) =>
                      "${u.accountName!} - ${u.accountNumber!}",
                  onChanged: (BankAccount? data) =>
                      controller.setBeneficiaryAccount(data!),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    baseStyle: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: 14,
                    ),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "012345678",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
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
              headerText: 'Payment memo',
              hintText: '',
            ),
          ),
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
                  builder: (context) => const InitiatePaymentDialogue(),
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
            child: AppTextFieldInput(
              controller: controller.firstBankSourceAccountController,
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
                    controller: controller.firstBankBeneficialAccountController,
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
              controller: controller.firstBankBeneficialAccountnameController,
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
              controller: controller.firstBankAmountAccountController,
              headerText: 'Amount',
              hintText: 'NGN',
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
              headerText: 'Payment memo',
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
              controller: controller.firstBankPaymentTypeController,
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
              controller: controller.firstBankPaymentTypeController,
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
                showDialog(
                  context: context,
                  builder: (context) => const InitiatePaymentDialogue(),
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
              headerText: 'Payment memo',
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
                showDialog(
                  context: context,
                  builder: (context) => const InitiatePaymentDialogue(),
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

class InternationalBankTabview extends GetView<TransferScreenViewModel> {
  const InternationalBankTabview({
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
              headerText: 'Payment memo',
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
                showDialog(
                  context: context,
                  builder: (context) => const InitiatePaymentDialogue(),
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
