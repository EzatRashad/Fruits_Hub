import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/default_image_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  final String? userName = "Ezat Rashad";
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DefaultImageWidget(Assets.assetsImagesProfile),
      title: Text(
        "صباح الخير !..",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.gray150, fontSize: 16),
      ),
      subtitle: Text(
        userName ?? "",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle),
        child: DefaultImageWidget(Assets.assetsImagesNotification),
      ),
    );
  }
}
