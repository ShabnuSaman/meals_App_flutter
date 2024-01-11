import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';


import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/category.dart';
import 'package:meals_app/screen/filter.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';



const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegtarian: false,
  Filter.vegan: false
};

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExsting = _favoriteMeals.contains(meal);
    if (isExsting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("Remove from your favorite ");
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("Add to your favorite ");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifiers) async {
    Navigator.of(context).pop();
    if (identifiers == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilters,)));
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

   
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegtarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals
    );
    var activePageTitile = "Catogries";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitile = "Favorites";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitile),
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.set_meal), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: "Favorites")
            ]));
  }
}
