import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/currency_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer2<CartProvider, CurrencyProvider>(
        builder: (context, cart, currency, _) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }

          final isUSD = currency.currency.name == 'usd';
          final total = cart.totalPrice(isUSD);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final product = cart.items.values.toList()[index];
                    final price = isUSD ? product.priceUSD : product.priceLBP;
                    final currencySymbol = isUSD ? '\$' : 'LBP';

                    return ListTile(
                      title: Text(product.nameEn),
                      subtitle: Text('$price $currencySymbol'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cart.remove(product.id);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total: $total ${isUSD ? '\$' : 'LBP'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
