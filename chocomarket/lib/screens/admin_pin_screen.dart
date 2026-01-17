import 'package:flutter/material.dart';
import 'admin_orders_screen.dart';

class AdminPinScreen extends StatefulWidget {
  const AdminPinScreen({super.key});

  @override
  State<AdminPinScreen> createState() => _AdminPinScreenState();
}

class _AdminPinScreenState extends State<AdminPinScreen> {
  final pinCtrl = TextEditingController();
  final adminPin = '1234'; // CHANGE THIS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: pinCtrl,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Admin PIN',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (pinCtrl.text == adminPin) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AdminOrdersScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Wrong PIN')),
                  );
                  pinCtrl.clear();
                }
              },
              child: const Text('Enter'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pinCtrl.dispose();
    super.dispose();
  }
}
