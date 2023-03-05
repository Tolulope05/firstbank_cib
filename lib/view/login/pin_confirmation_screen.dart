import 'package:firstbank_cib/widgets/app_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/pin_confirmation_model.dart';

class PinConfirmationScreen extends GetView<PinConfirmationModel> {
  const PinConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppAppBar(),
          Text('PinConfirmationScreen'),
        ],
      ),
    );
  }
}
