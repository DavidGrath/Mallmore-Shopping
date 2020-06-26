import '../models/Category.dart';
import '../models/Item.dart';
import '../models/User.dart';
import '../models/Review.dart';
import './Constants.dart';
import 'package:flutter/material.dart';

List<Category> CATEGORIES = [
  Category(
      title: "All", image: null, constant: CATEGORY_NONE, group: GROUP_NONE),
  Category(
      title: "Men Shirts",
      image: "images/flaticons/shirt-1.png",
      constant: CATEGORY_MEN_SHIRT,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Men Work Equipment",
      image: "images/flaticons/portfolio.png",
      constant: CATEGORY_WORK_EQUIPMENT,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Men T-Shirt",
      image: "images/flaticons/shirt-5.png",
      constant: CATEGORY_MEN_T_SHIRT,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Men Shoes",
      image: "images/flaticons/shoe.png",
      constant: CATEGORY_SHOES_MEN,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Pants",
      image: "images/flaticons/trousers.png",
      constant: CATEGORY_MEN_PANTS,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Men's Underwear",
      image: "images/flaticons/underwear.png",
      constant: CATEGORY_MEN_UNDERWEAR,
      group: GROUP_MEN_FASHION),
  Category(
      title: "Dresses",
      image: "images/flaticons/dress.png",
      constant: CATEGORY_DRESS,
      group: GROUP_WOMEN_FASHION),
  Category(
      title: "Women Shirts",
      image: "images/flaticons/shirt-4.png",
      constant: CATEGORY_WOMEN_SHIRT,
      group: GROUP_WOMEN_FASHION),
  Category(
      title: "Skirts",
      image: "images/flaticons/skirt.png",
      constant: CATEGORY_SKIRT,
      group: GROUP_WOMEN_FASHION),
  Category(
      title: "Handbags",
      image: "images/flaticons/handbag-2.png",
      constant: CATEGORY_HANDBAG,
      group: GROUP_WOMEN_FASHION),
  Category(
      title: "High Heels",
      image: "images/flaticons/high-heel.png",
      constant: CATEGORY_SHOES_WOMEN,
      group: GROUP_WOMEN_FASHION),
  Category(
      title: "Bikinis",
      image: "images/flaticons/lingerie.png",
      constant: CATEGORY_BIKINI,
      group: GROUP_WOMEN_FASHION)
];

//I hit refresh on https://randomuser.me/ a bunch of times. This is my form of credit
List<User> USERS = [
  User(fName: "Fred", lName: "Wood", username: "fredwood", profile: null),
  User(fName: "Steve", lName: "Frazier", username: "stevefraz", profile: null),
  User(fName: "Hailey", lName: "Bates", username: "haileybates", profile: null),
  User(fName: "Jennie", lName: "Gordon", username: "jengordon", profile: null),
  User(
      fName: "Brittany", lName: "Hudson", username: "brithudson", profile: null)
];

List<Review> REVIEWS = [
  Review(
      owner: USERS[0],
      rating: 3,
      content: "They could've done better, but I still like it"),
  Review(
      owner: USERS[3],
      rating: 5,
      content: "Lovely! Excellent Product!! Would want more from them"),
  Review(owner: USERS[0], rating: 4, content: "Nice"),
  Review(
      owner: USERS[1],
      rating: 3,
      content: "It's good, with a weak part, though"),
  Review(owner: USERS[4], rating: 5, content: "Great and nice")
];

List<Item> ITEMS = [
  Item(
    "Washing Machine",
    "",
    "\$",
    125,
    2.2,
    10,
    [CATEGORY_ELECTRONICS],
    'images/washing_machine.jpeg',
    REVIEWS,
  ),
  Item("Converse Shoes", "", "\$", 100, 4.5, 10, [CATEGORY_SHOES_MEN],
      'images/chucks_allstars_shoe_pixabay.png', REVIEWS),
  Item("DC Shoes", "", "\$", 105, 3.3, 55, [CATEGORY_SHOES_MEN],
      'images/shoes_pixabay_3.jpg'),
  Item("Leather Bag", "", "\$", 100, 3.9, 20, [CATEGORY_HANDBAG],
      'images/leather_case_pixabay.png', REVIEWS),
  Item("Fashion Handbag", "", "\$", 107, 4.1, 30, [CATEGORY_HANDBAG],
      'images/handbag_pixabay.jpg', REVIEWS),
  Item("Handbag", "", "\$", 25, 3.7, 150, [CATEGORY_HANDBAG],
      'images/handbag_pixabay_2.jpg', REVIEWS),
  Item("Office Handbag", "", "\$", 125, 4.4, 420, [CATEGORY_HANDBAG],
      'images/handbag_pixabay_3.jpg', REVIEWS),
];
