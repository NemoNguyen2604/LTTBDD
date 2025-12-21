import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NullableDemoPage(),
    );
  }
}

class NullableDemoPage extends StatefulWidget {
  const NullableDemoPage({super.key});

  @override
  State<NullableDemoPage> createState() => _NullableDemoPageState();
}

class _NullableDemoPageState extends State<NullableDemoPage> {
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nullable Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Nhập tên",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  userName = value.isEmpty ? null : value;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              "Xin chào: ${userName ?? "Chưa có tên"}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = null;
                });
              },
              child: const Text("TEST: null"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = "";
                });
              },
              child: const Text("TEST: empty string"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = "Minh";
                });
              },
              child: const Text("TEST: normal name"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName =
                      "Nguyễn Văn A có một cái tên rất rất dài để test UI overflow";
                });
              },
              child: const Text("TEST: long name"),
            ),
          ],
        ),
      ),
    );
  }
}
