import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling/presentation/view/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = "best_selling";

  @override
  Widget build(BuildContext context) {
    return BestSellingViewBody();
  }
}
