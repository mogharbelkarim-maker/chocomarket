import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Stream<List<Product>> products() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final d = doc.data();
        return Product(
          id: doc.id,
          nameEn: d['nameEn'],
          nameAr: d['nameAr'],
          priceLBP: d['priceLBP'],
          priceUSD: d['priceUSD'],
          unit: d['unit'],
          available: d['available'],
        );
      }).toList();
    });
  }

  Future<void> placeOrder(Map<String, dynamic> order) async {
    await _db.collection('orders').add(order);
  }
}
