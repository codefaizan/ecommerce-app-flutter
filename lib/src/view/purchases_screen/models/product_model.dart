import '../../../utils/base/resources/resources.dart';

class Product {
  late  String image;
  String title;
  String location;
  String description;
  String price;
  bool isOwner;
  bool isFavourite;
  String category;
  bool isPriceFixed;
  Product({
    required this.title,
    required this.location,
    required this.isOwner,
    required this.image,
    required this.isFavourite,
    required this.description,
    required this.price,
    required this.category,
    required this.isPriceFixed
  });
}
List<Product> demoProductsList =[
  Product(title: "HP Pavilion", location: "Chicago - wt1", isOwner: false, image: 'assets/images/demo_img_2.png', isFavourite: false, description: R.dummyData.bulletText, price: "\$105", category: 'Electronics', isPriceFixed: true),
  Product(title: "EA-Music Piano black Mount 552", location: "Chicago - wt1", isOwner: false, image: 'assets/images/demo_img_product.png', isFavourite: false, description: R.dummyData.bulletText, price: "\$105", category: 'Furniture', isPriceFixed: false),
  Product(title: "EA-Music Piano black Mount 552", location: "Chicago - wt1", isOwner: false, image: 'assets/images/demo_img_product.png', isFavourite: false, description: R.dummyData.bulletText, price: "\$105", category: 'Men Fashion', isPriceFixed: true),
  Product(title: "EA-Music Piano black Mount 552", location: "Chicago - wt1", isOwner: false, image: 'assets/images/demo_img_product.png', isFavourite: false, description: R.dummyData.bulletText, price: "\$105", category: 'Electronics', isPriceFixed: false),
];