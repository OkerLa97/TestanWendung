import 'package:flutter/material.dart';

class CategoryStyle {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  // Конструктор
  const CategoryStyle({
    this.backgroundColor = const Color(
      0xFFE0E0E0,
    ), // Используем константное значение вместо Colors.grey[300]
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.textColor = const Color.fromARGB(255, 109, 101, 101),
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
  });

  // Статический константный стиль, который будет использоваться по умолчанию везде
  static const CategoryStyle defaultStyle = CategoryStyle(
    backgroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    borderRadius: BorderRadius.all(Radius.circular(12)),
    textColor: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  factory CategoryStyle.defaulStyle() {
    return const CategoryStyle();
  }

  factory CategoryStyle.selected() {
    return const CategoryStyle(
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}

class ComponentCategories extends StatelessWidget {
  final CategoryStyle style;
  final String name;

  const ComponentCategories({
    super.key,
    this.style = const CategoryStyle(),
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: style.textColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
        ),
      ),
    );
  }
}
