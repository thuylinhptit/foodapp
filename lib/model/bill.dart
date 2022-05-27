class Bill {
  final String name;
  final int quantity;
  final double price;

  Bill(this.name, this.quantity, this.price);
  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}
