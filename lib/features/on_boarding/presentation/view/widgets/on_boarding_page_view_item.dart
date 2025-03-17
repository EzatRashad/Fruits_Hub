import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "تخط",
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
                SizedBox(
                  height: 10,
                ),
                title,
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
