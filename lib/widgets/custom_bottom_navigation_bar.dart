import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  // Параметры для отслеживания выбранного элемента и обработки нажатий
  final int selectedIndex;
  final Function(int) onTap;

  // Конструктор с обязательными параметрами
  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Высота панели навигации
      height: 80,
      // Оформление панели - красный цвет и закругленные верхние углы
      decoration: BoxDecoration(
        color: Color(0xFFEF4B4B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Stack(
        // Stack позволяет размещать элементы друг над другом
        clipBehavior:
            Clip.none, // Разрешает элементам выходить за границы Stack
        children: [
          // Белая вмятина для центральной кнопки сверху
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
              ),
            ),
          ),
          // Ряд с иконками навигации
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home_outlined, ''),
              _buildNavItem(1, Icons.person_outline, ''),
              SizedBox(width: 40), // Пустое пространство для центральной кнопки
              _buildNavItem(2, Icons.shopping_cart_outlined, ''),
              _buildNavItem(3, Icons.favorite_border, ''),
            ],
          ),
          // Выступающая центральная кнопка с плюсом
          Positioned(
            top: -25, // Выступает за верхнюю границу панели
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
                width: 60,
                // Белый ободок и тень
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(2),
                // Красная кнопка внутри белого ободка
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEF4B4B),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: 30, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Метод для создания элементов навигации
  Widget _buildNavItem(int index, IconData icon, String label) {
    // Проверяем, выбран ли этот элемент
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onTap(index), // Обработчик нажатия
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Иконка элемента навигации
            Icon(icon, color: Colors.white, size: 26),
            // Маленькая точка-индикатор для выбранного элемента
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 4),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
