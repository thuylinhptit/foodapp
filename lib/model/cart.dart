class CartItem {
  final int id;
  final int quantity;

  CartItem(this.id, this.quantity);
  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
      };
}
