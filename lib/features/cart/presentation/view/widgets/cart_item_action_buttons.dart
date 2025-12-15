import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/cart/domain/entity/car_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit/cart_item_state.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
       builder: (context, state) => Row(
        children: [
          CartItemActionButton(
            iconColor: Colors.white,
            icon: Icons.add,
            color: AppColors.primaryColor,
            onPressed: () {
              cartItemEntity.increasQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${cartItemEntity.quanitty}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondryColor,
                  ),
            ),
          ),
          CartItemActionButton(
            iconColor: Colors.grey,
            icon: Icons.remove,
            color: const Color(0xFFF3F5F7),
            onPressed: () {
              if (cartItemEntity.quanitty > 0 && cartItemEntity.quanitty != 1) {
                cartItemEntity.decreasQuantity();
              }
              if (cartItemEntity.quanitty == 1) {
                context.read<CartCubit>().deleteCarItem(cartItemEntity);
              }

              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
          ),
          Spacer(),
          Text(
            '${cartItemEntity.calculateTotalPrice()} جنيه',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondryColor,
                ),
          )
        ],
      ),
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.iconColor});

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(
          2,
        ),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
