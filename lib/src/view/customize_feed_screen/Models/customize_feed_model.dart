import '../../../utils/base/resources/resources.dart';

class CustomizeFeedItem{
  String title;
  String prefixImage;
  bool isSelected;

  CustomizeFeedItem({
    required this.title,
    required this.prefixImage,
    required this.isSelected
});
}

List<CustomizeFeedItem> categoriesList = [
  CustomizeFeedItem(title: R.texts.electronics, prefixImage: R.images.laptopIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.furniture, prefixImage: R.images.sofaIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.babyProducts, prefixImage: R.images.feederIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.healthAndBeauty, prefixImage: R.images.personalCareIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.womenFashion, prefixImage: R.images.womenFashionIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.menFashion, prefixImage: R.images.menFashionIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.petAccessories, prefixImage: R.images.dogFoodIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.sportsAndLeisure, prefixImage: R.images.sportsIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.plantsAndPots, prefixImage: R.images.plantIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.vehicles, prefixImage: R.images.carIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.booksAndMusic, prefixImage: R.images.bookIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.musicalInstruments, prefixImage: R.images.guitarIcon, isSelected: false),
  CustomizeFeedItem(title: R.texts.others, prefixImage: R.images.othersIcon, isSelected: false),
];