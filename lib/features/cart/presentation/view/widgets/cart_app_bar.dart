import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true,
      snap: true,
       
      title: Text(
        "السلة",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 19.sp,
            ),
      ),
     
    );
  }
}
