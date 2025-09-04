import 'package:flutter/material.dart';
 
class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.pushNamed(context, BestSellingView.routeName),
      child: Row(
        children: [
            Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
            ),
          ),
           Spacer(),
          Text(
            'المزيد',
            textAlign: TextAlign.center,
           style:  Theme.of(context).textTheme.titleSmall ,
          )
        ],
      ),
    );
  }
}
