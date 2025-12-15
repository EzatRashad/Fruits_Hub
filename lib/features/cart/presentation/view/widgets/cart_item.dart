import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart' show AppColors;
import 'package:fruit_hub/core/widgets/default_image_widget.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../domain/entity/car_item_entity.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.carItemEntity});

 final CartItemEntity carItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: DefaultImageWidget(
              fit: BoxFit.cover,
              carItemEntity.productEntity.imageUrl??"https://images.pexels.com/photos/46174/strawberries-berries-fruit-freshness-46174.jpeg",
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      carItemEntity.productEntity.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCarItem(carItemEntity);
                      },
                      child: SvgPicture.asset(
                        Assets.assetsImagesTrash,
                      ),
                    )
                  ],
                ),
                Text(
                  
                  '${carItemEntity.calculateTotalWeight()} كم',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondryColor,
                      ),
                ),
                CartItemActionButtons(
                  cartItemEntity: carItemEntity,
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
