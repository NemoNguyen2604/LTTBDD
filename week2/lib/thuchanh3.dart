import 'package:flutter/material.dart';

class ThucHanh03 extends StatefulWidget {
  const ThucHanh03({super.key});

  @override
  State<ThucHanh03> createState() => _ThucHanh03State();
}

class _ThucHanh03State extends State<ThucHanh03> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  String result = '';

  void tinhToan(String phepTinh) {
    final a = double.tryParse(aController.text);
    final b = double.tryParse(bController.text);

    if (a == null || b == null) {
      setState(() {
        result = 'Dữ liệu không hợp lệ';
      });
      return;
    }

    double kq;

    switch (phepTinh) {
      case '+':
        kq = a + b;
        break;
      case '-':
        kq = a - b;
        break;
      case '*':
        kq = a * b;
        break;
      case '/':
        if (b == 0) {
          setState(() {
            result = 'Không thể chia cho 0';
          });
          return;
        }
        kq = a / b;
        break;
      default:
        return;
    }

    setState(() {
      result = 'Kết quả: $kq';
    });
  }

  Widget nutPhepTinh(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(60, 60),
      ),
      onPressed: () => tinhToan(text),
      child: Text(text, style: const TextStyle(fontSize: 22)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thực hành 3')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Số thứ nhất',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                nutPhepTinh('+', Colors.red),
                nutPhepTinh('-', Colors.orange),
                nutPhepTinh('*', Colors.purple),
                nutPhepTinh('/', Colors.black),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Số thứ hai',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(result, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
