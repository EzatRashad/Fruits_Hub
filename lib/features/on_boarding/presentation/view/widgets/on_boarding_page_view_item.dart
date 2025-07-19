import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/services/shared_pref_service/shared_preferences_service.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';

import '../../../../../core/utils/constants.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.backImage,
      required this.visible});
  final Widget title;
  final String subTitle;
  final String image;
  final String backImage;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    backImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        SharedPreferencesService.setBool(onBordSkip, true);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginView.routeName,
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        "تخط",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                20.ph,
                title,
                24.ph,
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
