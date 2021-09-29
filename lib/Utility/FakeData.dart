import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String fakeProfileImage = "https://cdn.pixabay.com/photo/2018/04/13/11/52/girl-3316342_960_720.jpg";
String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacinia finibus nisl id ultricies. Phasellus volutpat vulputate dolor a aliquet. Vivamus vehicula vel purus nec aliquet. Duis nec quam in justo ultrices efficitur eu ut nisl";

class FakeProduct{
  int id;
  String title;
  double price;
  String imgUrl;
  String discountDesc;
  String description;
  int discountType;
  double calorie;
  String extra;
  int amount;
  FakeProduct(this.id, this.title, this.price, this.imgUrl, this.discountDesc, this.discountType, this.calorie, this.description, this.amount, this.extra);
}

class FakeCategories{
  int id;
  String title;
  String imgUrl;
  FakeCategories(this.id, this.title, this.imgUrl);
}

class FakeAddress{
  int id;
  String title;
  String address;
  IconData iconData;
  FakeAddress(this.id, this.title, this.address, this.iconData);
}

class FakeReward{
  String title;
  String description;
  IconData iconData;
  FakeReward(this.title, this.description, this.iconData);
}

class FakeNotify{
  int type;
  String title;
  String description;
  String timeAgo;
  IconData iconData;
  FakeNotify(this.type, this.title, this.description, this.timeAgo, this.iconData);
}

class FakeOrder{
  OrderStatus orderStatus;
  int orderNumber;
  String date;
  List<FakeProduct> orderList;
  double price;
  FakeOrder(this.orderStatus, this.orderNumber, this.date, this.orderList, this.price);
}

class FakeCard{
  int id;
  String name;
  String cardNumber;
  String expiryDate;
  String cvv;
  String bankName;
  CardType type;
  FakeCard(this.id, this.name, this.type, this.bankName, this.cardNumber, this.expiryDate, this.cvv);
}

enum OrderStatus {PROCESSING, ONTHEWAY, DELIVERED}

class FakeData{
  static FakeCard card1 = FakeCard(0, "Sara Mohammad",CardType.masterCard, "HSBC", "1234 1234 1234 1234", "02/03","123");
  static FakeCard card2 = FakeCard(1, "Sara", CardType.visa, "BNP Paribas", "1111 1111 1111 1111", "04/05","321");

  static FakeOrder or1 = FakeOrder(OrderStatus.ONTHEWAY, 000123, "Today at 9:41 PM", fakeOrderOnTheWayList, 106.95);
  static FakeOrder or2 = FakeOrder(OrderStatus.DELIVERED, 000456, "10 Jan at 8:45 PM", fakeOrderDeliveredList, 78.95);
  static FakeOrder or3 = FakeOrder(OrderStatus.PROCESSING, 000789, "Today at 10:41 PM", fakeOrderProcessingList, 25.95);
  static FakeOrder or4 = FakeOrder(OrderStatus.ONTHEWAY, 000123, "Today at 9:41 PM", fakeOrderOnTheWayList2, 106.95);

