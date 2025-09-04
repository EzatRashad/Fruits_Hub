import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}