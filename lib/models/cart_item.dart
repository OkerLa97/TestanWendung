class CartItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    String? description,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => price * quantity;
}