  static FakeProduct p0 = FakeProduct(0, "Chicken questillas", 39, "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", "Flat 10% Off", 0, 800, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.",1, "No Sliced mushrooms - 0.00SR");
  static FakeProduct p1 = FakeProduct(1, "Baja California", 24, 'https://cdn.evrimagaci.org/MCXVrjNSeiWqPoDy0ZjJj7JmrNs=/825x0/filters:no_upscale()/evrimagaci.org%2Fpublic%2Fcontent_media%2Fcb04682a3deee709db3bc562d87f6fac.png', "Flat 10% Off", 0, 950, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.", 1, null);
  static FakeProduct p2 = FakeProduct(2, "Beef Quesso", 64, 'https://media-exp1.licdn.com/dms/image/C561BAQHsGu0_rbX2JQ/company-background_10000/0/1592190729149?e=2159024400&v=beta&t=duTt56eUqyz3JCxqdwPD1pZdKerPf6faMkkGR4Rd7UQ', "Buy 1 Get 1 Free", 1, 1200, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.", 1, null);
  static FakeProduct p3 = FakeProduct(3, "Chicken Quesdillas", 34, 'https://media-cdn.tripadvisor.com/media/photo-s/17/f5/39/f7/fooood-at-the-food-department.jpg', "Flat 10% Off", 0, 1080, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.", 1, null);
  static FakeProduct p4 = FakeProduct(4, "Shrimp Tacos", 53, 'https://tahog-street-food.developerkitchen.com/img/default-1.jpg', "Flat 10% Off", 0, 740, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.", 1, null);
  static FakeProduct p5 = FakeProduct(5, "Chicken", 75, 'https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg', "Flat 10% Off", 0, 820, "A natural flour tortilla with Fire-Grilled Chipotle chicken, fajita bell peppers & onions, 100% Natural Wisconsin Jack & Cheddar Cheeses, Guacamole, Chipotle Ranch Dressing, and Pico de Gallo Salsa on the side.", 1, null);

  static FakeCategories c0 = FakeCategories(0, "Side Dishes", "assets/images/c1.png");
  static FakeCategories c1 = FakeCategories(1, "Soup & Salads", "assets/images/c2.png");
  static FakeCategories c2 = FakeCategories(2, "Baja California", "assets/images/c3.png");
  static FakeCategories c3 = FakeCategories(3, "Main Dishes", "assets/images/c4.png");
  static FakeCategories c4 = FakeCategories(4, "Family Meals", "assets/images/c5.png");
  static FakeCategories c5 = FakeCategories(5, "Kids Meals", "assets/images/c6.png");

  static FakeAddress a1 = FakeAddress(0, "Home", "Street, City, ZIP code, Country", FontAwesomeIcons.home);
  static FakeAddress a2 = FakeAddress(1, "Office", "Street, City, ZIP code, Country", FontAwesomeIcons.briefcase);

  static FakeReward r1 = FakeReward("Refer a friend", "Get 30SR credit", FontAwesomeIcons.userFriends);
  static FakeReward r2 = FakeReward("Active Rewards", null, FontAwesomeIcons.star);

  static FakeNotify n1 = FakeNotify(0, "Free Delivery", "We have an existing offer you..", "2 min ago", FontAwesomeIcons.percentage);
  static FakeNotify n2 = FakeNotify(1, "Your Order Delivered", "We have an existing offer you..", "1 hour ago", FontAwesomeIcons.check);
  static FakeNotify n3 = FakeNotify(2, "Your Order On The Way", "We have an existing offer you..", "yesterday", FontAwesomeIcons.recycle);


  static List<FakeNotify> fakeNotifyList = [n1, n2, n3, n3, n2, n1, n1, n2];
  static List<FakeProduct> fakeProductList = [p0, p1, p2, p3, p4, p5,];
  static List<FakeProduct> fakeCartList = [];

  static List<FakeProduct> fakeOrderOnTheWayList = [p0, p2,];
  static List<FakeProduct> fakeOrderOnTheWayList2 = [p0, p2, p1, p5, p3, p4];
  static List<FakeProduct> fakeOrderDeliveredList = [p4, p5, p2];
  static List<FakeProduct> fakeOrderProcessingList = [p3,];

  static List<FakeOrder> fakeOrderList = [or1, or2, or3, or4];
  static List<FakeCategories> fakeCategories = [c0, c1, c2, c3, c4, c5, c0, c1, c2, c3, c4, c5];
  static List<FakeAddress> fakeAddressList = [a1, a2,a1, a2,a1, a2,a1, a2,];
  static List<FakeReward> fakeRewardList = [r1, r2,r1, r2,r1, r2,];
  static List<FakeCard> fakeCreditCardList = [card1, card2];

}

