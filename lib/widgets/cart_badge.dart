import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';
import '../pages/cart_page.dart';
import '../utils/app_theme.dart';

class CartBadge extends ConsumerWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 👀 СМОТРИМ на состояние корзины
    final itemCount = ref.watch(cartItemCountProvider);
    final cartTotal = ref.watch(cartTotalProvider);

    return Stack(
      children: [
        // 🛒 ОСНОВНАЯ ИКОНКА КОРЗИНЫ
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined, size: 28),
          onPressed: () {
            // 🚀 ПЕРЕХОД К КОРЗИНЕ
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),

        // 🔴 КРАСНЫЙ КРУЖОК С КОЛИЧЕСТВОМ (показываем только если есть товары)
        if (itemCount > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(minWidth: 24, minHeight: 24),
              child: Text(
                '$itemCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
