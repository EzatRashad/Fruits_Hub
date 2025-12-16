import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/domain/entity/car_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item.dart';

class CarItemsList extends StatelessWidget {
  const CarItemsList({super.key, required this.carItems});

  final List<CartItemEntity> carItems;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => SliverList.separated(
          separatorBuilder: (context, index) => const CustomDivider(),
          itemCount: carItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CartItem(
                carItemEntity: carItems[index],
              ),
            );
          }),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFF1F1F5),
      height: 22,
    );
  }
}
