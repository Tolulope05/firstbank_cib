import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:firstbank_cib/widgets/initiate_payment_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
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
              children: [
                const OwnAccountTabView(),
                Container(
                  child: const Text("Test 1"),
                ),
                Container(
                  child: const Text("Test 1"),
                ),
                Container(
                  child: const Text("Test 1"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OwnAccountTabView extends StatelessWidget {
  const OwnAccountTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransferScreenViewModel>();
    return SingleChildScrollView(
      child: Flexible(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                right: 16.0,
                left: 16.0,
              ),
              child: AppTextFieldInput(
                controller: controller.sourceAccountController,
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
              child: AppTextFieldInput(
                controller: controller.beneficialAccountController,
                headerText: 'Account to credit',
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
              child: AppTextFieldInput(
                controller: controller.beneficialAccountController,
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
                controller: controller.beneficialAccountController,
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
                )),
          ],
        ),
      ),
    );
  }
}
