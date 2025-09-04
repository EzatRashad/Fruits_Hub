import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:svg_flutter/svg_flutter.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32.w;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: SvgPicture.asset(
                  Assets.assetsImagesPageViewItem2Image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.assetsImagesFeaturedBack),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 33.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.ph,
                      Text(
                        'عروض العيد',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25%',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                      11.ph,
                      FeaturedItemButton(
                        
                        onPressed: () {},
                       ),
                      29.ph,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
