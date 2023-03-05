import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../view_model/pin_confirmation_model.dart';

class FilledRoundedPinPut extends GetView<PinConfirmationModel> {
  const FilledRoundedPinPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    // const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        // color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffDCDCDC)),
      ),
    );
    return SizedBox(
      height: 68,
      child: Obx(
        () => Pinput(
          length: length,
          controller: controller.roundedPinController.value,
          focusNode: controller.roundedPinFocusNode.value,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) {
            if (pin == controller.passKey) {
              controller.navigateToHomePage();
            } else {
              controller.roundedPinshowError.value = true;
              // setState(() => showError = pin != '5555');
            }
          },
          focusedPinTheme: defaultPinTheme.copyWith(
            height: 68,
            width: 64,
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: borderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: errorColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
