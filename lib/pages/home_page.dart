import 'package:burger_shop/models/component_categories.dart';
import 'package:burger_shop/models/menu_card.dart';
import 'package:burger_shop/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:burger_shop/models/card_order.dart';
import 'package:burger_shop/utils/app_theme.dart';
import 'package:burger_shop/pages/counter_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';
import '../pages/cart_page.dart';
import '../widgets/cart_badge.dart';

class HomePage extends ConsumerStatefulWidget {
  final VoidCallback? onToggleTheme;

  const HomePage({super.key, this.onToggleTheme});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<String> categories = ["Burger", "Pizza", "Salad", "Dessert", "Drinks"];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // выравнивание по левому краю
          children: [
            Text('FoodGo', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Order your fovorite food',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
        actions: [
          const CartBadge(),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/photo.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.18),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        hintText: 'Search for food',
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6, // это размытие тени
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tune, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ComponentCategories(name: 'All'),
                ComponentCategories(name: 'Burger'),
                ComponentCategories(name: 'Pizza'),
                ComponentCategories(name: 'Snacks'),
              ],
            ),
            SizedBox(height: 35),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, String>> products = [
                    {
                      'name': 'Cheeseburger',
                      'image': 'assets/images/burger1.png',
                      'price': '299₽',
                      'description': 'Сочная говядина с сыром',
                    },
                    {
                      'name': 'HamBurger',
                      'image': 'assets/images/burger1.png',
                      'price': '399₽',
                      'description': 'Двойная порция мяса с сыром',
                    },
                    {
                      'name': 'ChickenBurger',
                      'image': 'assets/images/burger1.png',
                      'price': '349₽',
                      'description': 'Куриное филе в хрустящей панировке',
                    },
                    {
                      'name': 'BigBurger',
                      'image': 'assets/images/burger1.png',
                      'price': '449₽',
                      'description': 'Большой бургер с двойным сыром',
                    },
                  ];
                  return MenuCard(
                    name: products[index]['name'] ?? '',
                    image: products[index]['image'] ?? '',
                    price: products[index]['price'] ?? '',
                    description: products[index]['description'] ?? '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
