import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/utils.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0XFFDDDFDF),
            thickness: 1,
          ),
        ),
        10.pw,
        Text(
          "أو",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        10.pw,
        Expanded(
          child: Divider(
            color: Color(0XFFDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
