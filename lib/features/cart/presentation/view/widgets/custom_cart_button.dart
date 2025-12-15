import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit/cart_item_state.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) => CustomButtons(
          onPressed: () {},
          text:
              "الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه"),
    );
  }
}
