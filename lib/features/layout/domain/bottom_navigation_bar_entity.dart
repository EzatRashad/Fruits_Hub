import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesHomeBold,
          inActiveImage: Assets.assetsImagesHomeOutLine,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesProductsBold,
          inActiveImage: Assets.assetsImagesProductsOutLine,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesShoppingCartBold,
          inActiveImage: Assets.assetsImagesShoppingCartOutLine,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesUserBold,
          inActiveImage: Assets.assetsImagesUserOutLine,
          name: 'حسابي'),
    ];
