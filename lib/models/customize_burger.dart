import 'package:flutter/material.dart';
import 'package:burger_shop/utils/app_theme.dart';

class CustomizeBurgerScreen extends StatefulWidget {
  const CustomizeBurgerScreen({super.key});

  @override
  State<CustomizeBurgerScreen> createState() => _CustomizeBurgerScreenState();
}

class _CustomizeBurgerScreenState extends State<CustomizeBurgerScreen> {
  double spicyLevel = 0.7;
  int portionCount = 1;
  double totalPrice = 12.99;

  List<String> selectedToppings = [];
  List<String> selectedSides = [];

  final Map<String, String> toppings = {
    'Tomato': 'assets/images/toppings/tomato.png',
    'Onions': 'assets/images/toppings/onion.png',
    'Pickles': 'assets/images/toppings/pickles.png',
    'Bacons': 'assets/images/toppings/bacons.png',
  };

  final Map<String, String> sideOptions = {
    'Fries': 'assets/images/sides/fries.png',
    'Coleslaw': 'assets/images/sides/coleslaw.png',
    'Salad': 'assets/images/sides/salad.png',
    'Onion': 'assets/images/sides/onions.png',
  };

  void decreasePortionCount() {
    setState(() {
      if (portionCount > 1) portionCount--;
    });
  }

  void increasePortionCount() {
    setState(() {
      portionCount++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void toggleTopping(String name) {
    setState(() {
      if (selectedToppings.contains(name)) {
        selectedToppings.remove(name);
      } else {
        selectedToppings.add(name);
      }
      updateToppingColors();
    });
  }

  void toggleSide(String name) {
    setState(() {
      if (selectedSides.contains(name)) {
        selectedSides.remove(name);
      } else {
        selectedSides.add(name);
      }
    });
  }

  void updateToppingColors() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Убирает тень
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 250,
                      child: Image.asset(
                        'assets/images/main_img.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Text(
                              'BurgerImage',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 32),
                  Container(
                    child: Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Customize',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '  Your Burger to Your Tastes. Ultimate Experience',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Spicy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Mild',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    thumbColor: AppTheme.primaryColor,
                                    activeTrackColor: AppTheme.primaryColor,
                                    inactiveTrackColor: Colors.grey[300],
                                    trackHeight: 4,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 10,
                                    ),
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 1,
                                    value: spicyLevel,
                                    onChanged: (value) {
                                      setState(() {
                                        spicyLevel = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'Hot',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Portion',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: decreasePortionCount,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '$portionCount',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.zero,
                                      onPressed: increasePortionCount,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Toppings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      toppings.keys.map((topping) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          child: _buildToppingItem(
                            topping,
                            toppings[topping]!,
                            selectedToppings.contains(topping),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Side options',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      sideOptions.keys.map((side) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          child: _buildSideItem(
                            side,
                            sideOptions[side]!,
                            selectedSides.contains(side),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToppingItem(String name, String imagePath, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 130,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  name,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
        Container(
          width: 130,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.only(left: 3)),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => toggleTopping(name),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      size: 18,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSideItem(String name, String imagePath, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 130,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  name,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
        Container(
          width: 130,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.only(left: 3)),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => toggleSide(name),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      size: 18,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
