import 'package:flutter/material.dart';

class ThucHanh02 extends StatefulWidget {
  const ThucHanh02({super.key});

  @override
  State<ThucHanh02> createState() => _ThucHanh02State();
}

class _ThucHanh02State extends State<ThucHanh02> {
  final TextEditingController controller = TextEditingController();
  String errorMessage = '';
  List<int> list = [];

  void taoDanhSach() {
    setState(() {
      list.clear();
      errorMessage = '';

      int? number = int.tryParse(controller.text);

      if (number == null || number <= 0) {
        errorMessage = 'Dữ liệu bạn nhập không hợp lệ';
        return;
      }

      for (int i = 1; i <= number; i++) {
        list.add(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thực hành 2')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Nhập vào số lượng',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: taoDanhSach, child: const Text('Tạo')),
            const SizedBox(height: 12),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        list[index].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
