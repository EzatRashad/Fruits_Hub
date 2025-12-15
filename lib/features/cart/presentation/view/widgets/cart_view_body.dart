import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_header.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_cart_button.dart';

import 'cart_app_bar.dart';
import 'cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CartAppBar(),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartHeader(),
                      34.ph,
                    ],
                  ),
                ),
              ),
              CarItemsList(
                    carItems: context.read<CartCubit>().cartEntity.cartItems,
                  ),
              // constCartItems(),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            left: 16,
            right: 16,
            child: CustomCartButton(),
          )
        ],
      ),
    );
  }
}
