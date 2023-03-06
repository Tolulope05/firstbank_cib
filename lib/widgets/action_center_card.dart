import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ActionCenterCard extends StatelessWidget {
  const ActionCenterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Receiver",
              style: TextStyle(
                color: AppColors.unselectedIconColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Layor Pan Enterprises  ',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '- 0245728039',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4B4B4B),
                    ),
                  )
                ],
              ),
            ),
            // Text(
            //   "",
            //   style: TextStyle(
            //     color: AppColors.unselectedIconColor,
            //     fontSize: 12,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
          ],
        ),
        Container(),
      ],
    );
  }
}
