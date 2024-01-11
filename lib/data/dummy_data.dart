import 'package:flutter/material.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/model/meal.dart';

final availableCategories = [
  Category(id: "c1", title: "Italian", color: Colors.purple),
  Category(id: "c2", title: "Summer", color: Colors.red),
  Category(id: "c3", title: "French", color: Colors.green),
  Category(id: "c4", title: "Quick and easy", color: Colors.yellow),
  Category(id: "c5", title: "Hamburgers", color: Colors.blue),
  Category(id: "c6", title: "German", color: Colors.white),
  Category(id: "c7", title: "light and lovely", color: Colors.orange),
  Category(id: "c8", title: "Exotic", color: Colors.purple),
  Category(id: "c9", title: "Asian", color: Colors.red),
  Category(id: "c10", title: "Breakfast", color: Colors.green),
];

final dummyMeals = [
  Meal(
      id: "m1",
      categories: ["c1", "c2"],
      title: "Spanghetti with tomato sauce",
      imageUrl:
          "https://media.istockphoto.com/id/636746848/photo/spaghetti-bolognese.jpg?s=612x612&w=0&k=20&c=g6LWZ4oqjyOSP2f-qnsLyg7sEGydPHdILHjeAxgrOBY=",
      ingredients: [
        "4 tomatoes",
        "1 tablespoon of olive oil",
        "1 onion",
        "250 g spaghetti",
        "spices",
        "cheese (optional)"
      ],
      steps: [
        "cut the tomatoes and the onion into small pieces.",
        'Boil some water and add salt to it once it boils.',
        'Put the spaghetti into the boiling water amd they should be done',
        'in the mean timee, heatem up some olive iol and add the cut onion',
        "after two minutes add the tomato pieces, salt , pepper and your other ingredients ",
        'the sauce will be done once the spaghetti are.',
      ],
      duration: 20,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoFree: true,
      isVegan: true,
      isVegetarian: true),
  Meal(
      id: "m2",
      categories: ["c2"],
      title: "Toast Hawaii",
      imageUrl:
          "https://www.shutterstock.com/image-photo/toast-hawaii-pineapple-ham-cheese-260nw-783228880.jpg",
      ingredients: ["Bread", "Ham", "Pineapple", "Cheese", "Butter"],
      steps: [
        "Toast bread slices until golden brown.",
        "Spread butter on the toasted bread slices.",
        "Place ham and pineapple slices on top.",
        "Add grated cheese on top of each slice.",
        "Broil in the oven until the cheese is melted and bubbly.",
      ],
      duration: 15,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoFree: false,
      isVegan: false,
      isVegetarian: false),
  Meal(
      id: "m3",
      categories: ["c2", "c3"],
      title: "Classic Hamburger",
      imageUrl:
          "https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/4:3/w_3336,h_2502,c_limit/Smashburger-recipe-120219.jpg",
      ingredients: [
        "Ground beef",
        "Salt",
        "Pepper",
        "Buns",
        "Lettuce",
        "Tomato",
        "Onion",
        "Cheese",
        "Ketchup",
        "Mustard"
      ],
      steps: [
        "Divide ground beef into patties and season with salt and pepper.",
        "Cook patties on a grill or stovetop until desired doneness.",
        "Toast the buns on the grill or in a toaster.",
        "Assemble the burgers with lettuce, tomato, onion, cheese, ketchup, and mustard.",
      ],
      duration: 30,
      complexity: Complexity.simple,
      affordability: Affordability.pricey,
      isGlutenFree: false,
      isLactoFree: true,
      isVegan: false,
      isVegetarian: false),
  Meal(
      id: "m4",
      categories: ["c4"],
      title: "Wiener Schnitzel",
      imageUrl:
          "https://www.thespruceeats.com/thmb/BS5BdyQsGh5qQyRiuZMannmcxoY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-wiener-schnitzel-recipe-1447089-hero-02-18827aac4cbd4aec926350d4f9778e70.jpg",
      ingredients: ["Veal cutlets", "Salt", "Pepper", "All-purpose flour", "Eggs", "Breadcrumbs", "Vegetable oil"],
      steps: [
      "Season veal cutlets with salt and pepper.",
      "Dredge each cutlet in flour, dip in beaten eggs, and coat with breadcrumbs.",
      "Heat vegetable oil in a pan and fry the cutlets until golden brown on both sides.",
      "Serve hot with your favorite side dishes.",
    ],
      duration: 30,
      complexity: Complexity.challenging,
      affordability: Affordability.luxurious,
      isGlutenFree: false,
      isLactoFree: true,
      isVegan: false,
      isVegetarian: false)
];
