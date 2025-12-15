import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_state.dart'; 
import 'package:fruit_hub/features/layout/presentation/view/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout';

  @override
  Widget build(BuildContext context) {
    return    BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          'تم إضافة العنصر بنجاح'.showSnackbar(context: context, isSuccess: true);
        }
        if (state is CartItemRemoved) {
          'تم حذف العنصر بنجاح'.showSnackbar(context: context, isSuccess: true);
        }
      },
      child: const LayoutViewBody(),
    );
  }
}
