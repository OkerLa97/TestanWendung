import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

// Провайдер для списка товаров в корзине
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

// Класс для управления корзиной
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // Добавить товар в корзину
  void addItem(CartItem item) {
    // Проверяем, есть ли уже такой товар
    final existingIndex = state.indexWhere(
      (cartItem) => cartItem.id == item.id,
    );

    if (existingIndex >= 0) {
      // Если товар уже есть, увеличиваем количество
      final updatedItem = state[existingIndex].copyWith(
        quantity: state[existingIndex].quantity + 1,
      );
      state = [
        ...state.sublist(0, existingIndex),
        updatedItem,
        ...state.sublist(existingIndex + 1),
      ];
    } else {
      // Если товара нет, добавляем новый
      state = [...state, item];
    }
  }

  // Удалить товар из корзины
  void removeItem(String itemId) {
    state = state.where((item) => item.id != itemId).toList();
  }

  // Увеличить количество товара
  void incrementQuantity(String itemId) {
    final index = state.indexWhere((item) => item.id == itemId);

    if (index >= 0) {
      final updatedItem = state[index].copyWith(
        quantity: state[index].quantity + 1,
      );
      state = [
        ...state.sublist(0, index),
        updatedItem,
        ...state.sublist(index + 1),
      ];
    }
  }

  // Уменьшить количество товара
  void decrementQuantity(String ItemId) {
    final index = state.indexWhere((item) => item.id == ItemId);

    if (index >= 0) {
      if (state[index].quantity > 1) {
        final updatedItem = state[index].copyWith(
          quantity: state[index].quantity - 1,
        );
        state = [
          ...state.sublist(0, index),
          updatedItem,
          ...state.sublist(index + 1),
        ];
      } else {
        removeItem(ItemId);
      }
    }
  }

  bool isItemInCart(String itemId) {
    return state.any((item) => item.id == itemId);
  }

  // Получить количество товара в корзине
  int getItemQuantity(String itemId) {
    final item = state.firstWhere(
      (item) => item.id == itemId,
      orElse:
          () => CartItem(
            id: '',
            name: '',
            image: '',
            price: 0,
            description: '',
            quantity: 0,
          ),
    );
    return item.quantity;
  }

  // Очистить корзину
  void clear() {
    state = [];
  }
}

// Провайдер для подсчета общего количества товаров
final cartItemCountProvider = Provider<int>((ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.fold(0, (sum, item) => sum + item.quantity);
});

// Провайдер для подсчета общей суммы
final cartTotalProvider = Provider<double>((ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
});
