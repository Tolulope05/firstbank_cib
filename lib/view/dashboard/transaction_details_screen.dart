import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/actioncenter_view_model.dart';

class TransactionDetailsScreen extends GetView<ActionCenterModel> {
  const TransactionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(),
    );
  }
}
